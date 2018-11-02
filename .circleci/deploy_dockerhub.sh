#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$CIRCLE_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$CIRCLE_BRANCH"
fi
docker build -f Dockerfile -t "$REPO_SLUG":$TAG .
docker push "$REPO_SLUG"
