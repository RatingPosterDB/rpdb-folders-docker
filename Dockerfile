FROM debian:bullseye-slim

LABEL maintainer="jaruba"
LABEL description="Docker container to run RPDB Folders"

ARG version=0.3.3

RUN apt-get update && \
    apt-get install -y unzip && \
    apt-get install -y wget

WORKDIR /app

RUN arch=$(arch | sed s/aarch64/arm64/ | sed s/x86_64/x64/) && \
    wget https://github.com/RatingPosterDB/rpdb-folders/releases/latest/download/linux-rpdb-folders-${arch}.zip && \
    mkdir -p ./rpdb-folders && \
    unzip linux-rpdb-folders-${arch}.zip -d ./rpdb-folders && \
    rm ./linux-rpdb-folders-${arch}.zip && \
    mkdir -p /rpdb/config && \
    mkdir -p /rpdb/mounts && \
    chmod +x ./rpdb-folders/rpdb-folders

WORKDIR /app/rpdb-folders

VOLUME ["/rpdb/config"]
VOLUME ["/rpdb/mounts"]

EXPOSE 8750
CMD ["./rpdb-folders", "--no-browser"]
