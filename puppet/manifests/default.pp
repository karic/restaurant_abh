Exec { path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/', '/opt/play/', '/opt/gecko/', '/usr/local/bin'] }

$packages = ['default-jre', 'default-jdk', 'postgis', 'postgresql-9.5-postgis-2.2', 'ruby2.3', 'firefox', 'xvfb', 'ruby2.3-dev', 'postgresql-server-dev-all', 'libpqxx-dev', 'unzip' ]
include apt

package { $packages:
ensure      => 'installed'
}->


class { 'postgresql::server':
}->

postgresql::server::db { 'restaurant_abh':
  user     => 'abh',
  password => postgresql_password('abh', 'password'),
}
->
postgresql::server::database_grant { 'restaurant_abh':
  privilege => 'ALL',
  db        => 'restaurant_abh',
  role      => 'abh',
}
->
exec { "psql -d restaurant_abh -c 'CREATE EXTENSION postgis;'":
  user     => "postgres",
  unless   => "psql -d restaurant_abh -c '\\dx' | grep postgis",
}
->
exec { "psql -d restaurant_abh -c 'CREATE EXTENSION postgis_topology;'":
  user     => "postgres",
  unless   => "psql -d restaurant_abh -c '\\dx' | grep postgis_topology",
}

$pg_driver="org.postgresql.Driver"
$pg_url="jdbc:postgresql://127.0.0.1:5432/restaurant_abh"
$pg_user="abh"
$pg_password="password"

file { '/vagrant/conf/application.conf':
  ensure =>  file,
  content => template('restaurant_abh/application.conf.erb'),
}


class { 'playframework':
}

$npm_packages = ['ember-cli', 'bower']

class { 'nodejs':
 #repo_url_suffix           => '9.x',
 #manage_package_repo       => true,
  nodejs_dev_package_ensure => 'present',
  nodejs_package_ensure     => 'present',
  npm_package_ensure        => 'present',
}
->
file { '/usr/bin/node':
  ensure => link,
  target => '/usr/bin/nodejs',
}
->
package { $npm_packages:
  ensure   => 'present',
  provider => 'npm',
}->


exec { 'bower-install':
  command => "bower install",
  cwd     => "/vagrant/ember/restaurant_abh",
  user    => vagrant,
}->
class { 'nodeinstall':} ->

class { 'buildember':} ->

exec { 'run-activator':
  command => "activator stage",
  cwd     => "/vagrant/",
  timeout => 1800,
}
->
file { '/vagrant/target/universal/stage/bin/restaurant_abh':
  ensure => file,
  mode   => '0755',
}
->
file { '/etc/systemd/system/restaurant_abh.service':
  ensure => file,
  source => "puppet:///modules/restaurant_abh/restaurant_abh.service",
}
->
service { 'restaurant_abh.service':
  ensure   => running,
  enable   => true,
  require  => Exec['run-activator'],
  subscribe => File["/vagrant/target/universal/stage/bin/restaurant_abh"],

}

->
file {'/var/run/activator':
  ensure => directory,
  owner  =>  vagrant,
}

file {'/etc/tmpfiles.d/activator.conf':
  ensure =>  file,
  content => "d! /var/run/activator 744 vagrant vagrant - -",
}


exec {'bundle install':
  cwd  => '/vagrant/test/Functional_tests',
  user =>  vagrant,
}

class {'geckoinstall':}

class geckoinstall{

  download_uncompress {'Download-gecko':
     distribution_name => "http://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-linux64.tar.gz",
     dest_folder       => '/opt/gecko',
     creates           => '/opt/gecko/geckodriver',
     uncompress        => 'tar.gz',
  }->

  file { 'optgeckoexists':
    path    => '/opt/gecko/geckodriver',
    ensure  => file,
    owner   => vagrant,
    group   => vagrant,
    mode    => '0755',
  }
  
  exec { 'bundleinstalltest':
    command => 'bundle install',
    cwd     => '/vagrant/test/Functional_tests',
    user    => vagrant,
  }

}

class playframework{


  download_uncompress {'Download-activator':
   distribution_name => "http://downloads.typesafe.com/typesafe-activator/1.3.2/typesafe-activator-1.3.2-minimal.zip",
   dest_folder       => '/opt/play',
   creates           => "/opt/play",
   uncompress        => 'zip',
  } ->
  
  file { '/opt/play':
    ensure  => directory,
    recurse => true,
    owner   => vagrant,
    group   => vagrant,
    mode    => '0755',
    source  => '/opt/play/activator-1.3.2-minimal/',
  }
}


class nodeinstall{

  exec{ 'npm-install':
    command => 'npm install',
    cwd     => '/vagrant/ember/restaurant_abh/',
    user    => vagrant,
    timeout => 1800,
  }

  ###file{ '/home/vagrant/rabh':
  ###  ensure => directory,
  ###  owner  => vagrant,
  ###  group  => vagrant,
  ###}->

  ###file{ '/home/vagrant/rabh/node_modules':
  ###  ensure => directory,
  ###  owner  => vagrant,
  ###  group  => vagrant,
  ###}->

  ###file { '/home/vagrant/rabh/package.json':
  ###  source => '/vagrant/ember/restaurant_abh/package.json',
  ###  owner  => vagrant,
  ###  group  => vagrant,
  ###}->

  ###exec{ 'npm-install':
  ###  command => 'npm install',
  ###  cwd     => '/home/vagrant/rabh/',
  ###  user    => vagrant,
  ###  timeout => 900,
  ###}->

  ###file { '/vagrant/ember/restaurant_abh/node_modules':
  ###  ensure => directory,
  ###  source => '/home/vagrant/rabh/node_modules',
  ###  recurse => true,
  ###  owner  => vagrant,
  ###  group  => vagrant,
  ###}


}

class buildember{
  exec { 'ember build -prod':
    user => vagrant,
    cwd  => '/vagrant/ember/restaurant_abh',
  }->


  file { '/vagrant/public/ember':
    ensure  => directory,
    source  => '/vagrant/ember/restaurant_abh/dist',
    recurse => true,
  }->

  
  file { '/vagrant/app/views/index.scala.html':
    ensure =>  file,
    source => '/vagrant/public/ember/index.html',
  }
}

class runtests{

}




