class php::extra::phpdoc
{
	include php::extra::pear
	php::module::install {'xsl':}
	exec {'phpdoc-step-1':
		command => 'pear channel-discover pear.phpdoc.org',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/phpdoc',
		require => Class[php::extra::pear],
		before  => Exec['phpdoc-step-2'],
	}
	exec {'phpdoc-step-2':
		command => 'pear install phpdoc/phpDocumentor-alpha',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/phpdoc',
		require => Exec['phpdoc-step-1'],
	}
}
