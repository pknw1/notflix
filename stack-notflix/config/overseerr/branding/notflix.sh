#!/bin/bash

if [ -f /.dockerenv ]
then
 echo "Error : not running inside docker"
 echo "please docker run exec -it <your container> /config/branding/notflix.sh" 
 echo " "
 exit 404
fi

docker exec -it overseerr "sed -i 's/logo_stacked.svg/logo_stacked.png/g' /app/overseerr/.next/server/pages/*js"
sed -i 's/logo_full.svg/logo_full.png/g' /app/overseerr/.next/server/pages/*js

cp /config/branding/logos/* /app/overseerr/public/

