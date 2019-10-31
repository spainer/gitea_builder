#!/bin/sh

# Check environment variables
if [ -z $GITEA_VERSION ]; then
  echo "Environment variable GITEA_VERSION is not set"
  exit 1
fi
if [ -z $DOCKER_HUB_REPOSITORY ]; then
  echo "Environment variable DOCKER_HUB_REPOSITORY is not set"
  exit 1
fi

# Clone or update repository and walk into
cd /data
if [ ! -d gitea ]; then
  git clone https://github.com/go-gitea/gitea.git
  cd gitea
else
  cd gitea
  git fetch
fi

# Checkout right version
git checkout $GITEA_VERSION

# Build docker image
docker build -t $DOCKER_HUB_REPOSITORY -t $DOCKER_HUB_REPOSITORY:$GITEA_VERSION .
