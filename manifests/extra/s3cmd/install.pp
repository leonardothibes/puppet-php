class php::extra::s3cmd::install
{
	require wget
	exec {'php::extra::s3cmd::install::step-1':
		command => 'wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | apt-key add -',
		path    => ['/bin','/usr/bin'],
		onlyif  => 'test ! -f /usr/bin/s3cmd',
		before  => Exec['php::extra::s3cmd::install::step-2'],
		require => Class['wget'],
	}
	exec {'php::extra::s3cmd::install::step-2':
		command => 'wget -O /etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list',
		path    => ['/bin','/usr/bin'],
		onlyif  => 'test ! -f /usr/bin/s3cmd',
		require => Exec['php::extra::s3cmd::install::step-1'],
	}
	package {'s3cmd':
		ensure  => present,
		require => Exec['php::extra::s3cmd::install::step-2'],
	}
}
