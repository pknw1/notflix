#!/bin/bash
if [ "$REQUEST_METHOD" = "POST" ]
then
	   tr '&' '\n' > /tmp/mycgi$$
	      echo >> /tmp/mycgi$$
      fi
      if [ "$REQUEST_METHOD" = "GET" ]
      then
	         printf "%b\n" "${QUERY_STRING//&/\\n}" > /tmp/mycgi$$
	 fi
	 while read line
	 do
		    line=${line//+/ }
		       kword=${line%=*}
		          val=${line#*=}
			     # deal with keyword/value pair here
			     echo $kword > /tmp/kw
		     done < /tmp/mycgi$$
		     rm /tmp/mycgi$$
