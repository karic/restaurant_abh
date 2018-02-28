class psql ($listen_address = 'localhost', $db_name = 'restaurant_abh', $db_user = 'abh', $password='password') {
# execute 'apt-get update'
exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
  # apt-get-update???? - Bakri
}
$packages = ['postgresql', 'postgis', 'postgresql-9.5-postgis-2.2']
Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/' }

package { $packages:
   ensure => "installed",
  require => Exec['apt-update'],        # require 'apt-update' before installing
}


service { 'postgresql@9.5-main.service':
  ensure  => running,
  enable  => true,
  require =>  Package[$packages],
}
file { "/etc/postgresql/9.5/main/postgresql.conf":
        ensure  => "present",
        content =>  template('/vagrant/puppet/modules/psql/templates/postgresql.conf.erb') ,
        notify => Service['postgresql@9.5-main.service'],
        require =>  Package[$packages], }

exec { 'create-db':
  command => "sudo -u postgres psql -c \"CREATE DATABASE ${db_name};\" ",
  unless  => "sudo -u postgres psql -lqt | cut -d \\| -f 1 | grep -qw ${db_name};",
}

exec { 'create-extension':
  command =>  "sudo -u postgres psql -c \"CREATE EXTENSION IF NOT EXISTS postgis; CREATE EXTENSION IF NOT EXISTS  postgis_topology;\" ${db_name}",
}

exec { 'create-db-user':
  command => "sudo -u postgres createuser ${db_user}",
  unless => "sudo -u postgres psql postgres -tAc \"SELECT 1 FROM pg_roles WHERE rolname='${db_user}'\" | grep -q 1 ||",
}

exec { 'change-db-user-pw':
  command => "sudo -u postgres psql -c \"alter user ${db_user} with encrypted password '${password}';\" ",
  require =>  Exec['create-db-user'],
}

exec { 'grant-privilages':
  command => "sudo -u postgres psql -c \"grant all privileges on database ${db_name} to ${db_user}; \" " ,
  require =>  Exec['create-db-user'],
}

notify {"Something":}

}
