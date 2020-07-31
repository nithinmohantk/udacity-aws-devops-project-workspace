#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

USERNAME=$1

# Create dockerpath
dockerpath=${USERNAME}/udacity-boston-housing

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u "${USERNAME}"
docker tag boston-housing $dockerpath:latest

# Step 3:
# Push image to a docker repository
docker image push $dockerpath:latest