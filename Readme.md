# Running the Redis Exporter

## Create a Docker container

`docker build --tag exporter .`

## Run a container

`docker run -p 80:4567 exporter`

## Get the metrics

`curl http://127.0.0.1/metrics`

## Runnung the tests

`bundle exec rspec`
