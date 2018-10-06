### Build

`docker build -t sbt .`

### Run

`docker run --user=$UID --rm -v $(pwd):/workspace --name scalabuild sbt sbt`
