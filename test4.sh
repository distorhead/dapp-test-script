#!/bin/bash

set -e

TMP_DIR=/tmp/tmp-test-dir-123321
rm -rf $TMP_DIR
mkdir $TMP_DIR
echo "Created test tmp dir: $TMP_DIR"

echo "Trying to mount $TMP_DIR into docker container ..."
docker run --rm --volume $TMP_DIR:$TMP_DIR ubuntu:16.04 bash -ec "echo \"Creating $TMP_DIR/hello in container ...\" && touch $TMP_DIR/hello"

[ -f $TMP_DIR/hello ] || (echo "$TMP_DIR/hello should exist!" && exit 1)
echo "Good."
