source ./setenv.sh

## Delete running Docker container
echo ${cyn}Removing $DOCKER_CONTAINER_NAME Docker container ...${end}
docker rm -f $DOCKER_CONTAINER_NAME
echo ${cyn}Docker container removed${end}
echo

## Spin up and run Docker container
echo ${cyn}Running Docker container ...${end}
CONTAINER_CMD_RUN="docker run -p 8080:80 --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION"
echo ${cyn}Running with:${end} ${grn}$CONTAINER_CMD_RUN${end}
$CONTAINER_CMD_RUN