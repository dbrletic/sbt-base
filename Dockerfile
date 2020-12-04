FROM quay.io/eclipse/che-java11-maven:7.22.0

MAINTAINER Andrew Brletich <dbrletic@redhat.com>

ARG SBT_VERSION=1.4.1
ARG SCALA_VERSION=2.13.3

ENV IVY_DIR=/home/user/.ivy2
ENV SBT_DIR=/home/user/.sbt

LABEL io.k8s.display-name="sbt-base $SBT_VERSION" \
      io.k8s.description="SBT base with cached SBT $SBT_VERSION and Scala $SCALA_VERSION" \
      io.openshift.expose-services="9000:http" \
      io.openshift.tags="sbt,scala" \
      io.openshift.min-memory="1Gi"

USER root
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list  #updating the list to include sbt 
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add #adding the key

RUN apt-get update 
RUN apt-get install sbt=$SBT_VERSION -V 
RUN apt-get clean

RUN  mkdir -p /tmp/caching/project \
 && cd /tmp/caching \
 && sbt -v -sbt-dir $SBT_DIR -sbt-boot $SBT_DIR/boot -ivy $IVY_DIR compile \
 && chown -R 1001:0 /home/user \
 && chmod -R g+rw /home/user 


