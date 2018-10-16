#!/bin/bash

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Some ridiculously large number
HISTSIZE=1000000
HISTFILESIZE=20000000

export LESS="-R"
alias scalagrep="grep -RnI --include=*.scala --exclude-dir=*.git* --exclude-dir=*test* --exclude-dir=*target*"
alias javagrep="grep -RnI --include=*.java --exclude-dir=*.git* --exclude-dir=*test* --exclude-dir=*target*"
alias ggrep="grep -RnI --exclude-dir=*.git*"
alias tree="tree -C"
