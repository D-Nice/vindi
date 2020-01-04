#!/bin/sh
npx standard-version@7.1.0 --header '# CHANGELOG
' \
  && echo "Sign-off commit and tags via 'git commit --amend --signoff' and 'git tag -sf v...'"
