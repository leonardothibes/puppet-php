class php::extra::pear
{
	exec {'php::extra::pear::step-1':
		command => 'pear chanel-update pear.php.net',
		path    => '/usr/bin',
		before  => Exec['php::extra::pear::step-2'],
	}

	exec {'php::extra::pear::step-2':
		command => 'pear config-set auto_discover 1',
		path    => '/usr/bin',
		before  => Exec['php::extra::pear::step-3'],
	}

	exec {'php::extra::pear::step-3':
		command => 'pecl chanel-update pecl.php.net',
		path    => '/usr/bin',
	}
}
