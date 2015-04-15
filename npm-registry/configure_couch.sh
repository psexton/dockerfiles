#!/bin/bash

# Most settings are in a .ini file.
# Move it into couch's local.d/
# Also set the permissions and ownership to match couch's local.ini
chmod 644 ./*.ini
chown couchdb:couchdb ./*.ini
mv ./npm-registry-couchapp.ini /usr/local/etc/couchdb/local.d

## Start Couch
/etc/init.d/couchdb start

# Wait for it to spin up
sleep 5

## Write the remaining settings RESTfully

# Create a database for the registry
curl -X PUT localhost:5984/registry

# We need to create an admin user too, or npmregistry's start, load, & copy scripts will break
curl -X PUT localhost:5984/_config/admins/docker -d '"p4ssw0rd"'

## Shut down Couch
/etc/init.d/couchdb stop
