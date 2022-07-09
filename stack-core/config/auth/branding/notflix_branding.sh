#!/bin/bash
#!/bin/bash

if [ -f /.dockerenv ]
then
 echo "Error : not running inside docker"
 echo "please docker run exec -it <your container> /config/branding/notflix.sh"
 echo " "
 exit 404
fi

docker exec -it auth "find /app/ui -type f -iname marvin-eyes* -exec cp /config/branding/logo.png "{}" \;"
docker exec -it auth "cp /app/ui/index.html /app/ui/original.index.html && cp /config/branding/index.html /app/ui/index.html"
