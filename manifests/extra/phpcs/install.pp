class php::extra::phpcs::install inherits php::dependencies
{
	include php::extra::pear
	exec {'php::extra::phpcs::install':
		command => 'pear install --alldeps PHP_CodeSniffer',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/phpcs',
		require => [
			Class['php::dependencies'],
			Class['php::extra::pear'],
		],
	}
}
