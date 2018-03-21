#!/bin/bash
## 3 or 4 inputs, writfile in a dir
# echo $#
# echo "$*"
if [ $# != 1 -o ! -d $1 ];then
	# /home/zbh/Desktop/ZBH_Midfiles/UCF101pic
	echo Input $1 should be DIR
	exit 1
fi
echo $1
for f in $1/*				# eg.	/home/zbh/datasets/UCF50/YoYo
do
	#echo $f
	for j in $f/*.jpg		# eg.	/home/zbh/datasets/UCF50/YoYo/v_YoYo_g25_c05_62.jpg
	do 
		if [ -f $j ];then
			name=${j%_*}
			#echo $j $name ${j%_*}'/'${j##*_}	# eg.	/data2_alpha/zbh/UCF101pic/BabyCrawling/v_BabyCrawling_g02_c06
			#sleep 2s
				if [ ! -d $name ];then
					mkdir $name
				fi
				mv $j ${j%_*}'/'${j##*_}
				# t=${j#*$ss}		# eg.	/YoYo/v_YoYo_g25_c05.avi	将SS从j左边删除
				# k=${j##*/}		# eg.	v_YoYo_g25_c05.avi			留j尾/之右的字符
				# p=${k%.*}		# eg.	v_YoYo_g25_c05				去掉k右边的点
				# lb=${t%/*}		# hmdb situa.	eg.	/YoYo	
				# fr=$lb'_SEP_'$p		# hmdb situa.	eg.	/YoYo_SEP_v_YoYo_g25_c05
				# sv=$to$fr$pgext	# 准备输出为.gz格式  $to + last var eg. p or fr
				# 				# /home/zbh/features/UCF50I//YoYo_SEP_v_YoYo_g25_c05.txt
				# 				# echo $f $j $fr $pg $j $sv
				# 	if [ ! -f $sv ];then
				# 		echo Computing $t
				# 		#$pg $j | gzip > $sv	# .gz
				# 		$pg $j > $sv	  		# .txt
				# 	# else
				# 	# echo $sv already exists
				# 	fi
				# done
		fi
	done
done
# ./release/DenseTrackStab ./test_sequences/person01_boxing_d1_uncomp.avi | gzip > out.features.gz