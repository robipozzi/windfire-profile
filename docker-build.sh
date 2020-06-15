source setenv.sh

## Remove Angular distribution folder
rm -rf $ANGULAR_DIST_DIR

## Build Angular app for production environment
echo ${cyn}Building Angular app ...${end}
ng build --prod
echo ${cyn}Angular app built${end}
echo

## Delete current Docker image
echo ${cyn}Removing Docker image ...${end}
docker rmi -f $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION
echo ${cyn}Docker image removed${end}
echo

## Build Docker image
echo ${cyn}Building Docker image ...${end}
docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_VERSION .
echo ${cyn}Docker image built${end}

## Remove Angular distribution folder
rm -rf $ANGULAR_DIST_DIR