class php::extra::yuicompressor::install inherits php::dependencies
{
	$ver = "2.4.8"
	$url = "https://github.com/yui/yuicompressor/releases/download/v${ver}/yuicompressor-${ver}.jar"
	wget::fetch {'php::extra::yuicompressor::install':
		source      => $url,
		destination => '/usr/bin/yuicompressor.jar',
		chmod       => 0755,
	}
	$resources = 'php::extra::yuicompressor::dependencies'
	if !defined(Package[$resources]) {
		package {$resources:
			ensure => present,
			name   => 'openjdk-6-jre',
		}
	}
	file {'php::extra::yuicompressor::alias-file':
		ensure  => present,
		owner   => root,
		group   => root,
		mode    => 0644,
		path    => '/etc/profile.d/yuicompressor.sh',
		content => "alias yuicompressor='java -jar /usr/bin/yuicompressor.jar'",
	}
}
