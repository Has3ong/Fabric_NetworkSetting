#!/bin/bash

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker volume prune -f
docker ps -a
docker volume ls