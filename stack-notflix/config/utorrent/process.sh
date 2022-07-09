#!/bin/bash

FROM=$(egrep -i 'Path:' /tmp/"${1}" | sed 's/Path: //')
CAT=$(egrep -i 'Category:' /tmp/"${1}" | sed 's/Category: //')

if ! [ -d /process/$CAT ]; then mkdir -p /process/$CAT; fi

if [[ $(egrep -i -c 'routing.bgp|empirehost.me|127.0.0.1.stackoverflow' /tmp/"${1}") -eq 0 ]]
then
  echo PUB
  mv "${FROM}" /process/$CAT/ 
else
  echo IPT
  cp -R "${FROM}" /process/$CAT/
fi
