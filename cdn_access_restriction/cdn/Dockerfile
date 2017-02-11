FROM openresty/openresty:alpine-fat

RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-jwt && \
    /usr/local/openresty/luajit/bin/luarocks install net-url

COPY nginx.conf restrict.lua /usr/local/openresty/nginx/conf/
