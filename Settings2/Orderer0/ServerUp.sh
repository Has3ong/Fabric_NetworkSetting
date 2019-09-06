#!/bin/bash

export IMAGE_TAG=1.4.0

docker-compose -f docker-compose-cli.yaml -f docker-compose-kafka.yaml up