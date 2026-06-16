#!/bin/bash

# Exit on any error
set -e

echo "Starting deployment process..."

# Login to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag images
docker tag $DOCKER_IMAGE_NAME:latest $DOCKER_IMAGE_NAME:$TRAVIS_BUILD_NUMBER
docker tag $DOCKER_IMAGE_NAME:latest $DOCKER_IMAGE_NAME:build-$TRAVIS_BUILD_NUMBER

# Push images
echo "Pushing Docker images..."
docker push $DOCKER_IMAGE_NAME:latest
docker push $DOCKER_IMAGE_NAME:$TRAVIS_BUILD_NUMBER
docker push $DOCKER_IMAGE_NAME:build-$TRAVIS_BUILD_NUMBER

echo "Deployment completed successfully!"

# Optional: Clean up local images to save space
docker rmi $DOCKER_IMAGE_NAME:build-$TRAVIS_BUILD_NUMBER || true

echo "Deployment process finished."
