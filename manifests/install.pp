define php::install($etclink = $title)
{
	# PHP packages instalation
	package {$php::params::packages: ensure => $ensure}

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
		require => Package[$php::params::packages],
		before  => Exec['restart-php-ini'],
	}
	php::apache::restart {'restart-php-ini':}
	# PHP.ini definitions

	# PHP.ini link in /etc
	file {'/etc/php.ini':
		ensure  => link,
		target  => "${php::params::confdir}/apache2/php.ini",
		require => Package[$php::params::packages],
	}
	# PHP.ini link in /etc
}
