# Install XDebug extension with PECL
bin/moodle-docker-compose exec webserver pecl config-set php_ini /usr/local/etc/php/php.ini-development
bin/moodle-docker-compose exec webserver pecl install xdebug


# Set some wise setting for live debugging - change this as needed
read -r -d '' conf <<'EOF'
; Settings for Xdebug Docker configuration
xdebug.mode = debug
; xdebug.client_host = host.docker.internal
xdebug.log = '/var/www/html/xdebug.log'
xdebug.start_with_request = yes
EOF
bin/moodle-docker-compose exec webserver bash -c "echo '$conf' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
bin/moodle-docker-compose exec webserver bash -c "echo xdebug.client_host =  '$IP' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
bin/moodle-docker-compose exec webserver bash -c "echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20200930/xdebug.so' >>  /usr/local/etc/php/php.ini-development"
# Enable XDebug extension in Apache and restart the webserver container
bin/moodle-docker-compose exec webserver docker-php-ext-enable xdebug
bin/moodle-docker-compose exec webserver pecl config-set php_ini /usr/local/etc/php/php.ini-development
bin/moodle-docker-compose restart webserver

