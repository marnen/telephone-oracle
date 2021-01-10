FROM node:15.5-alpine
MAINTAINER Marnen Laibow-Koser <marnen@marnen.org>

# RUN apk --no-cache add build-base git nodejs yarn tzdata

ARG workdir=/telephone-oracle

COPY docker-entrypoint-npm.sh /
ENTRYPOINT ["/docker-entrypoint-npm.sh"]
ENV NPM_VERSION=7.4.0
ENV npm_config_prefix=/npm
ENV npm_config_global=true
ENV PATH="${npm_config_prefix}/bin:${PATH}"

WORKDIR ${workdir}
COPY . ${workdir}/

# EXPOSE ${rails_port}
# ENV PORT ${rails_port}
