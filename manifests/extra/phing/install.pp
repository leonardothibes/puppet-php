class php::extra::phing::install
{
	include php::extra::pear
	exec {'phing-step-1':
		command => 'pear channel-discover pear.phing.info',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/phing',
		require => Class[php::extra::pear],
		before  => Exec['phing-step-2'],
	}
	exec {'phing-step-2':
		command => 'pear install --alldeps phing/phing',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/phing',
	}
}
