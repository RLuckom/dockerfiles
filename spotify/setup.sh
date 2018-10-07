!#/bin/bash
set -e

docker build -t spotify -f Dockerfile .

mkdir -p ~/.bin
mkdir -p ~/configs/spotify/config
mkdir -p ~/configs/spotify/cache

ln -sf $(pwd)/spotify ~/.bin/spotify
