# Use docker base image and install git
FROM docker
RUN apk update && apk add git

# Use volume to cache repository
VOLUME /data

# Copy build script and define as default command
ADD build.sh .
RUN chmod +x build.sh
CMD [ "./build.sh" ]
