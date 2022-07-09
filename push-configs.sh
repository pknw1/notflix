#!/bin/bash

git checkout -b config || git checkout config
git add stack-core/config stack-notflix/config stack-misc/config
git commit -m "$(date)"
git push -u origin config
