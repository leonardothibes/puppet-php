class php::extra::phpdoc::purge
{
	include php::extra::pear
	exec {'phpdoc-purge':
		command => 'pear uninstall phpdoc/phpDocumentor-alpha',
		path    => '/usr/bin',
		onlyif  => 'test -f /usr/bin/phpdoc',
		require => Class[php::extra::pear],
	}
}
