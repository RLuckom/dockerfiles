FROM ubuntu:bionic
RUN apt-get update && \ 
    apt-get upgrade -y && \
    apt-get install -y pstoedit texlive inkscape

USER nobody:nogroup

ENTRYPOINT ["inkscape"]
