#!/bin/bash

## Start Couch
/etc/init.d/couchdb start

# Wait for it to spin up
sleep 5

# Run the npm-registry-couchapp scripts
npm start --npm-registry-couchapp:couch=http://docker:p4ssw0rd@localhost:5984/registry
npm run load --npm-registry-couchapp:couch=http://docker:p4ssw0rd@localhost:5984/registry
echo -e "yes\n" | npm run copy --npm-registry-couchapp:couch=http://docker:p4ssw0rd@localhost:5984/registry

# Put Couch back in admin party mode
curl -X DELETE docker:p4ssw0rd@localhost:5984/_config/admins/docker

## Shut down Couch
/etc/init.d/couchdb stop
