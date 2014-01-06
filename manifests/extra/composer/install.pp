class php::extra::composer::install
{
	package {'curl': ensure => present}
	exec    {'composer-step-1':
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
