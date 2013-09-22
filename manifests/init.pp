# == Class: rclocal
#
# Full description of class rclocal here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { rclocal:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class rclocal {

  concat { '/etc/rc.local':
    owner => 'root',
    group => 'root',
    mode  => '0555', # correct?
  }

  concat::fragment { 'rc.local_header':
    target => '/etc/rc.local',
    order  => 01,
    source => 'puppet:///modules/rclocal/header'
  }

  concat::fragment { 'rc.local_footer':
    target => '/etc/rc.local',
    order  => 99,
    source => 'puppet:///modules/rclocal/footer'
  }
}
