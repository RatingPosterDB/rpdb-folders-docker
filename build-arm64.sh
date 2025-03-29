docker image rm jaruba/rpdb-folders-docker-arm64
docker builder prune --all --force
docker buildx build --platform linux/arm64 --provenance false -t jaruba/rpdb-folders-docker-arm64:latest . --push
