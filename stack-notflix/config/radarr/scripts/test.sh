#!/bin/bash

echo $(date)>> ./log.log
for i in $@
do
	echo $i >> ./log.log
done
