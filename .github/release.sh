#!/bin/sh
npx standard-version --header '# CHANGELOG' \
  && echo "Sign-off commit and tags via 'git commit --amend --signoff' and 'git tag -sf v...'"
