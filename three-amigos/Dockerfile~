# Starting with couchdb, add elasticsearch and redis

FROM psexton/couchdb
MAINTAINER Paul Sexton <paul@psexton.net>

#
# ELASTICSEARCH
#

# Install from elasticsearch's apt repository
RUN wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/elasticsearch/1.2/debian stable main" >> /etc/apt/sources.list
RUN apt-get -q update # Need to update our local apt-cache for the new source
RUN apt-get -qy install elasticsearch

# Symlink the binary into /usr/local/bin
RUN ln -s /usr/share/elasticsearch/bin/elasticsearch /usr/local/bin

#
# REDIS
#

# Download and build Redis
RUN wget http://download.redis.io/redis-stable.tar.gz -O - | tar -xvz
RUN (cd redis-stable && make)
RUN (cd redis-stable && make test)
RUN (cd redis-stable && make install)

#
# Cleanup
# 

# Now that we've installed it, delete the downloaded dir
RUN rm -rf ~/redis-stable

# We're done, so clean up after apt.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
