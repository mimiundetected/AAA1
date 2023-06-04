#Coded By ./MimiUndetected
#issued 5-june-2023
#Google Dorker
#!/bin/bash/sh
putih='\033[0m'
ijo='\e[38;5;82m'
merah='\e[38;5;196m'
echo "wait.... iam checking my request"
link=$(sudo apt-get install lynx | grep -o "installed" | head -1)
if [[ "$link" = "installed" ]]; then
	echo "ready bos `whoami`"
else
	echo "installing my request.."
	sudo apt-get install -qq lynx
	echo "Done Checking.."
fi
dir="./MimiUndetected"
if [ ! -d MimiUndetected/google.com ]; then
	mkdir $dir
fi

 google(){
 	echo -n "Input Your Dork : "
 	read dork
 	lynx --dump "https://google.com/search?q=$dork" | grep -Po "(?<=url\?q=).*?(?=\&)" >> ./MimiUndetected/resultgoogle.txt
lynx --dump "https://google.com/search?q=$dork" | grep "search?q=" | tail | gawk -F/ '{ print $4 }' >> ./MimiUndetected/page.txt
for ngambil in $(cat ./MimiUndetected/page.txt); do
	ambilsemua=$(lynx --dump https://www.google.com/$ngambil | grep -Po "(?<=\/url\?q=).*?(?=\&)")
	echo "$ambilsemua"
	echo "$ambilsemua" >> ./MimiUndetected/resultgoogle.txt
	done
	printf "${ijo} saved to ${dir}/resultgoogle.txt ${putih}\n"
	rm -f MimiUndetected/page.txt
}
bing(){
	echo -n "Put yur dork : "
	read dork
	 lynx --dump https://www.bing.com/search?q=$dork | grep http |  grep -v "bing" | grep -v "javascript" | grep -v "microsoft"
	lynx --dump "https://www.bing.com/search?q=$dork" | grep "search?q=" | grep "first" | gawk -F/ '{print $4}' >> ./MimiUndetected/bing.txt
	for more in $(cat ${dir}/bing.txt); do 
	ambilbing=$(lynx --dump "https://www.bing.com/$more" | grep "http" | grep -v "bing" | grep -v "javascript" | grep -v "microsoft")
	echo "$ambilbing"
	echo "$ambilbing" >> ${dir}/resultbing.txt
done
	printf "${ijo} Resul Saved to ${dir}/resultbing.txt ${putih}\n"
	rm -f ${dir}/page.txt
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
                                                                                    
printf "===============Multi Dorker======================= By ./MimiUndetected 	  \n"
}
clear
header
printf "$GREEN"
echo "1.Google.com"
echo "2.Bing.com"
printf "$NC"
echo -n "Select Search Enggine [1/2]: "
read colok
	if [ $colok -eq 1 ]; then
		google
elif [ $colok -eq 2 ]; then
	bing
else
	echo "1 atau dua pilih aku atau dia yang engkau suka"
fi
