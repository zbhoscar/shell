#!/bin/bash
ss="/home/zbh/features/UCF50I"
tof="/home/zbh/features/UCF50test"
tos="/home/zbh/features/UCF50train"
k=1
for f in $ss/*
do
#name=$ss$f
s=$( du -k $f|awk '{print $1}')
if [ $s -le 130000 ]
then 
k=$(($k+1))
number=$((k%2)) 
if [ $number -eq 1 ]
then
echo $k $number
mv -f $f $tof
else
echo $k $number
mv -f $f $tos
fi
#echo $k
#echo $f is $s
fi
done
