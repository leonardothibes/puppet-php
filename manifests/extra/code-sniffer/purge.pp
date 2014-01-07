class php::extra::code-sniffer::purge
{
	include php::extra::pear
	exec {'php::extra::code-sniffer::purge':
		command => 'pear uninstall PHP_CodeSniffer',
		path    => '/usr/bin',
		onlyif  => 'test -f /usr/bin/phpcs',
		require => Class[php::extra::pear],
	}
}
