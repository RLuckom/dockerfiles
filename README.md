### Dockerfiles for sbt and Ammonite

These Dockerfiles provide containerized versions of all of my development tools.
Each tool is provided in two parts: a Dockerfile for building the container,
and a Bash script for running the container locally with sensible defaults.

The `setup.sh` script in each directory is the canonical source of installation instructions. It:

 1. Builds the container images
 2. Makes directories for the tools to store their persisted data
 3. Symlinks the executable scripts to `$HOME/.bin`, which you can add to your `PATH`.

### Notes on running the containers

The scripts to run the containers mount the tool's configuration directory
(a tool-specific lcation within `$HOME/configs`) and the working directory
into the container. This is sufficient for many tasks, but it also imposes
some significant restrictions:

 1. You can't execute a script that isn't in a subdirectory of the current directory (e.g. `amm ../otherdir/script.sc` won't work, because `otherdir` isn't mounted in the container)
 2. A script that you execute can only operate on files in the current directory or its subdirectories, for the same reason as #1.
 3. Your environment variables are mostly not shared with the container (there are some exceptions for individual tools).
 4. The scripts all run the containers using `--user=$UID`. This avoids the security issue of giving root inside containers, but because `$UID` is probably not a user within the container, certain odd behaviors can occur. You may need to manually define a `$HOME` variable or other context for tools that expect it.
 
It's simple to get around any of these restrictions by just copying the
`docker run` scripts and expanding them to mount arbitrary directories
or share arbitrary environment variables.

Part of my aim in making these images and scripts is to keep my development
environment portable--that is, to avoid "works on my machine"-style issues
by deliberately limiting the amount of local context available to the tools
I use and the projects I work on. For that reason, I am unlikely to expand
these in the direction of giving them access to more of the local filesystem
or environment, even if that makes certain tasks easier.
