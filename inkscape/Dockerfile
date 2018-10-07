FROM ubuntu:bionic
RUN apt-get update && \ 
    apt-get upgrade -y && \
    apt-get install -y inkscape

USER nobody:nogroup

ENTRYPOINT ["inkscape"]
