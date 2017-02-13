FROM nginx:1.11-alpine

RUN mkdir /media/cached \
    && chown -R nginx /media/cached

COPY ./nginx.conf /etc/nginx/nginx.conf
