#!/bin/zsh

if [ "$#" -ne 1 ]; then
    echo "Invalid parameters. Provide a single directory as argument"
    return
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
    return
fi

pathspaced=${dirlist[*]:0:$idx}
final_path="/${pathspaced// //}"
echo $final_path
cd $final_path

unset final_path
unset dirlist
unset final_path
unset idx
unset pathspaced

IFS=$ifs_tmp
