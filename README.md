rclocal
-------

Configure /etc/rc.local on a Linux system.

License
-------

Apache 2.

Contact
-------

Andrew Leonard:

* @anl on Github
* @da0s1a on Twitter


Example
-------

The following example is for s390x architectures but the example will work for any architcture.

class { "rclocal":}
  rclocal::register { 'line_1': content =>  "", } # blank line
  rclocal::register { 'line_2': content =>  "modprobe vmcp", }
  rclocal::register { 'line_3': content =>  "", }
  rclocal::register { 'line_4': content =>  "chshut halt vmcmd logoff", }
  rclocal::register { 'line_5': content =>  "chshut poff vmcmd logoff", }



Support
-------

Please log tickets and issues on [Github](https://github.com/anl/puppet-rclocal).

