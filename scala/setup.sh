!#/bin/bash
set -e

docker build -t amm -f Dockerfile-amm .
docker build -t sbt -f Dockerfile-sbt .

mkdir -p ~/configs/scala-build/sbt-global-base
mkdir -p ~/configs/scala-build/sbt-ivy-home
mkdir -p ~/configs/scala-build/sbt-boot-directory

mkdir -p ~/.bin

ln -sf $(pwd)/amm ~/.bin/amm
ln -sf $(pwd)/sbt ~/.bin/sbt
