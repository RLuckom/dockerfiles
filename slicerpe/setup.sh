!#/bin/bash
set -e

docker build -t slic3r -f Dockerfile .

mkdir -p ~/.bin

ln -sf $(pwd)/slic3r ~/.bin/slic3r
