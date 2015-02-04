class rclocal::params {

  # The /etc/rc/rc.local (provided by initscripts RPM) is different for S390[x] architectures
  case "${::architecture}" {

    's390x': { $rclocal_header = 'header.s390x' }
    default: { $rclocal_header = 'header' }

  }  


}
