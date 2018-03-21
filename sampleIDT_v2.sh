#!/bin/bash
if [ $# != 3 ];then
	echo ERROR input of $0
	exit 1
fi
sj=$1	#50
ss=$2	#"/home/zbh/features/IDT_hmdb51_pca"
tk=$3	#"/home/zbh/features/IDT_data/hmdb51_random334t_pca.txt"
for txt in $ss/*			# eg. /home/zbh/datasets/UCF50Im/v_BaseballPitch_g01_c01
do
	# echo shuffing top $sj rows of $txt		
	shuf -n$sj $txt >> $tk  # >> means countine write in
done
line=`sed -n '$=' $tk`
echo Finish random drawing
echo org path = $ss
echo target = $tk
echo lines = $line
echo DONE.

# ./release/DenseTrackStab ./test_sequences/person01_boxing_d1_uncomp.avi | gzip > out.features.gz
# gzip -d FileName.gz 
# shuf -n$sj $txt >> random100t.txt
