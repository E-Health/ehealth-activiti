class activiti {
  $version = '5.19.0.2'
  $version_mysql = '5.1.38'
  $target = '/var/lib/tomcat7/webapps/activiti-explorer.war'
  $target_rest = '/var/lib/tomcat7/webapps/activiti-rest.war'

  $uri = "https://github.com/Activiti/Activiti/releases/download/${version}/activiti-${version}.zip"
  $uri_mysql = "http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${version_mysql}.zip"

  $db_name=activiti
  $db_password=mysql

  exec { "wget_activiti":
    path => "/bin:/usr/bin",
    timeout     => 1800,
    command => "wget $uri -qO /home/vagrant/activiti.zip",
  }

  exec { "wget_mysql":
    path => "/bin:/usr/bin",
    timeout     => 1800,
    command => "wget $uri_mysql -qO /home/vagrant/mysql.zip",
  }

  exec { "unzip_activiti":
    subscribe => Exec["wget_activiti"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "unzip /home/vagrant/activiti.zip -d /home/vagrant",
  }

  exec { "unzip_mysql":
    subscribe => Exec["wget_mysql"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "unzip /home/vagrant/mysql.zip -d /home/vagrant",
  }

  file { '/var/lib/tomcat7/webapps':
    ensure => "directory",
    owner => "tomcat7",
    group => "tomcat7",
    require => Package["tomcat7"],
  }

  exec { "move_activiti":
    subscribe => Exec["unzip_activiti"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "mv /home/vagrant/activiti-${version}/wars/activiti-explorer.war $target",
  }

  exec { "move_activiti_rest":
    subscribe => Exec["unzip_activiti"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "mv /home/vagrant/activiti-${version}/wars/activiti-rest.war $target_rest",
  }

  exec { "move_mysql":
    subscribe => Exec["unzip_mysql"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "mv /home/vagrant/mysql-connector-java-${version_mysql}/mysql-connector-java-${version_mysql}-bin.jar /home/vagrant/mysql-connector-java-bin.jar",
  }

  exec { "mysql_create_db":
    subscribe => Exec["move_activiti"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot -p$db_password create $db_name",
  }

}

