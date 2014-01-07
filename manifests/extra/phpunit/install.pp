class php::extra::phpunit::install
{
	wget::fetch {'php::extra::phpunit::install::step-1':
		source      => 'https://phar.phpunit.de/phpunit.phar',
		destination => '/usr/bin/phpunit',
		before      => Exec['php::extra::phpunit::install::step-2'],
	}
	exec {'php::extra::phpunit::install::step-2':
		command => 'chmod 755 /usr/bin/phpunit',
		path    => '/bin/',
	}
}
