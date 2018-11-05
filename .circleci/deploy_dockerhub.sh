#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$CIRCLE_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$CIRCLE_BRANCH"
fi
CIRCLE_SLUG=$CIRCLE_PROJECT_USERNAME"/"$CIRCLE_PROJECT_REPONAME
docker build -f Dockerfile -t "$CIRCLE_SLUG":$TAG .
docker push "$CIRCLE_SLUG"
