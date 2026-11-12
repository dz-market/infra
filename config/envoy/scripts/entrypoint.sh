#!/bin/sh
set -eu

envsubst \
  < /etc/envoy/clusters.yml \
  > /etc/envoy/clusters.yml.tmp

mv /etc/envoy/clusters.yml.tmp /etc/envoy/clusters.yml

exec /docker-entrypoint.sh "$@"