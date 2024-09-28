#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Invalid parameters. Provide a single directory as argument"
    exit 1
fi

IFS='/' read -r -a directories <<< "$(pwd)"

for d in ${directories[@]}; do 
  if [ -n "$d" ]; then
    dirlist+=( "$d" )
  fi
done

indices=$(rev <<< ${!dirlist[@]})
idx=-1
for i in ${indices[@]}; do 
  if [ "$1" = "${dirlist[i]}" ]; then
      idx=$i+1
      break
  fi
done
if [ "$idx" = -1 ]; then
    exit 0
fi

pathspaced=${dirlist[*]:0:$idx}
finalpath="/${pathspaced// //}"

cd $finalpath
