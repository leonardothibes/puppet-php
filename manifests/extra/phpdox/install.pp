class php::extra::phpdox::install inherits php::dependencies
{
	$package = 'php5-xsl'
	if !defined(Package[$package]) {
		package {$package: ensure => present}
	}
	wget::fetch {'php::extra::phpdox::install':
		source      => 'http://phpdox.de/releases/phpdox.phar',
		destination => '/usr/bin/phpdox',
		chmod       => 0755,
	}
}
