class php::extra::yuicompressor::install inherits php::dependencies
{
	$ver = "2.4.8"
	$url = "https://github.com/yui/yuicompressor/releases/download/v${ver}/yuicompressor-${ver}.jar"
	wget::fetch {'php::extra::yuicompressor::install':
		source      => $url,
		destination => '/usr/bin/yuicompressor',
		chmod       => 0755,
	}
}
