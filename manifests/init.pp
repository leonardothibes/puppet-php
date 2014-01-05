class php(
  $ensure                  = $php::params::ensure,
  $etclink                 = $php::params::etclink,
  $modules                 = $php::params::modules,
  $extra                   = $php::params::extra,
  $error_reporting         = $php::params::error_reporting,
  $display_errors          = $php::params::display_errors,
  $html_errors             = $php::params::html_errors,
  $log_errors              = $php::params::log_errors,
  $error_log               = $php::params::error_log,
  $short_open_tag          = $php::params::short_open_tag,
  $asp_tags                = $php::params::asp_tags,
  $allow_url_fopen         = $php::params::allow_url_fopen,
  $allow_url_include       = $php::params::allow_url_include,
  $default_mimetype        = $php::params::default_mimetype,
  $default_charset         = $php::params::default_charset,
  $date_timezone           = $php::params::date_timezone,
  $include_path            = $php::params::include_path,
  $mysql_default_socket    = $php::params::mysql_default_socket,
  $max_execution_time      = $php::params::max_execution_time,
  $max_input_time          = $php::params::max_input_time,
  $memory_limit            = $php::params::memory_limit,
  $post_max_size           = $php::params::post_max_size,
  $default_socket_timeout  = $php::params::default_socket_timeout,
  $file_uploads            = $php::params::file_uploads,
  $upload_max_filesize     = $php::params::upload_max_filesize,
  $max_file_uploads        = $php::params::max_file_uploads,
  $upload_tmp_dir          = $php::params::upload_tmp_dir,
  $session_auto_start      = $php::params::session_auto_start,
  $session_name            = $php::params::session_name,
  $session_save_path       = $php::params::session_save_path,
  $session_gc_maxlifetime  = $php::params::session_gc_maxlifetime,
  $soap_wsdl_cache_enabled = $php::params::soap_wsdl_cache_enabled,
  $soap_wsdl_cache_dir     = $php::params::soap_wsdl_cache_dir,
  $soap_wsdl_cache_ttl     = $php::params::soap_wsdl_cache_ttl,
  $soap_wsdl_cache_limit   = $php::params::soap_wsdl_cache_limit,
  $expose_php              = $php::params::expose_php,
  $register_globals        = $php::params::register_globals,
  $disable_classes         = $php::params::disable_classes,
  $disable_functions       = $php::params::disable_functions,
) inherits php::params {

    case $ensure {
        'present': {

			# PHP packages instalation
			package {$php::params::packages: ensure => $ensure}

			# PHP modules instalation
			php::module::install {$modules:}

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
			if $etclink == true {
				file {'/etc/php.ini':
					ensure  => link,
					target  => "${php::params::confdir}/apache2/php.ini",
					require => Package[$php::params::packages],
				}
			} else {
				file {'/etc/php.ini': ensure => absent}
			}
			# PHP.ini link in /etc

			# Extra PHP tools instalation
			php::extra::install {$extra:}
        }   
        'absent': {
            include php::uninstall
        }   
        default: {
            fail("Unsupported option for \"ensure\" param: ${ensure}")
        }   
    }
}
