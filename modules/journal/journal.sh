#!/bin/bash

cd /tmp

git clone git@github.com:GeorgeA93/journal.git

cd journal

bundle install

gem build journal.gemspec

gem install journal-0.1.0.gem
