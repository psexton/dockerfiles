# Starting with an NPM registry, install go 1.4

FROM psexton/npm-registry:0.2.1
MAINTAINER Paul Sexton <paul@psexton.net>

# Install go
RUN (cd /usr/local && curl https://storage.googleapis.com/golang/go1.4.linux-amd64.tar.gz | tar -xz)

# Use /root/go as the workspace
ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH /root/go

