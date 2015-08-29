#!/bin/bash

chown -R www-data: /var/www/html
chmod -R a+rX /var/www/html

exec supervisord -n

