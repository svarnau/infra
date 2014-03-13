# == Class: lodgeit
#
class lodgeit {
  $packages = [ 'python-imaging',
                'python-jinja2',
                'python-pybabel',
                'python-werkzeug',
                'python-simplejson',
                'python-pygments',
                'drizzle']

  include apache

  include pip
  a2mod { 'proxy':
    ensure => present,
  }
  a2mod { 'proxy_http':
    ensure => present,
  }

  package { $packages:
    ensure => present,
  }

  if ! defined(Package['python-mysqldb']) {
    package { 'python-mysqldb':
      ensure   => present,
    }
  }

  package { 'SQLAlchemy':
    ensure   => present,
    provider => pip,
    require  => Class[pip],
  }

  file { '/srv/lodgeit':
    ensure => directory,
  }

  service { 'drizzle':
    ensure     => running,
    hasrestart => true,
    require    => Package['drizzle'],
  }

  vcsrepo { '/tmp/lodgeit-main':
    ensure   => latest,
    provider => git,
    source   => 'https://git.openstack.org/openstack-infra/lodgeit',
  }

# create initial git DB backup location

  exec { 'create_db_backup':
    command => 'git init /var/backups/lodgeit_db',
    path    => '/bin:/usr/bin',
    onlyif  => 'test ! -d /var/backups/lodgeit_db',
  }

}
