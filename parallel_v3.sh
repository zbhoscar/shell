#！/bin/bash
std='spt.sh [DATADIR pnum savepath]'
echo cmdline must be $std
test1=$1
if [ ${test1:-1} != "/" ];then
	path=$1'/'
else
	path=$1
fi
pnum=$2
# set DIR in DATADIR into $pnum groups to parallel
set=1
for file in $(ls $1);do 
	b=$(( $set % $pnum ))
	if [ -z "${array[b]}" ]; then 
		array[b]=$path$file					# MUST be 'path' that has '/' in the end
	else
		array[b]=${array[b]}','$path$file
	fi
	set=$(($set+1))
done
# save the spt_DATADIR to txt
test3=$3
if [ ${test3:-1} != "/" ];then
	savepath=$3'/'
else
	savepath=$3
fi
if [ ! -d savepath ];then    
    mkdir $savepath
fi
for((i=1;i<$pnum;i++));do
	savefile=$savepath$i'.txt'
	echo ${array[i-1]} > $savefile
done


# for ((i=1;i<=pnum;i++))
# do
# 	if [ $i -eq $pnum ]; then
# 		sh $og $passput
# 	else
# 		sh $og $passput &
# 	fi
# 	sleep 1s
# done
# wait
# echo 'all DONE'

# std='parallel.sh [NumOfParallels actual.sh/py Parfor-like_in_MATLAB:DATADIR Para_To_actual.sh/py]'
# if [ $# == 2 ];then
# 	DATADIR=''
# 	PARA=''
# elif [ $# == 3 -a -d "$3" ];then
# 	DATADIR=$3
# 	PARA=''
# elif [ $# == 3 -a ! -d "$3" ];then
# 	DATADIR=''
# 	PARA=$3
# elif [ $# > 3 ];then
# 	DATADIR=$3
# 	cutnum=$[${#pnum}+${#og}+2]
# 	temp="$*"
# 	PARA=${temp:$cutnum}
# else
# 	echo ERROR! input parameter wrong in $0
# 	echo $std
# 	exit 1
# fi
# pnum=$1
# og=$2
# echo $pnum
# echo $og
# echo $DATADIR
# echo $PARA
# if [[ $pnum =~ ^-?[1-9][0-9]*$ ]]; then
# 	echo parallel threads: $pnum 
# else
# 	echo ERROR: wrong setup in $0 :
# 	echo pnum must be int! 
# 	exit 1
# fi
# if [ ! -x $og ]; then
# 	echo ERROR: wrong setup in $0 :                   # needs to add explaination
# 	echo $og is not a suitable file
# 	exit 1
# else 
# 	echo file to run in parallel: $og
# fi
# echo parameter to pass: $passput
# echo BEGIN parallel now:
# #tg="/home/zbh/codenote/SHELL/bingxing/"
# # for each parallel set a seperate input:

# make sure to get FULL PATH, including '/'