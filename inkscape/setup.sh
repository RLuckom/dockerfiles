!#/bin/bash
set -e

docker build -t inkscape -f Dockerfile .

mkdir -p ~/.bin

ln -sf $(pwd)/inkscape ~/.bin/inkscape
