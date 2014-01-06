class php::extra::phpunit::purge
{
	file {'/usr/bin/phpunit': ensure => absent}
}
