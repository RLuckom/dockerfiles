FROM ubuntu:bionic
RUN apt-get update && apt-get install -y software-properties-common && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 && \
    echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list && \
    apt-get update && \
    apt-get install -y spotify-client alsa-utils libgl1-mesa-dri libgl1-mesa-glx xdg-utils
CMD ["spotify"]
