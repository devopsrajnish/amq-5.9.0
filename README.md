To build the activemq docker image run below command

docker build -t activemq:5.9.0 -f amq.dockerfile .

To run the activemq docker container

docker run -p 8161:8161 61616:61616 -t "activemq:5.9.0"
