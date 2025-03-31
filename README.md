# RPDB Folders Docker

Docker container to run [RPDB Folders](https://github.com/jaruba/rpdb-folders/).

This container is made to run on x64 and arm64 architectures.

## Usage

`docker run --stop-timeout 10 -v <data path>:/rpdb/config <movies folder path>:/rpdb/mounts/movies -p [<host ip>:]<host port>:8750 jaruba/rpdb-folders-docker`

You can add as many movies / series folders to `/rpdb/mounts` as you need. These folders then become available in the RPDB Folders UI in order to scan them and add [RPDB](https://ratingposterdb.com/) Posters / Backgrounds to them automatically.

## Example

With docker run: (presuming Windows)

`docker run -v G:\rpdb-docker-data:/rpdb/config I:\Movies:/rpdb/mounts/i-movies -p 8750:8750 jaruba/rpdb-folders-docker`

or with Docker Compose:
```yaml
services:
  rpdb-folders:
    container_name: rpdb-folders
    image: jaruba/rpdb-folders-docker:latest
    restart: unless-stopped
    stop_grace_period: 10s
    ports:
      - 8750:8750
    volumes:
      - /path/to/app/data:/rpdb/config
      - /path/to/media/folders:/rpdb/mounts/media
```

Then go to `http://127.0.0.1:8750/` in your browser.
