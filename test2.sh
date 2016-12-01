#!/bin/bash

set -e

rm -rf /tmp/testdapp

git clone https://github.com/flant/dapp.git /tmp/testdapp

cd /tmp/testdapp

git checkout docker_for_mac

gem install bundler

bundle install

bundle exec rspec
