# Exporter
## Running the Redis Exporter

`docker-compose up`

## Running containers with rebuild

`docker-compose up --build`

## Get the metrics
`curl http://127.0.0.1:9999/metrics`

or with specified keys


`curl http://127.0.0.1:9999/metrics/clients,keyspace`

## Runnung specs

`cd api && bundle exec rspec`
