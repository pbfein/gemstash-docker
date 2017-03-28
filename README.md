# Docker Image for Gemstash

This repository contains everything to build a Docker image for [Bundler's Gemstash](https://github.com/bundler/gemstash). With Gemstash you can run your private Rubygems mirror or a gem server to host your private Rubygems.

    docker build -t gemstash .
    docker run -p 9292:9292 -v $(pwd)/gemstash-data:/var/lib/gemstash gemstash

The following environment variables can be used to configure Gemstash:

**DATABASE_URL**: Define a database connection string for the MySQL connection. (`mysql://user:password@localhost/gemstash`)

**MEMCACHED_SERVERS**: Add a Memcached instance to do the caching. (`memcachedserver1:11211`)
