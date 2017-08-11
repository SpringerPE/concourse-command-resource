# Use phusion/baseimage as base image.
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.22

RUN apt-get update \
    && \
        DEBIAN_FRONTEND=noninteractive \
    && \
        apt-get -y  install \
            bash \
            sudo \
            curl \
            zip \
            jq \
            python-pip \
            openssl \
            ca-certificates \
            openssh-client \
            rsync

# install resource assets
COPY assets/ /opt/resource/

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/bin/bash"]
