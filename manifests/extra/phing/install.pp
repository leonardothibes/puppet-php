class php::extra::phing::install
{
	include php::extra::pear
	exec {'php::extra::phing::install':
		command => 'pear install --alldeps pear.phing.info/phing',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/phing',
		require => Class[php::extra::pear],
	}
}
