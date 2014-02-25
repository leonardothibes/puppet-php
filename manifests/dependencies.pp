class php::dependencies
{
	package {'php::dependencies::packages':
		ensure => present,
		name   => $php::params::packages,
	}
}
