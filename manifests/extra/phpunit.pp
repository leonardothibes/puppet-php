class php::extra::phpunit
{
	wget::fetch {'wget-phpunit':
		source      => 'https://phar.phpunit.de/phpunit.phar',
		destination => '/usr/bin/phpunit',
		before      => Exec['chmod-phpunit'],
	}
	exec {'chmod-phpunit':
		command => 'chmod 755 /usr/bin/phpunit',
		path    => '/bin/',
	}
}
