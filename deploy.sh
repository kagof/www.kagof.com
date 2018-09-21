#! /bin/bash

if [[ ! -d "build" ]]; then
  echo "build dir does not exist"
  exit 1
fi

cd build
aws s3 sync . s3://www.kagof.com --delete