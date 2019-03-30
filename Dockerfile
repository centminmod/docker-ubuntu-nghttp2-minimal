FROM ubuntu:disco
MAINTAINER George Liu <https://github.com/centminmod/docker-ubuntu-nghttp2-minimal>
# Setup HTTP/2 nghttp2 on Ubuntu 19.x
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/centminmod/docker-ubuntu-nghttp2-minimal.git" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"
RUN ulimit -c -m -s -t unlimited; echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; apt -y update && apt -y install ca-certificates nghttp2 curl testssl.sh dnsutils bsdmainutils && apt clean && apt autoclean && apt remove;