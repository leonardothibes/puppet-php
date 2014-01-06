class php::extra
{
	define install($extra = $title)
	{
		$install = "php::extra::${extra}::install"
		include $install
	}

	define purge($extra = $title)
	{
		$install = "php::extra::${extra}::purge"
		include $install
	}
}
