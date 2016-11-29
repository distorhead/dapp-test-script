#!/bin/bash

set -e

rm -rf /tmp/testdapp

git clone https://github.com/flant/dapp.git /tmp/testdapp

cd /tmp/testdapp

gem install bundler

bundle install

bundle exec rspec
