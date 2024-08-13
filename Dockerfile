FROM ruby:3.2.5-slim
LABEL maintainer="nine.ch <engineering@nine.ch>"

RUN mkdir -p /app /var/lib/gemstash && \
    chmod a+w /var/lib/gemstash
WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN apt-get update -qq  \
    && apt-get install --no-install-recommends -y build-essential pkg-config git libpq-dev libsqlite3-0 \
    && bundle lock --add-platform x86_64-linux \
    && bundle install -j2 --deployment

COPY . /app/

VOLUME /var/lib/gemstash
EXPOSE 9292
CMD [ "/app/bin/start.sh" ]
