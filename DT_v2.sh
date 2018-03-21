#!/bin/bash
ss="/home/zbh/datasets/UCF50/"
to="/home/zbh/features/UCF50/"
pg="/home/zbh/codenote/dense_trajectory_release_v1.2/release/DenseTrack"
echo $ss
for f in $ss/*
do
	for j in $f/*
	do 
		t=${j#*$ss}
		k=${j##*/}
		p=${k%.*}
		sv=$to$p.txt
			if [ ! -f $sv ]
			then
				echo Computing $t
				$pg $j > $sv
			else
			echo $sv cunzai
			fi
	done
done
