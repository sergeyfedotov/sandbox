FROM nginx:1.11-alpine

RUN mkdir -p /var/www/cached \
    && chown -R nginx /var/www/cached

COPY nginx.conf /etc/nginx/nginx.conf
