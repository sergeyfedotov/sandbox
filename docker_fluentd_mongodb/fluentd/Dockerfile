FROM fluent/fluentd:v0.14-onbuild

USER root

RUN apk add --update --virtual .build-deps \
        sudo \
        build-base \
        ruby-dev \
    && sudo -u fluent gem install \
        fluent-plugin-concat:'~> 2.0' \
        fluent-plugin-mongo \
        fluent-plugin-rewrite-tag-filter \
    && sudo -u fluent gem sources --clear-all \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

RUN mkdir /var/log/fluent \
    && chown -R fluent:fluent /var/log/fluent

USER fluent
