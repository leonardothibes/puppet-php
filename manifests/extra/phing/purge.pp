class php::extra::phing::purge
{
	include php::extra::pear
	exec {'phing-purge':
		command => 'pear uninstall phing/phing',
		path    => '/usr/bin',
		onlyif  => 'test -f /usr/bin/phing',
		require => Class[php::extra::pear],
	}
}
