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
class rclocal ( 

	$symlink = $::rclocal::params::symlink,
	$header	=	$::rclocal::params::header,
	$target = $::rclocal::params::target,

	$owner = $::rclocal::params::owner,
	$group = $::rclocal::params::group,
	$mode  = $::rclocal::params::mode,

) inherits ::rclocal::params {


	# On some distros, there is a symlink /etc/rc.d/rc.local -> /etc/rc.local.  If this is the
	# case here, ensure the symlink is present.
	if $symlink == true
	{
		file { '/etc/rc.local':
			ensure	=>	link,
			owner		=>	'root',
			group		=>	'root',
			mode		=>	'777',
			target	=>	$target,
		}
	}


  concat { $target:
    owner => $owner,
    group => $group,
    mode  => $mode,
  }

  concat::fragment { 'rc.local_header':
    target => $target,
    order  => 01,
    source => "puppet:///modules/rclocal/$header"
  }

  concat::fragment { 'rc.local_footer':
    target => $target,
    order  => 99,
    source => 'puppet:///modules/rclocal/footer'
  }
}
