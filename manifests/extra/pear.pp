class php::extra::pear
{
	exec {'pear-step-1':
		command => 'pear chanel-update pear.php.net',
		path    => '/usr/bin',
		before  => Exec['pear-step-2'],
	}

	exec {'pear-step-2':
		command => 'pear config-set auto_discover 1',
		path    => '/usr/bin',
		before  => Exec['pear-step-3'],
	}

	exec {'pear-step-3':
		command => 'pecl chanel-update pecl.php.net',
		path    => '/usr/bin',
	}
}
