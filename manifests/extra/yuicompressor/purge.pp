class php::extra::yuicompressor::purge
{
	file {[
		'/usr/bin/yuicompressor',
		'/usr/bin/yuicompressor.jar',
		'/etc/profile.d/yuicompressor.sh',
	]: ensure => absent}
}
