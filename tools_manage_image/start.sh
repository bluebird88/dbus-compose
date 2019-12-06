#! /bin/bash

### start zookeeper
cd ./zookeeper-3.4.8/bin
./zkServer.sh start &

### start kafka
cd ${DBUS_HOME}/kafka_2.11-0.10.0.0
export JMX_PORT=9999;
./kafka-server-start.sh -daemon ../config/server.properties

### start storm
cd ${DBUS_HOME}/apache-storm-1.0.1/bin
./storm supervisor &


