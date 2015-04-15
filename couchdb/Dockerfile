# Builds a CouchDB app from source, using ubuntu 14.04.2 LTS as the base
# Use version-pinned Mozilla Spidermonkey 1.8.5
# Listens on all interfaces, not just localhost
# Admin party mode - no auth (be careful!)

FROM ubuntu:14.04.2
MAINTAINER Paul Sexton <paul@psexton.net>

# Set home directory
ENV HOME /root
WORKDIR /root

# Install dependencies
# Using version pinned libmozjs185-dev instead of libmozjs-dev
RUN apt-get update && apt-get install -y curl build-essential autoconf automake libtool erlang libicu-dev libmozjs185-dev libcurl4-openssl-dev

# Download and build CouchDB
RUN curl http://www.eng.lsu.edu/mirrors/apache/couchdb/source/1.6.1/apache-couchdb-1.6.1.tar.gz | tar -xz
RUN (cd apache-couchdb-1.6.1 && ./configure)
RUN (cd apache-couchdb-1.6.1 && make)
RUN (cd apache-couchdb-1.6.1 && make test) 
RUN (cd apache-couchdb-1.6.1 && make install) 

# Make CouchDB listen on all interfaces, not just the local loopback
# Do this in local.ini instead of in default.ini so it persists if Couch gets upgraded
RUN sed -i 's/;bind_address\ =\ 127\.0\.0\.1/bind_address\ =\ 0\.0\.0\.0/' /usr/local/etc/couchdb/local.ini

# Add a couchdb user & group so it's not running as root
# (Adding the user this way because I can't figure out how to pipe in the arguments for chfn to adduser)
# --system means this is a daemon account, not a person account
# --basedir means homedir will be /var/couchdb instead of /home/couchdb
# -U means create a group named couchdb
RUN useradd --system --base-dir /var -U couchdb
# -f means Full Name
RUN chfn -f "CouchDB daemon" couchdb

# Make a home directory for the couchdb user
RUN mkdir /var/couchdb
RUN chown -R couchdb:couchdb /var/couchdb

# Change file ownership to this new user
RUN chown -R couchdb:couchdb /usr/local/etc/couchdb
RUN chown -R couchdb:couchdb /usr/local/lib/couchdb
RUN chown -R couchdb:couchdb /usr/local/share/couchdb
RUN chown -R couchdb:couchdb /usr/local/var/lib/couchdb
RUN chown -R couchdb:couchdb /usr/local/var/log/couchdb
RUN chown -R couchdb:couchdb /usr/local/var/run/couchdb

# This leaves couchdb installed, but not running at startup.

# init.d setup, in case someone wants to start/stop couch that way
RUN ln -s /usr/local/etc/init.d/couchdb /etc/init.d
RUN update-rc.d couchdb defaults

# Export the port
EXPOSE 5984

# Make running couchdb the default command
CMD ["couchdb"]

# We're done, so clean up after apt.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Also cleanup after our couch build
RUN rm -r apache-couchdb-1.6.1


