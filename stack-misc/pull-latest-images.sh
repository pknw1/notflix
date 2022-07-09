#!/bin/bash
cat *.yml | grep image | awk -F: '{print $2}' | while read -r C; do docker pull $C:latest; done
