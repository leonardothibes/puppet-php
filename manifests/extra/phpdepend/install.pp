class php::extra::phpdepend::install inherits php::dependencies
{
	wget::fetch {'php::extra::phpdepend::install':
		source      => 'http://static.pdepend.org/php/latest/pdepend.phar',
		destination => '/usr/bin/phpdepend',
		chmod       => 0755,
	}
}
