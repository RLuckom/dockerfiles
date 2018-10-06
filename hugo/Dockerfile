FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y curl tar && \
    curl -L -o hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.42.2/hugo_0.42.2_Linux-64bit.tar.gz && tar xzvf hugo.tar.gz

WORKDIR /input

ENTRYPOINT ["/hugo"]
