FROM ubuntu:focal
RUN apt-get update && \ 
    apt-get install -y software-properties-common && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget

RUN wget -qO - https://files.openscad.org/OBS-Repository-Key.pub | apt-key add -
RUN echo "deb https://download.opensuse.org/repositories/home:/t-paul/xUbuntu_20.04/ ./" | tee -a /etc/apt/sources.list && apt-get update
RUN apt-get install -y openscad-nightly

#USER nobody:nogroup

CMD ["openscad-nightly"]
