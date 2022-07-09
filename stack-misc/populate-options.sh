echo SELECT-CONTAINER > containers.txt
ls *yml | sed 's/.yml//g' |sort >> containers.txt
