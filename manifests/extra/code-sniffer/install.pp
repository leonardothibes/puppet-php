class php::extra::code-sniffer::install
{
	include php::extra::pear
	exec {'code-sniffer':
		command => 'pear install --alldeps PHP_CodeSniffer',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/phpcs',
		require => Class[php::extra::pear],
	}
}
