define download($uri, $timeout = 300) {

}

class activiti {
  $stage = "/home/vagrant/code/activiti-explorer.war"
  $target = '/var/lib/tomcat7/webapps/activiti-explorer.war'

  file { '/tmp':
    ensure => 'directory',
  }



  file { '/var/lib/tomcat7/webapps':
    ensure => "directory",
    owner => "tomcat7",
    group => "tomcat7",
    require => Package["tomcat7"],
  }

  file { $target:
    ensure  => present,
    source  => $stage,
  }


}
