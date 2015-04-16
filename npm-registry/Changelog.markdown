Changelog for psexton/npm-registry Dockerfile
=============================================

0.2.2 (2015-04-16)
------------------

* Reverting to older fork of npm-registry-couchapp code

0.2.1 (2015-04-15)
------------------

* Built off of psexton/couchdb:1.0.0

0.2.0 (2014-12-22)
------------------

* Built off of psexton/couchdb:1.0.0-rc2
* Getting node and npm from nodesource.com instead of debian
* Upgrading to npm-2.x
* Fixing anti-pattern of `apt-get update` and `apt-get install` on separate lines
* Couch config settings live in their own .ini file

0.1.2 (2014-09-11)
------------------

* Rebuilt on psexton/couchdb:0.1.5
* Cleaning up after npm-registry-couchapp install

0.1.1 (2014-07-14)
------------------

* Built on psexton/couchdb:0.1.3 instead of 0.1.2

0.1.0 (2014-07-07)
------------------

* Initial release

