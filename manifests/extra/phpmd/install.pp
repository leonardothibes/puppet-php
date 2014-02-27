class php::extra::phpmd::install inherits php::extra::pear
{
	$packages = 'php::extra::phpmd::dependencies'
	if !defined(Package[$packages]) {
		package {$packages:
			ensure => present,
			name   => 'php5-imagick',
		}
	}
	exec {'php::extra::phpmd::step-1':
		command => "pear channel-discover pear.phpmd.org",
		path    => "/usr/bin",
		returns => ['0','1'],
		require => [
			Class['php::extra::pear'],
			Package[$packages],
		],
		before  => Exec['php::extra::phpmd::step-2'],
	}
	exec {'php::extra::phpmd::step-2':
		command => "pear channel-discover pear.pdepend.org",
		path    => "/usr/bin",
		returns => ['0','1'],
		require => [
			Class['php::extra::pear'],
			Package[$packages],
		],
		before  => Exec['php::extra::phpmd::step-3'],
	}
	exec {'php::extra::phpmd::step-3':
		command => 'pear install --alldeps phpmd/PHP_PMD',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/phpmd',
		require => [
			Package[$packages],
			Class['php::extra::pear'],
		],
	}
}
