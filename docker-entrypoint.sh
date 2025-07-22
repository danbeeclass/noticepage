#!/bin/sh
# vim:sw=4:ts=4:et

set -e

if [ "${1}" == "start" ]; then
  if [ -n "${1}" ]; then
    echo "############### Run nginx"
    defined_envs=$(printf '${%s} ' $(env | cut -d= -f1))
    envsubst "$defined_envs" < "/etc/nginx/nginx.conf.template" > "/etc/nginx/nginx.conf"
    nginx -g "daemon off;"
  else
    exec "$@"
  fi
else
  exec "$@"
fi

