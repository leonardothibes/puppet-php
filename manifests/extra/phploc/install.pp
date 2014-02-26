class php::extra::phploc::install inherits php::dependencies
{
	wget::fetch {'php::extra::phploc::install':
		source      => 'https://phar.phpunit.de/phploc.phar',
		destination => '/usr/bin/phploc',
		chmod       => 0755,
	}
}
