!#/bin/bash
set -e

docker build -t openscad -f Dockerfile .

mkdir -p ~/.bin

ln -sf $(pwd)/openscad ~/.bin/openscad
