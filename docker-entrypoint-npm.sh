#!/bin/sh
# Adapted from https://medium.com/@cristian_rivera/cache-rails-bundle-w-docker-compose-45512d952c2d

set -e
mkdir -p "${npm_config_prefix}/lib"
[ `npm -v` = ${NPM_VERSION} ] || npm install -g "npm@${NPM_VERSION}"
npm ls || npm install # --binstubs="$BUNDLE_BIN"
exec "$@"
