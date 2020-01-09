FROM openjdk:8
LABEL maintainer="pageyehl@163.com"

#commented out ARG below, which is only siutable for 'docker build' not 'docker run'
#ARG brokerid

ENV kafkaserver=${kafkaserver:-localhost} \
	brokerid=${brokerid:-1} zookeeperconnect=${zookeeperconnect:-localhost:2181} \
	numpartitions=${numpartitions:-3} \
	kafkahome=${kafkahome:-/usr/local/kafka}

RUN mkdir ${kafkahome}
WORKDIR ${kafkahome}

ADD kafka ./

#commented out two run lines below since 'docker run' can NOT pass env into 'FROM MAINTAINER RUN ADD COPY' in docker file
#RUN sed -i "s#^broker.id=.*#broker.id=${brokerid}#g" ./config/server.properties
#RUN sed -i "s#^zookeeper.connect=.*#zookeeper.connect=${zookeeperconnect}#g" ./config/server.properties

#RUN apt-get update
#RUN apt-get install -y vim


ENTRYPOINT ./apply-cfg.sh ${kafkaserver} ${kafkahome} ${brokerid} ${zookeeperconnect} ${numpartitions} && \
			./bin/kafka-server-start.sh ./config/server.properties

EXPOSE 9092
