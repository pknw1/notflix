#!/bin/bash

cp gitignore-configs .gitignore
git checkout -b configs || git checkout configs
git add stack-core/config stack-notflix/config stack-misc/config
git commit -m "$(date)"
git push -u origin configs
