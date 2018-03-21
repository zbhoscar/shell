#！/bin/bash
# this.sh 20 prog 'passput'
passput=''
if [ $# == 0 ];then
	pnum=12
	og="/home/zbh/codenote/SHELL/..."
elif [ $# == 2 ];then
	pnum=$1
	og=$2
elif [ $# > 2 ];then
	pnum=$1
	og=$2
	cutnum=$[${#pnum}+${#og}+2]
	temp="$*"
	passput=${temp:$cutnum}
else
	echo ERROR! input parameter wrong in $0
	exit 1
fi
# above: parallel.sh actual.sh NumOfParallels InputToPassTo_actual.sh
if [[ $pnum =~ ^-?[1-9][0-9]*$ ]]; then
	echo parallel threads: $pnum 
else
	echo ERROR: wrong setup in $0 :
	echo pnum must be int! 
	exit 1
fi
if [ ! -x $og ]; then
	echo ERROR: wrong setup in $0 :                   # needs to add explaination
	echo $og is not a suitable file
	exit 1
else 
	echo file to run in parallel: $og
fi
echo parameter to pass: $passput
echo BEGIN parallel now:
#tg="/home/zbh/codenote/SHELL/bingxing/"
for ((i=1;i<=pnum;i++))
do
	if [ $i -eq $pnum ]; then
		sh $og $passput
	else
		sh $og $passput &
	fi
	sleep 1s
done
wait
echo 'all DONE'
