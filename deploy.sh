#!/bin/bash



if [ -z "${1}" ]; then
   version="latest"
else
   version="${1}"
fi

curl -X DELETE -H "Content-Type: application/json" http://localhost:8080/v2/apps/app 
sleep 1
#curl -X POST -H "Content-Type: application/json" http://localhost:8080/v2/apps -d@app_marathon.json

cp -f app_marathon.json app_marathon.json.tmp
sed -i "s/latest/${version}/g" app_marathon.json.tmp

curl -X POST -H "Content-Type: application/json" http://localhost:8080/v2/apps -d@app_marathon.json.tmp
