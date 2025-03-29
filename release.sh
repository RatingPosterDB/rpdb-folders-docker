docker manifest rm jaruba/rpdb-folders-docker:latest
docker manifest create jaruba/rpdb-folders-docker:latest jaruba/rpdb-folders-docker-arm64:latest jaruba/rpdb-folders-docker-amd64:latest
docker manifest push jaruba/rpdb-folders-docker:latest
