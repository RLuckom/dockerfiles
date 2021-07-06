FROM ubuntu:focal
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y groff python3 python3-pip curl

RUN pip install awscli

WORKDIR /input

ENTRYPOINT ["aws"]
