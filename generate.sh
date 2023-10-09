#!/bin/bash

declare -r tpl="template.html"
declare -a idx_codes=('401' '403' '404' '500' '503' '504')
declare -a variables=('title')

declare -A codes
codes["401,title"]="401 - Unauthorized"

codes["403,title"]="403 - Forbidden"

codes["404,title"]="404 - File Not Found"

codes["500,title"]="500 - Internal Server Error"

codes["503,title"]="503 - Service Unavailable"

codes["504,title"]="504 - Gateway Timeout"


for idx in "${idx_codes[@]}"
do
	cp $tpl s${idx}.html
	for var in "${variables[@]}"
	do
		echo "${idx},${var}"
		rep=${codes["${idx},${var}"]}
		rep=${rep//\//\\/}
		sed -i "s/%${var}%/${rep}/g" s${idx}.html
	done
done
