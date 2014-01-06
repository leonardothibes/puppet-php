class php::extra::composer::purge
{
	file {['/usr/bin/composer','/usr/bin/composer.phar']: ensure => absent}
}
