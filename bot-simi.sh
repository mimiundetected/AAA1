#!/bin/bash
#simi chat-bot terminal based
clear
while true; do
	echo -n "Nama kakak siapa ? "
	read name
	cekname=$(echo "$name" | wc -w)
	if [[ "$cekname" > "1" ]]; then
		echo "Jangan pake spasi kak :("
		printf "Sim-Simi Tanya lagi deh kalo kurang jelas !! "  | awk '{print toupper($0)}'
		continue
	elif [[ "$cekname" = "0" ]]; then
		echo "Kakak Gapunya Nama ? plz deh euy"
		continue;
	else
echo "Hai Kak $name ^_^ Sim-Simi Disini lagi nemenin kakak $name yang sendirian"
echo "Kalo kakak mau berhenti ketik \"dadah simi\" nanti Sim-Simi langsung keluar kok kak dan kakak bisa lanjutin lagi nanti"
echo "Sim-Simi ngerti kok kak ^_^ "
		break;
	fi
done
while true; do
        printf "\n%-10s : " "$name"
        read text
        if [[ "$text" =~ "dadah simi" ]]; then
        	echo "Dadah kakak $name Have A Nice Day ^_^ Sim-Simi Disini buat kakak ^_^"
        	break;
        fi
        simicek=$(curl -G -s "http://sandbox.api.simsimi.com/request.p?key=1bd92c04-9c4e-4f2c-aa20-34d4470b8f8d&lc=id&ft=1.0" \
        --data-urlencode "text=$text" | grep -Po "(?<=\"msg\": \").*?(?=\")")
        if [[ "$simicek" =~ "Daily Request Query Limit Exceeded" ]]; then
        	echo "yaaah :( simi gabisa lebih banyak lagi kak :( quota simi terbatas:( maaf ya:("
        	echo "kakak coba deh daftar ke \"http://developer.simsimi.com/api\" terus edit bagian key di sc $0 ini ya kak"
        	exit;
        	break
        fi
        simi=$(curl -G -s "http://sandbox.api.simsimi.com/request.p?key=1bd92c04-9c4e-4f2c-aa20-34d4470b8f8d&lc=id&ft=1.0" \
        --data-urlencode "text=$text" | grep -Po "(?<=\"response\": \").*?(?=\",)")
        if [[ "$simi" = "" ]]; then
                printf "%-10s : Maaf Sim-Simi Ga Ngerti kak :( " "Sim-Simi"
        else
                printf "%-10s : $simi " "Sim-Simi"
        fi
done
