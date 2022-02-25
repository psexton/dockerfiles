#!/bin/bash

curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
bash ./nodesource_setup.sh

apt-get install -y nodejs

rm nodesource_setup.sh
