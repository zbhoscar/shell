#!/bin/bash
ss="/home/zbh/datasets/UCF50"
# #to="/home/zbh/features/UCF50I/"
# #pg="/home/zbh/codenote/improved_trajectory_release/release/DenseTrackStab"
# echo $ss
# for f in $ss/*
# do
# 	echo $f
# 	for j in $f/*
# 	do
# 		echo  $j
# 	done
# done
strA="helloworld"
strB="low"
if [[ $strA =~ $strB ]]
then
    echo "包含"
else
    echo "不包含"
fi
