# docker-gridsome-cli

Docker image for [Gridsome CLI](https://gridsome.org/docs/#1-install-gridsome-cli-tool) to use as build container.

Image on dockerhub: https://hub.docker.com/r/crowdcode/gridsome-cli/

## Example Usage

```
docker run -it --rm -v "$PWD":/workspace crowdcode/gridsome-cli gridsome create demo
cd demo
docker run -it --rm -v "$PWD":/workspace crowdcode/gridsome-cli gridsome develop   
```

```
docker run -it --rm -v "$PWD":/workspace crowdcode/gridsome-cli gridsome build   
```

# Credits

- This image is inspired by [docker-ng-cli](https://github.com/trion-development/docker-ng-cli) by [everflux](https://github.com/everflux)
