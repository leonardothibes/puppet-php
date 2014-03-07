class php::extra::phpcs::purge
{
	include php::extra::pear
	exec {'php::extra::phpcs::purge':
		command => 'pear uninstall PHP_CodeSniffer',
		path    => '/usr/bin',
		onlyif  => 'test -f /usr/bin/phpcs',
		require => Class[php::extra::pear],
	}
}
