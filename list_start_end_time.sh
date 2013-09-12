#!/bin/bash
# 201309/12
# get event log, device log first line and last ine
# and get start, end time

filelist=$(find $1 -mindepth 1 -maxdepth 1 -type f)
for file in $filelist
do
  xxline=`sed -n 2p $file | awk '{print $1 " " $2}'`
  xxxline=`tail -1 $file | awk '{print $1 " " $2}'`
  echo $file $xxline $xxxline
done

