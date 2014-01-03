class php::params
{
	# Install options
	$ensure  = "present"
	$confdir = "/etc/php5"
	$inilink = true
	# Install options

	# PHP.INI options (errors)
	$error_reporting         = "E_ALL | E_STRICT"
	$display_errors          = "On"
	$html_errors             = "On"
	$log_errors              = "On"
	$error_log               = "/var/log/php.log"
	# PHP.INI options (errors)

	# PHP.INI options (compatibility)
	$short_open_tag          = "On"
	$asp_tags                = "Off"
	$allow_url_fopen         = "On"
	$allow_url_include       = "Off"
	$default_charset         = "utf-8"
	$default_mimetype        = "text/html"
	$date_timezone           = "America/Sao_Paulo"
	$include_path            = ".:/usr/share/php"
	$mysql_default_socket    = "/var/run/mysqld/mysqld.sock"
	# PHP.INI options (compatibility)

	# PHP.INI options (limits)
	$max_execution_time      = "30"
	$max_input_time          = "60"
	$memory_limit            = "128"
	$post_max_size           = "8"
	$default_socket_timeout  = "60"
	# PHP.INI options (limits)

	# PHP.INI options (uploads)
	$file_uploads            = "On"
	$upload_max_filesize     = "20"
	$max_file_uploads        = "20"
	$upload_tmp_dir          = "/tmp"
	# PHP.INI options (uploads)

	# PHP.INI options (session)
	$session_auto_start      = "0"
	$session_name            = "SESSID"
	$session_save_path       = "/var/lib/php5"
	$session_gc_maxlifetime  = "1440"
	# PHP.INI options (session)

	# PHP.INI options (soap)
	$soap_wsdl_cache_enabled = "1"
	$soap_wsdl_cache_dir     = "/tmp"
	$soap_wsdl_cache_ttl     = "86400"
	$soap_wsdl_cache_limit   = "5"
	# PHP.INI options (soap)

	# PHP.INI options (security)
	$expose_php              = "Off"
	$register_globals        = "Off"
	$disable_classes         = ""
	$disable_functions       = "pcntl_alarm,pcntl_fork,pcntl_waitpid,pcntl_wait,pcntl_wifexited,pcntl_wifstopped,pcntl_wifsignaled,pcntl_wexitstatus,pcntl_wtermsig,pcntl_wstopsig,pcntl_signal,pcntl_signal_dispatch,pcntl_get_last_error,pcntl_strerror,pcntl_sigprocmask,pcntl_sigwaitinfo,pcntl_sigtimedwait,pcntl_exec,pcntl_getpriority,pcntl_setpriority,"
	# PHP.INI options (security)
}
