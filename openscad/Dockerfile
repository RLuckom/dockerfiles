FROM ubuntu:bionic
RUN apt-get update && \ 
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:openscad/releases && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openscad
CMD ["openscad"]
