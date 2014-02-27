class php::extra::phpdoc::install inherits php::dependencies
{
	$packages = 'php::extra::phpdox::dependencies::packages'
	if !defined(Package[$packages]) {
		package {$packages:
			ensure => present,
			name   => 'php5-xsl',
		}
	}
	wget::fetch {'php::extra::phpdoc::install':
		source      => 'http://phpdoc.org/phpDocumentor.phar',
		destination => '/usr/bin/phpDocumentor.phar',
	}
	file {'/etc/profile.d/phpdoc.sh':
		ensure  => present,
		owner   => root,
		group   => root,
		mode    => 0644,
		content => "alias phpdoc='php /usr/bin/phpDocumentor.phar'",
	}
}
