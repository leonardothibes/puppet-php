class php::extra::phing::install inherits php::dependencies
{
	wget::fetch {'php::extra::phing::install':
		source      => 'http://www.phing.info/get/phing-latest.phar',
		destination => '/usr/bin/Phing.phar',
		chmod       => 0755,
	}
	file {'/usr/bin/phing':
		ensure => link,
		target => '/usr/bin/Phing.phar',
	}
}
