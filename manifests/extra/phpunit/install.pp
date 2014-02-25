class php::extra::phpunit::install inherits php::extra::pear
{
	php::secure::install {'curl':}
	php::secure::install {'php5-curl':}
	exec {'php::extra::phpunit::step-1':
		command => 'pear install pear.phpunit.de/PHPUnit',
        path    => '/usr/bin',
        onlyif  => 'test ! -f /usr/bin/phpunit',
		creates => '/usr/bin/phpunit',
		before  => Exec['php::extra::phpunit::step-2'],
		require => Class['php::extra::pear'],
	}
	exec {'php::extra::phpunit::step-2':
		command => 'pear install pear.phpunit.de/PHPUnit_Selenium',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/share/php/PHPUnit/Extensions/SeleniumTestCase.php',
		creates => '/usr/share/php/PHPUnit/Extensions/SeleniumTestCase.php',
		before  => Exec['php::extra::phpunit::step-3'],
		require => [
			Class['php::extra::pear'],
			Exec['php::extra::phpunit::step-1'],
			Package['curl','php5-curl'],
		],
	}
	exec {'php::extra::phpunit::step-3':
		command => 'pear install pear.phpunit.de/DbUnit',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/bin/dbunit',
		creates => '/usr/bin/dbunit',
		before  => Exec['php::extra::phpunit::step-4'],
		require => [
			Class['php::extra::pear'],
			Exec['php::extra::phpunit::step-2'],
		],
	}
	exec {'php::extra::phpunit::step-4':
		command => 'pear install pear.phpunit.de/PHP_Invoker',
		path    => '/usr/bin',
		onlyif  => 'test ! -f /usr/share/php/PHP/Invoker.php',
		creates => '/usr/share/php/PHP/Invoker.php',
		before  => Exec['php::extra::phpunit::step-5'],
		require => [
			Class['php::extra::pear'],
			Exec['php::extra::phpunit::step-3'],
		],
	}
	exec {'php::extra::phpunit::step-5':
		command => 'pear install pear.phpunit.de/PHPUnit_Story',
		path    => '/usr/bin',
		onlyif  => 'test ! -d /usr/share/php/PHPUnit/Extensions/Story',
		creates => '/usr/share/php/PHPUnit/Extensions/Story',
		before  => Exec['php::extra::phpunit::step-6'],
		require => [
			Class['php::extra::pear'],
			Exec['php::extra::phpunit::step-4'],
		],
	}
	exec {'php::extra::phpunit::step-6':
		command => 'pear install pear.phpunit.de/PHPUnit_SkeletonGenerator',
		path    => '/usr/bin',
		onlyif  => 'test ! -d /usr/share/php/SebastianBergmann/PHPUnit/SkeletonGenerator',
		creates => '/usr/share/php/SebastianBergmann/PHPUnit/SkeletonGenerator',
		require => [
			Class['php::extra::pear'],
			Exec['php::extra::phpunit::step-5'],
		],
	}
}
