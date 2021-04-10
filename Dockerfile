FROM node:10-alpine

LABEL maintaner="jaruba"
LABEL description="Docker container to run RPDB Folders"

ARG version=0.0.6

RUN apk update && \
    apk --no-cache add git && \
    apk --no-cache add util-linux && \
    apk --no-cache add --virtual builds-deps build-base python

WORKDIR /app

RUN git clone -b main https://www.github.com/jaruba/rpdb-folders.git && \
    mkdir -p /rpdb/config && \
    mkdir -p /rpdb/mounts && \
    cd rpdb-folders && \
    npm install --production

WORKDIR /app/rpdb-folders

VOLUME ["/rpdb/config"]
VOLUME ["/rpdb/mounts"]

EXPOSE 8750
CMD ["npm", "start"]
