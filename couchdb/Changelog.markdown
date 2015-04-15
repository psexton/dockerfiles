Changelog for psexton/couchdb Dockerfile
========================================

1.0.0 (2015-04-15)

* Upgrading to Ubuntu 14.04.2 as base image.

1.0.0-rc2 (2014-12-22)

* Upgrading to Ubuntu 14.04.1 as base image.
* Tested/patched for shellshock vulnerabilities
* Fixing anti-pattern of `apt-get update` and `apt-get install` on separate lines
* Adding `couchdb` as default CMD.

1.0.0-rc1 (2014-12-21)
------------------

* Upgrading Couch from 1.6.0 to 1.6.1

0.1.5 (2014-09-11)
------------------

* Cleans up after the couchdb install better
* Creates home directory /var/couchdb

0.1.4 (2014-07-25)
------------------

* Runs `make test` in between `make` and `make install`
* Deletes couchdb tarball and build dir after installation

0.1.3 (2014-07-08)
------------------

* Couchdb user is a system user instead of a normal user.
* Couchdb user's full name changed from "CouchDB Admin" to "CouchDB daemon"

0.1.2 (2014-06-30)
------------------

* Uses couchdb user/group instead of root.
* `/etc/init.d` hooks fixed.

0.1.1 (2014-06-25)
------------------

* Overrides Couch's bind_address in `local.ini` instead of in `default.ini`
* Sets a home directory for root at `/root`
* Downloads and builds Couch in `/root` instead of in `/`
* Runs `apt-clean` when we finish

0.1.0 (2014-06-24)
------------------

* Initial release

