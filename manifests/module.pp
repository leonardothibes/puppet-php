class php::module
{
	define install($module = $title)
	{
		if $module == 'apc' {
			$modulename = 'php-apc'
		} else {
			$modulename = "php5-${module}"
		}
		if !defined(Package[$modulename]) {
			package {$modulename:
				ensure => present,
				before => Exec["restart-${modulename}"],
			}
			php::apache::restart {"restart-${modulename}":}
		}
	}

	define purge($module = $title)
	{
		if $module == 'apc' {
			$modulename = 'php-apc'
		} else {
			$modulename = "php5-${module}"
		}
		package {$modulename: ensure => absent}
	}
}
