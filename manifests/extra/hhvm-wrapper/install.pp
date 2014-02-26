class php::extra::hhvm-wrapper::install inherits php::dependencies
{
	wget::fetch {'php::extra::hhvm-wrapper::install':
		source      => 'https://phar.phpunit.de/hhvm-wrapper.phar',
		destination => '/usr/bin/hhvm-wrapper',
		chmod       => 0755,
	}
}
