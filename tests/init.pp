# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation errors
# and view a log of events) or by fully applying the test in a virtual environment
# (to compare the resulting system state to the desired state).
#
# Learn more about module testing here: http://docs.puppetlabs.com/guides/tests_smoke.html
#
class {'php':
	modules => ['apc','xdebug','mysql','pgsql','mssql'],
	extra   => [
		'composer',
		'phing',
		'phpdoc',
		'phpdox',
		'phpcpd',
		'phpdcd',
		'phploc',
		'phpmd',
		'phpdepend',
		'phpunit',
		'phpcs',
		's3cmd',
		'hhvm-wrapper',
		'yuicompressor',
	],
	register_globals => 'Off',
	short_open_tag   => 'Off',
	display_errors   => 'Off',
	error_reporting  => 'E_ALL',
	memory_limit     => '512',
}

php::extra::s3cmd::params {'vagrant':
	access_key => 'access',
	secret_key => 'secret',
}

#php::module::install {'apc':}
#php::module::install {'mysql':}
#php::module::install {'pgsql':}
#php::module::install {'mssql':}
#php::module::install {'imagick':}

#php::extra::install {'yuicompressor':}
#php::extra::purge {'yuicompressor':}
