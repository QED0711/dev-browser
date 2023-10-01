#!/bin/bash
xhost + 
export UID=$(id -u)
docker-compose up -d