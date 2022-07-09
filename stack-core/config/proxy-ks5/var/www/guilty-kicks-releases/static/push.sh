#!/bin/bash
BRANCH=$(git branch | grep '\*'|awk '{print $2}')
echo $BRANCH
git add .
git commit -m $(date +%s)
git push -u origin $BRANCH 
ssh ks4 "cd /home/notflix/stack-core/config/proxy/var/www/guilty-kicks-releases/static && sudo chmod -R 777 ../../guilty-kicks-releases && git pull origin $BRANCH" 
