puppet-php
==========

A puppet module to manage PHP.

## Sample Usage
Install PHP and use the provided configuration defaults:
```puppet
node default {
	class {'php':}
}
```
or
```puppet
node default {
	include php
}
```

Install PHP and some modules:
```puppet
class {'php':
	modules => ['apc','mysql','pgsql']
}
```
or
```puppet
class {'php':}
php::module::install{'apc':}
php::module::install{'mysql':}
php::module::install{'pgsql':}
```

Purge modules:
```puppet
php::module::purge{'apc':}
php::module::purge{'xdebug':}
```
or
```puppet
php::module::purge{['apc','xdebug']:}
```

Install PHP and some development tools:
```puppet
class {'php':
	extra => ['code-sniffer','phing','phpdoc','composer','phpunit','s3cmd'],
```
or
```puppet
class {'php':}
php::extra::install {'code-sniffer':}
php::extra::install {'phing':}
php::extra::install {'phpdoc':}
php::extra::install {'phpunit':}
php::extra::install {'composer':}
php::extra::install {'s3cmd':}
```

Purge completly PHP:
```puppet
class {'php':
	ensure => absent
}
```

Contact
-------

Principal developer:
	[Leonardo Thibes](http://leonardothibes.com) => [eu@leonardothibes.com](mailto:eu@leonardothibes.com)

Support
-------

Please log tickets and issues at our [Projects site](https://github.com/leonardothibes/puppet-php/issues)
