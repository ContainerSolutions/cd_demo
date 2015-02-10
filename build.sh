#!/bin/bash

pushd jenkins
docker build -t containersol/jenkins_with_docker .
popd
