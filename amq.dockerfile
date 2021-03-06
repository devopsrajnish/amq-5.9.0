FROM openjdk:8
## we can also use base image as devopsrajnish/openjdk8

ENV ACTIVEMQ_VERSION 5.9.0
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION

ENV ACTIVEMQ_HOME /opt/activemq

RUN \    
    curl -O http://archive.apache.org/dist/activemq/apache-activemq/5.9.0/apache-activemq-5.9.0-bin.tar.gz && \
    mkdir -p /opt && \
    tar xf $ACTIVEMQ-bin.tar.gz -C /opt/ && \
    rm $ACTIVEMQ-bin.tar.gz && \
    ln -s /opt/$ACTIVEMQ $ACTIVEMQ_HOME && \
    useradd -r -M -d $ACTIVEMQ_HOME activemq && \
    chown activemq:activemq /opt/$ACTIVEMQ -R

USER activemq

WORKDIR $ACTIVEMQ_HOME
EXPOSE 61616 8161

CMD ["/bin/bash", "-c", "bin/activemq console"]
