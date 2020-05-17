# docker-gridsome-cli

Docker image for [Gridsome CLI](https://gridsome.org/docs/#1-install-gridsome-cli-tool) to use as build container.

Image on dockerhub: https://hub.docker.com/r/crowdcode/gridsome-cli/

Currently, this image uses node v11.7.0 (npm 6.5.0), vue-cli 3.3.0 and Debian stretch as base distribution.

## Example Usage

```
docker run -it --rm -v "$PWD":/workspace crowdcode/gridsome-cli vue create vuedemo
cd vuedemo
docker run -it --rm -p 8080:8080 -v "$PWD":/workspace crowdcode/gridsome-cli npm run serve
```


To run the Gridsome CLI development server from docker you need to map the port and instruct Gridsome CLI to listen on all interfaces.
For example use
```
cd vuedemo
docker run -u $(id -u) --rm -p 4200:4200 -v "$PWD":/workspace crowdcode/gridsome-cli gridsome develop --host 0.0.0.0
```

If you want to clone additional git repositories, f.e. from package.json, and you run with a different user than uid 1000 you need to mount the passwd since git requires to resolve the uid.

```
docker run -u $(id -u) --rm -p 4200:4200 -v /etc/passwd:/etc/passwd -v "$PWD":/app crowdcode/gridsome-cli npm install
```

# Credits

- This image is inspired by [docker-ng-cli](https://github.com/trion-development/docker-ng-cli) by [everflux](https://github.com/everflux)
