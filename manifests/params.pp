class rclocal::params {

	$owner = 'root'
	$group = 'root'
	$mode	 = '744'

  # The /etc/rc/rc.local (provided by initscripts RPM) is different for S390[x] architectures
  case "${::architecture}" {

		# Here we choose RHEL6 or RHEL7 file to present for rc.local
    's390x': { $header = "header.s390x-rhel${::operatingsystemmajrelease}" }
    default: { $header = 'header' }

  }  

	case $::osfamily {

		'RedHat':	{ 

			$target = '/etc/rc.d/rc.local' 
			$symlink = true

			}

			default:	{ fail ("Unsupported osfamily, \'${::osfamily}\' in ${module_name}") }

	}

}
