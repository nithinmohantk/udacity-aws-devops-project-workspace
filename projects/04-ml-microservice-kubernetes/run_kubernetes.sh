#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# This is your Docker ID/path
dockerpath=thingxcloud/udacity-boston-housing

# Run the Docker Hub container with kubernetes
kubectl run --generator=run-pod/v1 udacity-boston-housing --image=$dockerpath --port=80

# List kubernetes pods
kubectl wait pods/udacity-boston-housing --for=condition=complete
kubectl get pods

# Forward the container port to a host
kubectl port-forward udacity-boston-housing 8000:80