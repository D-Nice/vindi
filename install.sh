#!/bin/sh
printf "Build vindi locally? (If no local image, vindi bin will pull pre-built image) (Y/n) "
read -r answer

if [ "$answer" != "${answer#[Yy]}" ]
then
  echo "Starting build, please wait a few minutes..."
  if docker build -q -t vindi .
  then
    echo "Build finished"
  else
    echo "Build failed... aborting"
    exit 1
  fi

  if ! docker image inspect vindi > /dev/null
  then
    echo "Unexpected docker error encountered... aborting"
    exit 2
  fi
fi

printf "Install vindi to /usr/local/bin/ using sudo install? (Y/n) "
read -r answer

if [ "$answer" = "${answer#[Yy]}" ]
then
  exit 0
fi

if ! sudo install \
    -g root \
    -o root \
    -m 555 \
    -p \
    bin/vindi /usr/local/bin/
then
  echo "Install to /usr/local/bin/vindi failed..."
  exit 3
fi
