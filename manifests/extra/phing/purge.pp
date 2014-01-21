class php::extra::phing::purge
{
	file {['/usr/bin/phping','/usr/bin/Phing.phar']: ensure => absent}
}
