#!/bin/bash

cd $(dirname $0)

if [[ "$1" == "--safe" ]]
then
  docker-compose down
  git add .
  git commit -m "$(date)"
  git push
  docker-compose up -d
else
  git add .
  git commit -m "$(date)"
  git push 
fi
