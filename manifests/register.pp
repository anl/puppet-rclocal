# == Define: rclocal::register
#
# Register a fragment to be placed in /etc/rc.local.
#
# === Parameters
#
# [*content*]
#   Text of /etc/rc.local fragment.
#
# [*priority*]
#   Priority of the /etc/rc.local fragment.
#
# [*source*]
#   File containing the contents of the /etc/rc.local fragment.  If empty,
#   'content' parameter is used instead.
#
# === Examples
#
# rclocal::register { 'nsupdate':
#   content => template('nsupdate/rc.local.fragment.erb')
# }
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2013 Andrew Leonard
#
define rclocal::register($content='', $priority=50, $source=false) {

  if $source {
    concat::fragment{ "rclocal_fragment_${name}":
      target => '/etc/rc.local',
      order  => $priority,
      source => $source,
    }
  } else {
    concat::fragment{ "rclocal_fragment_${name}":
      target  => '/etc/rc.local',
      content => "$content \n",
      order   => $priority,
    }
  }

}
