#!/bin/bash

pushd jenkins
docker build -t containersol/jenkins_with_docker .
popd

pushd nodejs_app
docker build -t containersol/nodejs_app .
popd
