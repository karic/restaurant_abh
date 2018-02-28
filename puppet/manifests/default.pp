$IPs = '*'
exec { 'apt-get update':
    command => '/usr/bin/apt-get update -y'
}

exec { 'apt-get upgrade':
    command => '/usr/bin/apt-get upgrade -y'
}
$packages = ['postgresql', 'postgis', 'postgresql-9.5-postgis-2.2']

package { $packages:
   ensure => "installed",
}

class pgql {
notify { 'Pozvan pgql':
}
service { 'postgresql@9.5-main.service':
  ensure  => running,
  enable  => true,
  require =>  Package[$packages],
}
file { "/etc/postgresql/9.5/main/postgresql.conf":
        ensure  => "present",
        content =>  template('/vagrant/puppet/templates/postgresql.conf.erb') ,
        notify => Service['postgresql@9.5-main.service'],
        require =>  Package[$packages],
}
}


class {'pgql':}
