class php::extra::phpdoc::install
{
	include php::extra::pear
	php::module::install {'xsl':}
	exec {'php::extra::phpdoc::install':
		command => 'pear install pear.phpdoc.org/phpDocumentor-alpha',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/phpdoc',
		require => Class[php::extra::pear],
	}
}
