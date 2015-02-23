#!/bin/bash


#export DOCKER_HOST=172.17.42.1:4242
# requires adding to /etc/hosts the following: 172.17.42.1     docker.local

#pushd jenkins
#docker build -t containersol/jenkins_with_docker .
#popd

if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi


cd nodejs_app
docker build -t localhost:5000/containersol/nodejs_app:${version} .
cd ..
