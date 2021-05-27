# HyperShell Docker Host management container
This container implements a Docker container suitable for provisioning the whole Docker-based micro-service runtime by controlling the Docker Host machine.

## Starting with **docker-compose**

Edit `.env` file and replace provided dummy Chaincode ID

```shell
CHAINCODE_ID_NAME=54acec8c9aa84185876e72256d039e32
```
with your real device Chaincode ID.

Simply execute:

```shell
docker-compose up -d
```

## Starting with **docker run**

First, build and push your image (don't forget to use your real hub ID, NOT `myhubname`) :)

```shell
docker build . -t myhubname/hysh-docker-host
docker push myhubname/hysh-docker-host
```

Can be started with (use correct hub ID and Chaincode ID):

```shell
docker run -dit --restart always --name hysh-docker-host -e "CHAINCODE_ID_NAME=1ddec6eeab2e4f2ea289a55c655ad3c3" -v /var/run/docker.sock:/var/run/docker.sock myhubname/hysh-docker-host
```

- The agent identifier is specified using the "CHAINCODE_ID_NAME" environment variable.
- Access to the Docker Host Docker daemon is granted by mounting the Docker socket into the container.
