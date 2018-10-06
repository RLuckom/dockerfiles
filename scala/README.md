### Dockerfiles for sbt and Ammonite

These Dockerfiles provide containerized versions of [sbt](https://www.scala-sbt.org/index.html)
and [Ammonite](http://ammonite.io), a tools-focused Scala runtime. Each
tool is provided in two parts: a Dockerfile for building the container,
and a Bash script for running the container locally with sensible defaults.

The `setup.sh` script is the canonical source of installation instructions. It:

 1. Builds the container images
 2. Makes directories under `$HOME/configs` for `sbt` and `amm` to store their persisted data
 3. Symlinks the executable `amm` and `sbt` scripts to `$HOME/.bin`, which you can add to your `PATH`.

### Notes on running the containers

The scripts to run the containers mount the tool's configuration directory
(a tool-specific lcation within `$HOME/configs`) and the working directory
into the container. This is sufficient for many tasks, but it also imposes
some significant restrictions:

 1. You can't execute a script that isn't in a subdirectory of the current directory (e.g. `amm ../otherdir/script.sc` won't work, because `otherdir` isn't mounted in the container)
 2. A script that you execute can only operate on files in the current directory or its subdirectories, for the same reason as #1.
 3. Your environment variables are mostly not shared with the container (exceptions are `SBT_OPTS` and `JAVA_OPTS`, which _are_ shared).

It's simple to get around any of these restrictions by just copying the
`docker run` scripts and expanding them to mount arbitrary directories
or share arbitrary environment variables.

Part of my aim in making these images and scripts is to keep my development
environment portable--that is, to avoid "works on my machine"-style issues
by deliberately limiting the amount of local context available to the tools
I use and the projects I work on. For that reason, I am unlikely to expand
these in the direction of giving them access to more of the local filesystem
or environment, even if that makes certain tasks easier.
