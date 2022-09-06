#!/bin/sh

echo "Docker Reg URL: " + ${env.DOCKER_REGISTRY_URL} + "Docker User: " + ${env.DOCKER_USER} + "Docker pass: " + ${env.DOCKER_PASSWORD}
sudo docker login ${DOCKER_REGISTRY_URL} -u  ${DOCKER_USER} -p ${DOCKER_PASSWORD}

sudo docker build -t ${DOCKER_IMAGE} .
sudo docker build -t ${LATEST_TAG} .

sudo docker push ${DOCKER_IMAGE}
sudo docker push ${LATEST_TAG}

sudo docker image remove ${DOCKER_IMAGE}
sudo docker image remove ${LATEST_TAG}
