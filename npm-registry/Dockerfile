# Starting with a CouchDB container, adds the pieces needed to use that db as an NPM registry
# Follows instructions at <https://github.com/npm/npm-registry-couchapp>
# No auth (be careful!)

FROM psexton/couchdb:1.0.0-rc2
MAINTAINER Paul Sexton <paul@psexton.net>

# Install git and HTTPS support for apt
RUN apt-get update && apt-get install -y git apt-transport-https

# Install node and npm
ADD install_node.sh /root/install_node.sh
RUN ./install_node.sh

# Configure Couch
ADD configure_couch.sh /root/configure_couch.sh
ADD npm-registry-couchapp.ini /root/npm-registry-couchapp.ini
RUN ./configure_couch.sh

# Clone npm-registry-couchapp from github
RUN git clone https://github.com/npm/npm-registry-couchapp

# Install the node package
WORKDIR /root/npm-registry-couchapp
RUN npm install

# Run the scripts to add the design docs & views onto Couch
ADD configure_registry.sh /root/npm-registry-couchapp/configure_registry.sh
RUN ./configure_registry.sh

# Clean up after ourselves
WORKDIR /root
RUN rm install_node.sh
RUN rm configure_couch.sh
RUN rm -r npm-registry-couchapp

