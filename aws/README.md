### Notes

1. The working directory is mounted to `/input`, which is the working directory inside the container, so e.g. `aws cp` should work for things in the current directory or its children.
2. `$HOME/.aws` is mounted, but `AWS_ACCESS_KEY`, `AWS_SECRET_ACCESS_KEY`, and `AWS_ACCESS_TOKEN` are not currently shared with the container.
