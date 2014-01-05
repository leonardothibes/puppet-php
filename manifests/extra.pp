class php::extra
{
	define install($extra = $title)
	{
		$install = "php::extra::${extra}"
		include $install
	}
}
