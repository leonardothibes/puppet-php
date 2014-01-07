class php::extra::composer::install
{
	if !defined(Package['curl']) {
		package {'curl': ensure => present}
	}
	exec {'php::extra::composer::install':
		command => 'curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin',
		path    => "/usr/bin",
		onlyif  => "test ! -f /usr/bin/composer.phar",
		require => Package['curl'],
	}
	file {'/usr/bin/composer':
		ensure => link,
		target => '/usr/bin/composer.phar',
	}
}
