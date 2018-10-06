FROM ubuntu:xenial

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl openjdk-8-jdk build-essential apt-transport-https

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get update && \
    apt-get install -y sbt && \
    mkdir -p /scala/scala-build/sbt-global-base && \
    mkdir -p /scala/scala-build/sbt-ivy-home && \
    mkdir -p /scala/scala-build/sbt-boot-directory

ENV SBT_OPTS="-Dsbt.global.base=/scala/scala-build/sbt-global-base -Dsbt.ivy.home=/scala/scala-build/sbt-ivy-home -Dsbt.boot.directory=/scala/scala-build/sbt-boot-directory"

RUN sbt sbtVersion

COPY ./sbt.sh /sbt.sh

RUN chmod +x /sbt.sh && \
    chmod -R 777 /scala/scala-build/sbt-global-base && \
    chmod -R 777 /scala/scala-build/sbt-ivy-home && \
    chmod -R 777 /scala/scala-build/sbt-boot-directory

ENTRYPOINT ["/sbt.sh"]
