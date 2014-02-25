class php::dependencies inherits php::params
{
	$resource = 'php::dependencies::packages'
	if !defined(Package[$resource]) {
		package {$resource:
			ensure => present,
			name   => $php::params::packages,
		}
	}
}
