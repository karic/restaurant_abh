exec { 'apt-get update':
    command => '/usr/bin/apt-get update -y'
}

exec { 'apt-get upgrade':
    command => '/usr/bin/apt-get upgrade -y'
}

   
Exec { path => '/bin/:/sbin/:/usr/bin/:/usr/sbin/' }
include psql
