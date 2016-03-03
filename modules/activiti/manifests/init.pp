class activiti {
  $version = '5.19.0.2'
  $target = '/var/lib/tomcat7/webapps/activiti-explorer.war'

  $uri = "https://github.com/Activiti/Activiti/releases/download/${version}/activiti-${version}.zip"

  package { 'unzip':
    ensure => latest,
    require => Exec['apt-get update'],
  }

  exec { "wget_activiti":
    path => "/bin:/usr/bin",
    timeout     => 1800,
    command => "wget $uri -qO /home/vagrant/activiti.zip",
  }

  exec { "unzip_activiti":
    subscribe => Exec["wget_activiti"],
    refreshonly => true,
    path => "/bin:/usr/bin",
    command => "unzip /home/vagrant/activiti.zip -d /home/vagrant",
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


}

