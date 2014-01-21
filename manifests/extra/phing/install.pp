class php::extra::phing::install
{
	wget::fetch {'php::extra::phing::install::step-1':
		source      => 'http://www.phing.info/get/phing-latest.phar',
		destination => '/usr/bin/Phing.phar',
		before      => Exec['php::extra::phing::install::step-2'],
	}
	exec {'php::extra::phing::install::step-2':
		command => 'chmod 755 /usr/bin/Phing.phar',
		path    => '/bin',
	}
	file {'/usr/bin/phing':
		ensure => link,
		target => '/usr/bin/Phing.phar',
	}
}
