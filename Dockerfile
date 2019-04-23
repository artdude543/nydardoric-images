# ----------------------------------
# Nydardoric: Custom Docker
# Environment: glibc
# ----------------------------------
FROM        node:10-alpine

LABEL       author="Kieron Richardson" maintainer="artdude543@hotmail.co.uk"

RUN         apk add --no-cache --update libc6-compat ffmpeg git python build-base \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
