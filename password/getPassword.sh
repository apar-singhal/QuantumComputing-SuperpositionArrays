len=100
start=$1
let end=$start+$len-1
x=$( cat password.txt )
echo $( cat password.txt | cut -c$start-$end )
