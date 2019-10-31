# Gitea Builder

This is the source code for a [Docker image](https://hub.docker.com/r/svenpainer/gitea_builder) for building [Gitea](https://gitea.io/).

## Usage

When starting a container with this image, it will automatically build Gitea. You can control the name of the Gitea image as well as the version to build by using the environment variables described below.

**It is important that you mount the host path */var/run/docker.sock* to the container path */var/run/docker.sock* because this is needed to start the image building on the docker host.**

You can mount a named volume at */data* to cache the cloned Gitea repository.

### Environment Variables

You can control the build process with the following environment variables:

Environment Variable | Description
---------------------|------------
GITEA_VERSION        | The version of Gitea to build, e.g. v1.9.5. When building Gitea the tag with this name is checked out. The image will also be named with this tag.
DOCKER_HUB_REPOSITORY | This will be the name of the image (excluding tag).

**Both environment variables are mandatory.**
