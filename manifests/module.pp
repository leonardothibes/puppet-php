class php::module
{
	define install($module = $title)
	{
		case $module {
			'apc'  : {$modulename = 'php-apc'       }
			'mssql': {$modulename = 'php5-sybase'   }
			default: {$modulename = "php5-${module}"}
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
		case $module {
			'apc'  : {$modulename = 'php-apc'       }
			'mssql': {$modulename = 'php5-sybase'   }
			default: {$modulename = "php5-${module}"}
		}
		package {$modulename: ensure => absent}
	}
}
