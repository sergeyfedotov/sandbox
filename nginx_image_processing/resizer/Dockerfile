FROM openresty/openresty:alpine-fat

RUN apk add --no-cache \
    imagemagick-dev \
    && /usr/local/openresty/luajit/bin/luarocks install magick

RUN mkdir /media/uploaded

COPY ./nginx.conf ./resize.lua /usr/local/openresty/nginx/conf/
