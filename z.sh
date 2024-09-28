#!/bin/zsh

if [ "$#" -ne 1 ]; then
    echo "Invalid parameters. Provide a single directory as argument"
    exit 1
fi
ifs_tmp=$IFS
IFS='/' directories=($(pwd))

for d in ${directories[@]}; do 
  if [ -n "$d" ]; then
    dirlist+=( "$d" )
  fi
done

len=${#dirlist}
idx=-1
#for i in ${indices[@]}; do 
#for i in {$len..1}; do
for ((i=len; i>=1; i--)); do
  if [[ "$1" == "${dirlist[$i]}" ]]; then
      idx=$i
      break
  fi
done
if [[ $idx == -1 ]]; then
    exit 0
fi

pathspaced=${dirlist[*]:0:$idx}
final_path="/${pathspaced// //}"
cd $final_path

IFS=$ifs_tmp
