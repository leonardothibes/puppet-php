class php::extra::phpcpd::install inherits php::dependencies
{
	wget::fetch {'php::extra::phpcpd::install::step-1':
		source      => 'https://phar.phpunit.de/phpcpd.phar',
		destination => '/usr/bin/phpcpd',
		before      => Exec['php::extra::phpcpd::install::step-2'],
	}
	exec {'php::extra::phpcpd::install::step-2':
		command => 'chmod 755 /usr/bin/phpcpd',
		path    => '/bin',
	}
}
