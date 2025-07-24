#!/bin/sh
set -e

bundle install
exec bundle exec jekyll serve --watch --drafts --force_polling --trace --host 0.0.0.0 --port 4000
