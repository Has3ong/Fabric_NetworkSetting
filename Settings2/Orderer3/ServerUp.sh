#!/bin/bash

export IMAGE_TAG="latest"

docker-compose -f docker-compose-cli.yaml -f docker-compose-kafka.yaml up