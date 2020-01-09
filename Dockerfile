FROM openjdk:8
ADD ./test.sh ./test.sh

ENV kafkaserver=${kafkaserver:-localhost}

ENTRYPOINT ./test.sh "parameter1${kafkaserver}" secondparam${kafkaserver}

CMD ./test.sh "executing CMD commands${kafkaserver}"