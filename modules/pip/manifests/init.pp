# Class: pip
#
class pip {
  include pip::params

  package { $::pip::params::python_devel_package:
    ensure => present,
  }

  package { $::pip::params::python_pip_package:
    ensure  => present,
    require => Package[$::pip::params::python_devel_package]
  }

}
