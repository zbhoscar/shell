#!/bin/bash
ss="/home/zbh/features/UCF50Im/"
#pg="/home/zbh/codenote/improved_trajectory_release/release/DenseTrackStab"
# echo $ss				# 显示ss：/home/zbh/features//UCF50Im
for f in $ss/*				# eg. /home/zbh/datasets/UCF50Im/v_BaseballPitch_g01_c01.gz
do
		t=${f##*/}		# eg.	  v_BaseballPitch_g01_c01.gz   将SS从j左边删除
		p=${t%.*}		# eg.	  v_YoYo_g25_c05	     去掉k右边的点
		sv=$ss$p.gz		# 准备输出为.gz格式
		echo upziping $sv
		gzip -d $sv
					# /home/zbh/features/UCF50I/v_YoYo_g25_c05.gz
done
# ./release/DenseTrackStab ./test_sequences/person01_boxing_d1_uncomp.avi | gzip > out.features.gz
# gzip -d FileName.gz 

