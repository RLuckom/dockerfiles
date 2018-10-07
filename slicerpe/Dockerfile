FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y curl tar && apt-get install -y freeglut3 libgtk2.0-dev libwxgtk3.0-dev libwx-perl libxmu-dev libgl1-mesa-glx libgl1-mesa-dri xdg-utils --no-install-recommends && \
    curl -L -o slic3r.tar.bz2 https://github.com/prusa3d/Slic3r/releases/download/version_1.40.1/Slic3rPE-1.40.1.linux64-full-201807051330.tar.bz2 && \
    tar xjf slic3r.tar.bz2 && \
    chmod -R 777 /Slic3rPE-1.40.1+linux64-full-201807051330

USER nobody:nogroup

CMD ["/Slic3rPE-1.40.1+linux64-full-201807051330/slic3r", "--gui"]
