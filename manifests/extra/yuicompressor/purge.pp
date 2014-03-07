class php::extra::yuicompressor::purge
{
	file {'/usr/bin/yuicompressor': ensure => absent}
}
