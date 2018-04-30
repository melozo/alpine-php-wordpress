#!/bin/sh

[ -f /run-pre.sh ] && /run-pre.sh

if [ ! -d /DATA/htdocs ]  && [ ! -d /DATA/logs/php-fpm ] ; then
  echo 'Creating the directory htdocs'
  mkdir -p /DATA/htdocs
  chown nginx:www-data /DATA/htdocs
  
  echo 'Creating the directory php-fpm'
  mkdir -p /DATA/logs/php-fpm
  
  if $? -q 0
  then
    php-fpm
  fi
fi

# start nginx
mkdir -p /DATA/logs/nginx
mkdir -p /tmp/nginx
chown nginx /tmp/nginx
nginx
