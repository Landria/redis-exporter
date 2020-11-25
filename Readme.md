# Exporter
## Running the Redis Exporter

`docker-compose up`

## Running containers with rebuild

`docker-compose up --build`

## Get the metrics

`curl http://127.0.0.1:4567/metrics`

## Runnung the tests

`cd api && bundle exec rspec`
