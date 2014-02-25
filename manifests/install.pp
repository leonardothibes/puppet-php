define php::install($etclink = $title)
{
	include php::dependencies

	# PHP.ini definitions
	$files = [
		"${php::params::confdir}/cli/php.ini",
		"${php::params::confdir}/apache2/php.ini",
	]
	file {$files:
		ensure  => present,
		content => template('php/php.ini.erb'),
		owner   => root,
		group   => root,
		mode    => 0644,
		require => Class['php::dependencies'],
		before  => Exec['restart-php-ini'],
	}
	php::apache::restart {'restart-php-ini':}
	# PHP.ini definitions

	# PHP.ini link in /etc
	file {'/etc/php.ini':
		ensure  => link,
		target  => "${php::params::confdir}/apache2/php.ini",
		require => Class['php::dependencies'],
	}
	# PHP.ini link in /etc
}
