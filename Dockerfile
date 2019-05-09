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
RUN ulimit -c -m -s -t unlimited; echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; apt-get -y update && apt-get -y install ca-certificates apt-utils nghttp2 curl git dnsutils bsdmainutils && apt-get clean && apt-get autoclean && apt-get remove; INSTALL_DIR=/opt; cd $INSTALL_DIR && git clone https://github.com/mozilla/cipherscan && cd cipherscan && chmod 0700 cipherscan && ln -s ${INSTALL_DIR}/cipherscan/cipherscan /usr/bin/cipherscan; ln -s ${INSTALL_DIR}/cipherscan/cscan.sh /usr/bin/cscan.sh; ln -s ${INSTALL_DIR}/cipherscan/cscan.py /usr/bin/cscan.py; ln -s ${INSTALL_DIR}/cipherscan/analyze.py /usr/bin/analyze.py; cd $INSTALL_DIR; git clone https://github.com/drwetter/testssl.sh;  ln -s $INSTALL_DIR/testssl.sh/testssl.sh /usr/bin/testssl; wget  --no-check-certificate -O /usr/local/bin/curltest https://github.com/centminmod/docker-ubuntu-nghttp2/raw/master/curltest.sh; chmod +x /usr/local/bin/curltest;