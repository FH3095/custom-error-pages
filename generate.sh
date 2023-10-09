#!/bin/bash

declare -r tpl="template.html"
declare -a idx_codes=('401' '403' '404' '500' '503' '504')
declare -a variables=('title' 'img' 'copy')

declare -A codes
codes["401,title"]="401 - Unauthorized"
codes["401,img"]="/.fh-error-pages/401.jpg"
codes["401,copy"]="http://httpstatusdogs.com/401-unauthorized"

codes["403,title"]="403 - Forbidden"
codes["403,img"]="/.fh-error-pages/403.jpg"
codes["403,copy"]="http://httpstatusdogs.com/403-forbidden"

codes["404,title"]="404 - File Not Found"
codes["404,img"]="/.fh-error-pages/404.jpg"
codes["404,copy"]="http://httpstatusdogs.com/404-not-found"

codes["500,title"]="500 - Internal Server Error"
codes["500,img"]="/.fh-error-pages/500.jpg"
codes["500,copy"]="http://httpstatusdogs.com/500-internal-server-error"

codes["503,title"]="503 - Service Unavailable"
codes["503,img"]="/.fh-error-pages/503.jpg"
codes["503,copy"]="http://httpstatusdogs.com/503-service-unavailable"

codes["504,title"]="504 - Gateway Timeout"
codes["504,img"]="/.fh-error-pages/504.jpg"
codes["504,copy"]="http://httpstatusdogs.com/504-gateway-timeout"


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
