class php::extra::s3cmd
{
	define params(
		$user            = $title,
		$access_key      = 'ACCESS_KEY',
		$secret_key      = 'SECRET_KEY',
		$bucket_location = 'US'
	) {
		file {"php::extra::s3cmd::params::${user}":
			ensure  => present,
			path    => "/home/${user}/.s3cfg",
			owner   => $user,
			group   => $user,
			mode    => 0600,
			content => template('php/s3cmd/.s3cfg.erb'),
			require => Package['s3cmd'],
		}
	}
}
