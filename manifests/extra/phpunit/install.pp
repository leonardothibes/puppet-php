class php::extra::phpunit::install inherits php::dependencies
{
	include php::extra::pear
	include php::extra::composer::install

	$begin_cmd = "composer global require"
	$end_cmd   = "--working-dir=${php::params::pear}"

	Exec {
		path    => ['/bin','/usr/bin'],
		require => [
			Class['php::extra::pear'],
			Class['php::extra::composer::install'],
		],
	}

	exec {'php::extra::phpunit::step-1':
		command => "${begin_cmd} 'phpunit/phpunit=*' ${end_cmd}",
		onlyif  => "[ ! -d ${php::params::pear}/vendor/phpunit ]",
		before  => Exec ['php::extra::phpunit::step-2'],
	}
	exec {'php::extra::phpunit::step-2':
		command => "${begin_cmd} 'phpunit/dbunit=*' ${end_cmd}",
		onlyif  => "[ ! -d ${php::params::pear}/vendor/phpunit/dbunit ]",
		before  => Exec ['php::extra::phpunit::step-3'],
	}
	exec {'php::extra::phpunit::step-3':
		command => "${begin_cmd} 'phpunit/php-invoker=*' ${end_cmd}",
		onlyif  => "[ ! -d ${php::params::pear}/vendor/phpunit/php-invoker]",
		before  => Exec ['php::extra::phpunit::step-4'],
	}
	exec {'php::extra::phpunit::step-4':
		command => "${begin_cmd} 'phpunit/phpunit-story=*' ${end_cmd}",
		onlyif  => "[ ! -d ${php::params::pear}/vendor/phpunit/phpunit-story]",
		before  => Exec ['php::extra::phpunit::step-5'],
	}
	exec {'php::extra::phpunit::step-5':
		command => "${begin_cmd} 'phpunit/phpunit-selenium=*' ${end_cmd}",
		onlyif  => "[ ! -d ${php::params::pear}/vendor/phpunit/phpunit-selenium]",
		before  => Exec ['php::extra::phpunit::step-6'],
	}
	exec {'php::extra::phpunit::step-6':
		command => "${begin_cmd} 'sebastian/diff=*' ${end_cmd}",
		onlyif  => "[ ! -d ${php::params::pear}/vendor/sebastian/diff ]",
	}

	file {'php::extra::phpunit::link::phpunit':
		ensure => link,
		path   => '/usr/bin/phpunit',
		target => '/usr/share/php/vendor/bin/phpunit',
	}
	file {'php::extra::phpunit::link::dbunit':
		ensure => link,
		path   => '/usr/bin/dbunit',
		target => '/usr/share/php/vendor/bin/dbunit',
	}
}
