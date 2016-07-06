#!/bin/bash
#
json_content=$(curl "https://api.distelli.com/bmcgehee/envs/0green/vars?apiToken=9kpkkouvo7ras8221r25velouviebwqw2is9t")
jcontent=${json_content:10:-3}
oldIFS=$IFS
IFS="\},\{"; eval 'pairs=($jcontent)'
echo ":$IFS:"
echo "$jcontent"
counter=0
for pair in "${pairs[@]}"; do
  echo "$counter - $pair"
  if echo "$pair" | grep -q "\"BG\""; then
    echo "YES"
  fi
  let counter++
done
