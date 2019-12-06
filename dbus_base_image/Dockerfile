FROM java:8-jre
###################
## base image for dbus runtime envirment
## refence: https://bridata.github.io/DBus/install-base-components.html
###################
LABEL MAINTAINER="bluebirdyan"
##### common env
## RUN mkdir /app/dbus && cd /app/dbus
ENV DBUS_HOME=/app/dbus/
# ENV NODE_ID: pass from docker run env parameter: -e NODE_ID=1...
##### zookeeper
# 1. 分别配置dbus-n1、dbus-n2、dbus-n3的/app/dbus/zookeeper-3.4.8/conf/zoo.cfg文件
RUN mkdir -p ${DBUS_HOME} \
    && wget http://archive.apache.org/dist/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz \
    && tar -xzf zookeeper-3.4.8.tar.gz -C ${DBUS_HOME}/ \
    && rm -f ./zookeeper-3.4.8.tar.gz
ADD ./zookeeper/zoo.cfg ${DBUS_HOME}/zookeeper-3.4.8/conf/zoo.cfg
# 2.分别在dbus-n1、dbus-n2、dbus-n3的/data/zookeeper-data/目录下执行如下命令：
RUN mkdir -p /data/zookeeper-data/ && echo ${NODE_ID} > /data/zookeeper-data/myid


##### Storm runtime

RUN wget https://www.apache.org/dyn/closer.lua/storm/apache-storm-2.1.0/apache-storm-2.1.0.tar.gz \
    && tar -xzf ./apache-storm-2.1.0.tar.gz -C ${DBUS_HOME}/ 
ADD ./storm/worker.xml /app/dbus/apache-storm-1.0.1/log4j2/worker.xml
ADD ./storm/storm.yaml ${DBUS_HOME}/apache-storm-1.0.1/conf/

##### Kafka runtime
RUN wget https://archive.apache.org/dist/kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz \
    && tar -xzf kafka_2.11-0.10.0.0.tgz -C ${DBUS_HOME}/
ADD ./kafka/server.properties ${DBUS_HOME}/kafka_2.11-0.10.0.0/config/server.properties
### kafka management
ADD ./kafka/kafka-manager-1.3.3.7.zip ${DBUS_HOME}/
RUN cd ${DBUS_HOME} && unzip ./kafka-manager-1.3.3.7.zip ./ && rm ./kafka-manager-1.3.3.7.zip