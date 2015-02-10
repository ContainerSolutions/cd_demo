#!/bin/bash

# Zookeeper
docker run -d -p 2181:2181 jplock/zookeeper:3.4.5

# Docker Master

docker run -d -p 5050:5050 -p 8282:8282 -e MESOS_LOG_DIR=/var/log -e MESOS_ZK=zk://localhost:2181/mesos -e MESOS_WORK_DIR=/var/lib/mesos redjack/mesos-master:0.21.0

# Docker Slave
docker run -d -e MESOS_LOG_DIR=/var/log -e MESOS_MASTER=zk://localhost:2181/mesos -e MESOS_EXECUTOR_REGISTRATION_TIMEOUT=5mins	\
						      -e MESOS_ISOLATOR=cgroups/cpu,groups/mem -e MESOS_CONTAINERIZERS=docker,mesos 		\
						      -v /var/run/docker.sock:/run/docker.sock -v /sys:/sys -v /proc:/proc -p 5051:5051 redjack/mesos-slave:0.21.0

