# == Class: rclocal
#
# Maintain content of /etc/rc.local on a Linux system.
#
# === Parameters
#
# (none)
#
# === Examples
#
#  include rlocal
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2013 Andrew Leonard
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
