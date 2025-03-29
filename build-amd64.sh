docker image rm jaruba/rpdb-folders-docker-amd64
docker builder prune --all --force
docker buildx build --platform linux/amd64 --provenance false -t jaruba/rpdb-folders-docker-amd64:latest . --push
