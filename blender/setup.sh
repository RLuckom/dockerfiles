!#/bin/bash
set -e

docker build -t blender -f Dockerfile .

mkdir -p ~/.bin

ln -sf $(pwd)/blender ~/.bin/blender
