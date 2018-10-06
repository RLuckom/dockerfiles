!#/bin/bash
set -e

docker build -t aws -f Dockerfile .

mkdir -p ~/.bin

ln -s $(pwd)/aws ~/.bin/aws
