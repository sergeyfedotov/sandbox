FROM openresty/openresty:alpine-fat

RUN apk add --no-cache \
        imagemagick-dev \
    && /usr/local/openresty/luajit/bin/luarocks install magick

RUN mkdir -p \
        /var/cache/nginx \
        /var/www/uploaded

COPY conf/ /usr/local/openresty/nginx/conf/
COPY html/ /usr/local/openresty/nginx/html/

VOLUME /var/cache/nginx
