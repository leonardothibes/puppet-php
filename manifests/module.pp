class php::module
{
	define install($module = $title)
	{
		if $module == 'apc' {
			$modulename = 'php-apc'
		} else {
			$modulename = "php5-${module}"
		}
		package {$modulename: ensure => present}
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
