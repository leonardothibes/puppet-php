class php::extra::pear inherits php::dependencies
{
	exec {'php::extra::pear::step-1':
		command => 'pear chanel-update pear.php.net',
		path    => '/usr/bin',
		before  => Exec['php::extra::pear::step-2'],
		require => Class['php::dependencies'],
	}

	exec {'php::extra::pear::step-2':
		command => 'pear config-set auto_discover 1',
		path    => '/usr/bin',
		require => Exec['php::extra::pear::step-1'],
		before  => Exec['php::extra::pear::step-3'],
	}

	exec {'php::extra::pear::step-3':
		command => 'pear update-channels',
		path    => '/usr/bin',
		require => Exec['php::extra::pear::step-2'],
	}
}
