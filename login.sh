cok='cookies.txt'
login(){
	curl -s -X POST \
	--url 'https://www.marlboro.id/auth/login?ref_uri=/profile'\
	-H 'Accept-Language: en-US,en;q=0.9' \
	-H 'Connection: keep-alive' \
	-H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
	-H 'Host: www.marlboro.id' \
	-H 'Origin: https://www.marlboro.id' \
	-H 'Referer: https://www.marlboro.id/' \
	-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36' \
	-H 'X-Requested-With: XMLHttpRequest' \
	--data-urlencode 'email='$1'' \
	--data-urlencode 'password='$2''\
	--data-urlencode 'decide_csrf='$3'' \
	--data-urlencode 'ref_uri=%252Fprofile0' \
	--cookie-jar $cok -b $cok	
}
get_point(){
	curl -s 'https://www.marlboro.id/profile' -b $cok -c $cok
}
get_csrf(){
	curl -s 'https://www.marlboro.id/auth/login?ref_uri=/profile' --cookie-jar $cok
}
get_video(){
	curl -s 'https://www.marlboro.id/' -b $cok --cookie-jar $cok | grep -Po "(?<=data-stringid=\").*?(?=\" data-source=\")"
}
nonton_video(){
	link=$1
	ssrf=$2
	curl -sL -X POST \
	--url "https://www.marlboro.id/article/play-video/$link/update" \
	--data-urlencode "decide_csrf=$ssrf" \
	--data-urlencode 'page=undefined' \
	-b $cok --cookie-jar $cok
}
# echo $decide_csrf
read -p 'Your Email List: ' list
y=$(cat $list)
IFS=$'\r\n' GLOBIGNORE='*' command eval  'email=($y)'
for (( i = 0; i < "${#email[@]}"; i++ )); do
	decide_csrf=$(echo $(get_csrf) | grep -Po "(?<=name\=\"decide_csrf\" value\=\").*?(?=\" />)" | head -1 )
	emails="${email[$i]}"
	echo -n "$emails | AutoLogin: "
	pw=$1
	for opateuy in {1..4}; do
		ceklogin=$(login $emails '$pw' $decide_csrf | grep -Po "(?<=\"message\":\").*?(?=\")")
	done
	if [[ "$ceklogin" =~ 'Akun lo telah dikunci' ]]; then
		echo "Akun Dikunci (locked)"
	elif [[ "$ceklogin" =~ 'Email atau password yang lo masukan salah' ]]; then
		echo "Wrong Password"
	elif [[ "$ceklogin" =~ 'success' ]]; then
		echo -n "OK | "
		# for nonton in $(cat vid.txt | shuf | head -1); do
			# echo -n "Nonton Video: $nonton "
			# for tontonkeun in {1..10}; do 
				# csrf=$(echo $(get_csrf) | grep -Po "(?<=name\=\"decide_csrf\" value\=\").*?(?=\" />)" | head -1)
				# echo $csrf; echo $csrf
				# lalajo=$(nonton_video "$nonton" "$decide_csrf")
				# echo ''
			# done
			# if [[ "$lalajo" =~ 'true' ]]; then
					# echo -n "| Sukses Add Point - "
			# fi
		# done
		echo -n "Your Point: $(get_point | grep -Po "(?<=\<span class=\"point-place\" data-current=\").*?(?=\">)")"
	else
		echo -n " | Wrong CSRF"
	fi
	echo ''
# done
	rm $cok
done
