class php::extra::phpdox::install inherits php::dependencies
{
	php::module::install {'xsl':}
	wget::fetch {'php::extra::phpdox::install':
		source      => 'http://phpdox.de/releases/phpdox.phar',
		destination => '/usr/bin/phpdox',
		chmod       => 0755,
	}
}
