#!/bin/bash

ID=$(date +%s)
echo $ID

for var in "$@"
do
	echo "$var" >> /tmp/qb.log
done

ARCHIVES=$(find "${3}" -type f | egrep 'zip|rar')

if ! [ -z $ARCHIVES ]
then

  mkdir -p /tmp/$ID
  cp -R "${3}"/* /tmp/$ID
  cd /tmp/$ID
  find . -type f -iname '*.zip' -exec unzip -o "{}" \; -exec rm "{}" \;
  rar x ./*part*1.rar 
  rar x *rar
  rm *.r??
  MEDIAPATH=/tmp/$ID
  else
    MEDIAPATH="${3}"
fi  

echo "${MEDIAPATH}"


JSON=$(./qb.py "${1}" | sed "s/'/\"/g")
echo $JSON

case "${2}" in
	movies) 
		TITLE=$(echo $JSON | jq '.title' | sed 's/"//g'|sed 's/ /./g')
		YEAR=$(echo $JSON | jq '.year' | sed 's/"//g')
		if ! [ -z $YEAR ]; then YEAR=$(echo $1 | awk -F\( '{print $2}'| awk -F\) '{print $1}') ; fi
		echo $TITLE $YEAR

		if [ -d "/content/movies/${TITLE}.(${YEAR})" ]
		then
			echo $MEDIAPATH
		else
			echo $MEDIAPATH
			mkdir -p "/content/movies/${TITLE}.(${YEAR})"
		fi

		for files in $(ls "${MEDIAPATH}");
		do
			echo moving $files
			mv "${MEDIAPATH}/${files}" "/content/movies/${TITLE}.(${YEAR})"
			ln -s "/content/movies/${TITLE}.(${YEAR})/${files}" "${MEDIAPATH}/${files}"

		done

		echo -----------------------------------------------
		echo SOURCE $MEDIAPATH
		find "${MEDIAPATH}" -type f 
		echo " "
		echo DEST "/content/movies/${TITLE}.(${YEAR})"
		find "/content/movies/${TITLE}.(${YEAR})" -type f
		echo -----------------------------------------------
		;;
	tv)	TITLE=$(echo $JSON | jq '.title'| sed 's/"//g')
		SEASON=$(echo $JSON | jq '.season')  
		EPISODE=$(echo $JSON | jq '.episode')  
		echo $TITLE $SEASON $EPISODE

		if [ -d "/content/tv/${TITLE}/Season.$SEASON" ]
		then
			echo dir
		else
			mkdir -p "/content/tv/${TITLE}/Season.$SEASON"
		fi
		;;
	*)
		;;
	esac


exit 0
