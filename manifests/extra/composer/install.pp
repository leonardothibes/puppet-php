class php::extra::composer::install inherits php::dependencies
{
	$packages = ['git','curl','php5-curl']
	package {'php::extra::composer::dependencies::packages':
		ensure => present,
		name   => $packages,
	}
	exec {'php::extra::composer::install':
		command => 'curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin',
		path    => "/usr/bin",
		onlyif  => "test ! -f /usr/bin/composer.phar",
		require => [
			Package['php::extra::composer::dependencies::packages'],
			Class['php::dependencies'],
		],
	}
	file {'/usr/bin/composer':
		ensure => link,
		target => '/usr/bin/composer.phar',
	}
}
