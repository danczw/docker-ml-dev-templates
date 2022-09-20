#!/bin/bash
# -----------------------------------------------------------------------------
# bash script to copy docker-compose.yml and convert it to kubernetes yaml files
# -----------------------------------------------------------------------------

GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

# get arguments
while getopts u:s: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        s) scan=${OPTARG};;
    esac
done

# ------------------------------------------------------------------------------
echo "Loging in to Docker hub"
docker login
echo -e "${GREEN}... login to Docker Hub successful${NC}"

# ------------------------------------------------------------------------------
# build docker images from docker-compose.yml
echo "Building docker images ..."
docker-compose build
echo -e "${GREEN}... building images complete${NC}"

# ------------------------------------------------------------------------------
# scan docker images for vulnarabilities
echo "Scanning docker images ..."

if [ -z "$scan" ]
then
    echo -e "${RED}... skipping image scan${NC}"
else
    docker scan py-ml-dev-base
    docker scan py-ml-dev-tf
    docker scan py-ml-dev-huggingtf
    docker scan py-ml-dev-torch
    docker scan py-ml-dev-huggingtorch
    echo -e "${GREEN}... scanning images complete${NC}"
fi

# ------------------------------------------------------------------------------
# push images to docker hub, if username is provided
echo "Pushing images to docker hub ..."

if [ -z "$username" ]
then
    echo -e "${RED}... no username provided, skipping push${NC}"
else
    docker tag py-ml-dev-base:latest $username/py-ml-dev-base:latest
    docker push $username/py-ml-dev-base:latest
    
    docker tag py-ml-dev-tf:latest $username/py-ml-dev-tf:latest
    docker push $username/py-ml-dev-tf:latest
    
    docker tag py-ml-dev-huggingtf:latest $username/py-ml-dev-huggingtf:latest
    docker push $username/py-ml-dev-huggingtf:latest
    
    docker tag py-ml-dev-torch:latest $username/py-ml-dev-torch:latest
    docker push $username/py-ml-dev-torch:latest

    docker tag py-ml-dev-huggingtorch:latest $username/py-ml-dev-huggingtorch:latest
    docker push $username/py-ml-dev-huggingtorch:latest

    echo -e "${GREEN}... pushing images complete${NC}"
fi

# ------------------------------------------------------------------------------
echo -e "${GREEN}Script complete!${NC}"