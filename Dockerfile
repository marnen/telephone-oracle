FROM node:15.5-alpine
MAINTAINER Marnen Laibow-Koser <marnen@marnen.org>

# RUN apk --no-cache add build-base git nodejs yarn tzdata
# WORKDIR /
# RUN wget -O - https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar xjv && \
#   ln -s /phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin

ARG workdir=/telephone-oracle

COPY docker-entrypoint-npm.sh /
ENTRYPOINT ["/docker-entrypoint-npm.sh"]
ENV NPM_VERSION=7.4.0
ENV npm_config_prefix=/npm

WORKDIR ${workdir}
COPY . ${workdir}/
ENV PATH="${workdir}/node_modules/.bin:${npm_config_prefix}/bin:${PATH}"

# EXPOSE ${rails_port}
# ENV PORT ${rails_port}
