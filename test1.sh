#!/bin/bash

set -e

gem install dapp

[ ! -z "$(dapp --version | grep 0.7.15)" ] || (echo "GOVNO! NUJNA VERSIJA 0.7.15!!!" && dapp --version && exit 1)

rm -rf /tmp/testdapp

git clone https://github.com/flant/dapp.git /tmp/testdapp

cd /tmp/testdapp/spec/chef/testproject

dapp build --verbose
