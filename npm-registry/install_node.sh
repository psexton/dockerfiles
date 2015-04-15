#!/bin/bash

# Add in a new source for the package
# (Following instructions at <https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#debian-and-ubuntu-based-linux-distributions>)
# Extracted from the script at <https://deb.nodesource.com/setup>
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo 'deb https://deb.nodesource.com/node trusty main' > /etc/apt/sources.list.d/nodesource.list

# Refresh the package cache to include this new source, and then install it
apt-get update && apt-get install -y nodejs

# Still need to upgrade npm from 1.x to 2.x
npm install -g npm

# Now we should have nodejs-0.10.34 (or newer) and npm-2.1.14 (or newer)
