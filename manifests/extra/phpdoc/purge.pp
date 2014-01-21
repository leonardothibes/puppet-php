class php::extra::phpdoc::purge
{
	file {['/usr/bin/phpDocumentor.phar','/etc/profile.d/phpdoc.sh']: ensure => absent}
}
