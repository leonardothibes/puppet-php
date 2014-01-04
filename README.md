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
	modules => ['apc','mysql,'pgsql']
}
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
