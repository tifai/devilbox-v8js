# this file should be mounted into the devilbox's fancy
# /startup.1.d directory

# install v8js.so if we don't already have it
# todo: we should probably get our extension directory from php -i

if [ ! -f "/usr/local/lib/php/extensions/no-debug-non-zts-20170718/v8js.so" ]; then
    cd /tmp \
    && git clone --single-branch --branch devilbox/php-fpm/7.2-work https://github.com/tifai/devilbox-v8js.git \
    && cp -R devilbox-v8js/libv8-7.4 /opt \
    && cp devilbox-v8js/v8js.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718 \
    && echo "extension=v8js.so" > /usr/local/etc/php/conf.d/php-ext-v8js.ini \
    && rm -Rf devilbox-v8js \
    && echo "v8js installed"
fi

