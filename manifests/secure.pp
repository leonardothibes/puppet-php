class php::secure
{
	define install($package = $title)
	{
		if !defined(Package[$package]) {
			package {$package: ensure => present}
		}
	}
}
