class php::extra::phpunit::install inherits php::dependencies
{
	wget::fetch {'php::extra::phpunit::install':
		source      => 'https://phar.phpunit.de/phpunit.phar',
		destination => '/usr/bin/phpunit',
		chmod       => 0755,
	}
}
