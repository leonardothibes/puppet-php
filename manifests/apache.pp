class php::apache
{
	define restart()
	{
		exec {$title:
			command => 'apachectl restart',
			path    => ['/usr/bin','/usr/sbin'],
			onlyif  => 'test -f /usr/sbin/apachectl',
		}
	}
}
