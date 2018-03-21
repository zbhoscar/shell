#!/bin/bash
## 3 or 4 inputs, writfile in a dir
# echo $#
# echo "$*"
if [ $# == 0 ];then
	ss="/home/zbh/datasets/hmdb51_org/"			# better no '/' incase "//" in path
	to="/home/zbh/features/IDT_hmdb51/"			# better no '/' incase "//" in path
	pg="/home/zbh/codenote/improved_trajectory_release/release/DenseTrackStab"
	pgext='.txt'
elif [ $# == 3 ];then
	ss=$1
	to=$2
	pg=$3
	pgext=".txt"								# default make into .txt
elif [ $# == 4 ];then
	ss=$1
	to=$2
	pg=$3
	pgext=$4
else
	echo ERROR! Input vars must be 0 or 3 or 4! see $0
	exit 1
fi
if [ ! -d $ss -o ! -d $to -o ! -x $pg -o "$pgext" != ".txt" ]; then
	echo ERROR: wrong setup in $0                     # needs to add explaination
	echo input form must be: `basename $0`  datasets_dir idtstore_dir idtprog_dir '(' extantion = '.txt )'
	exit 1
fi
# echo Datasets"  "dir "  "= $ss
# echo IDT feature dir = $to
# echo IDT program dir = $pg
# echo IDT fea-type  is  "'"$pgext"'"
#exit 1
#echo $ss				# 显示ss：/home/zbh/datasets/UCF50/
for f in $ss/*				# eg.	  /home/zbh/datasets/UCF50/YoYo
do
	for j in $f/*			# eg.	  /home/zbh/datasets/UCF50/YoYo/v_YoYo_g25_c05.avi
	do 
		t=${j#*$ss}		# eg.	/YoYo/v_YoYo_g25_c05.avi	将SS从j左边删除
		k=${j##*/}		# eg.	v_YoYo_g25_c05.avi			留j尾/之右的字符
		p=${k%.*}		# eg.	v_YoYo_g25_c05				去掉k右边的点
		lb=${t%/*}		# hmdb situa.	eg.	/YoYo	
		fr=$lb'_SEP_'$p		# hmdb situa.	eg.	/YoYo_SEP_v_YoYo_g25_c05
		sv=$to$fr$pgext	# 准备输出为.gz格式  $to + last var eg. p or fr
						# /home/zbh/features/UCF50I//YoYo_SEP_v_YoYo_g25_c05.txt
						# echo $f $j $fr $pg $j $sv
			if [ ! -f $sv ];then
				echo Computing $t
				#$pg $j | gzip > $sv	# .gz
				$pg $j > $sv	  		# .txt
			# else
			# echo $sv already exists
			fi
		done
	done
# ./release/DenseTrackStab ./test_sequences/person01_boxing_d1_uncomp.avi | gzip > out.features.gz
