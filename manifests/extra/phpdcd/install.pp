class php::extra::phpdcd::install inherits php::dependencies
{
	wget::fetch {'php::extra::phpdcd::install':
		source      => 'https://phar.phpunit.de/phpdcd.phar',
		destination => '/usr/bin/phpdcd',
		chmod       => 0755,
	}
}
