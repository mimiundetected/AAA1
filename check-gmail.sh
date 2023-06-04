#!/bin/bash
#created by ./MimiUndetected - KyBtb97
#Gmail account bulk check
NC='\033[0m'
GREEN='\e[38;5;82m'
CYAN='\e[38;5;45m'
RED='\e[38;5;196m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'
ceke=$(expect -v)
if [[ "$ceke" ]]; then
	echo "OK"
else
	echo "expect not installed, please install"
	echo "find on google : https://google.com/search?q=install+expect+on+$( cat /etc/os-release | head -1 | gawk -F\" '{ print $2 }')"
	exit
fi
echo "==========================="
ls
echo "==========================="
read -p 'Your List : ' list
IFS=$'\r\n' GLOBIGNORE='*' command eval  'email=($(cat $list | grep \@gmail.com))'
for (( i = 0; i < "${#email[@]}"; i++ )); do
	mail="${email[$i]}"
	oks="RCPT TO: <$mail>"
cat <<__EOF > verify
#!/bin/expect
# Created by Achon666ju5t - demeter16


set DeFR "MAIL FROM: <hi@mimi-undetected.com>"
set DeTO "$oks"

	spawn nc gmail-smtp-in.l.google.com 25
			expect "ESMTP"
			send "HELO mydomain.com\r"
			expect "service"
			send "\$DeFR\r"
			expect "OK"
			send "\$DeTO\r"
			expect "OK"
			send "quit\r"

__EOF
cek=$(expect verify)
if [[ "$cek" =~ "The email account that you tried to reach does not exist" ]]; then
	printf "${YELLOW}[${i}/${#email[@]}]${RED} [DIE] $mail\n${NC}"
else
	printf "${YELLOW}[${i}/${#email[@]}]${CYAN} [Live] $mail\n${NC}"
fi
done
