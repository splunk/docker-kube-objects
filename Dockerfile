FROM fluent/fluentd:v1.1.0

LABEL maintainer="Gimi Liang <zliang@splunk.com>"

# expecting fluent-plugin-splunk-hec & fluent-plugin-kubernetes-objects
COPY *.gem /tmp/

RUN apk update \
 && apk upgrade \
 && apk add --no-cache jq-dev \
 && apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev \
 && gem install fluent-plugin-jq \
 && gem install /tmp/*.gem \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
