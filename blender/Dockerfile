FROM ubuntu:bionic

RUN apt-get update && \
    apt-get install -y curl tar && apt-get install -y freeglut3 libgtk2.0-dev libwxgtk3.0-dev libwx-perl libxmu-dev libgl1-mesa-glx libgl1-mesa-dri xdg-utils --no-install-recommends && \
    curl -L -o blender.tar.bz2 https://mirror.clarkson.edu/blender/release/Blender2.79/blender-2.79b-linux-glibc219-x86_64.tar.bz2 && \
    tar xjvf blender.tar.bz2

USER nobody:nogroup

CMD ["/blender-2.79b-linux-glibc219-x86_64/blender"]
