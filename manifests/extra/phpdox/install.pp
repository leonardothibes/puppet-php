class php::extra::phpdox::install inherits php::dependencies
{
	$packages = 'php::extra::phpdox::dependencies::packages'
	if !defined(Package[$packages]) {
		package {$packages:
			ensure => present,
			name   => 'php5-xsl',
		}
	}
	wget::fetch {'php::extra::phpdox::install':
		source      => 'http://phpdox.de/releases/phpdox.phar',
		destination => '/usr/bin/phpdox',
		chmod       => 0755,
	}
}
