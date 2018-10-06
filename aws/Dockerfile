FROM ubuntu:bionic
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y groff python curl

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python /get-pip.py
RUN pip install awscli

WORKDIR /input

ENTRYPOINT ["aws"]
