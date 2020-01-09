#!/bin/bash
#$1 kafka server:port
#$2 kafka home
#$3 broker.id
#$4 zookeeper.connect
#$5 num.partitions

sed -i "s#^advertised.listeners=.*#advertised.listeners=PLAINTEXT://$1#g" $2/config/server.properties
sed -i "s#^broker.id=.*#broker.id=$3#g" $2/config/server.properties
sed -i "s#^zookeeper.connect=.*#zookeeper.connect=$4#g" $2/config/server.properties
sed -i "s#^num.partitions=.*#num.partitions=$5#g" $2/config/server.properties

