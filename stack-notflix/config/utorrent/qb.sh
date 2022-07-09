#!/bin/bash

for P in "${@}"
do
	if [ $(echo "${P}" | grep -c Name) -eq 1 ];
	then 
		NAME=$(echo ${P} | sed 's/Name: //')
fi
	echo "${P}" >> /tmp/"${NAME}".txt
done
exit 0
