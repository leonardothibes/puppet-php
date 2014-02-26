class php::extra::phpcpd::install inherits php::dependencies
{
	wget::fetch {'php::extra::phpcpd::install':
		source      => 'https://phar.phpunit.de/phpcpd.phar',
		destination => '/usr/bin/phpcpd',
		chmod       => 0755,
	}
}
