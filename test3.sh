#!/bin/bash

set -e

TMP_DIR=$(mktemp -d)
[ ! -z "$(echo $TMP_DIR | grep '/var/folders/')" ] || (echo "Unexpected tmp dir path: $TMP_DIR" && exit 1)
echo "Created test tmp dir: $TMP_DIR"

echo "Trying to mount $TMP_DIR into docker container ..."
docker run --rm --volume $TMP_DIR:$TMP_DIR ubuntu:16.04 bash -ec "echo \"Creating $TMP_DIR/hello in container ...\" && touch $TMP_DIR/hello"

[ -f $TMP_DIR/hello ] || (echo "$TMP_DIR/hello should exist!" && exit 1)
echo "Good."
