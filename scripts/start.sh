#!/bin/bash

VHOST_CONF_FILE_PATH="/vhosts/local_vhost.conf"

if [[ ! -z "${NGINX_VHOST_FILE_PATH}" ]]; then
    VHOST_CONF_FILE_PATH="${NGINX_VHOST_FILE_PATH}"
fi

echo $VHOST_CONF_FILE_PATH

if [ ! -f $VHOST_CONF_FILE_PATH ]; then
    echo "Config file not found!"
    exit 1
fi

cp $VHOST_CONF_FILE_PATH /etc/nginx/conf.d/default.conf

/etc/init.d/php7.1-fpm restart && nginx -g 'daemon off;'