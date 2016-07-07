#!/bin/bash
#
json_content=$(curl "https://api.distelli.com/bmcgehee/envs/0green/vars?apiToken=9kpkkouvo7ras8221r25velouviebwqw2is9t")

bg_pos=$(echo "$json_content" | grep -bo '"BG"' |  sed 's/:.*$//')
bg_value_pos=$((bg_pos + 14))
bg_value=${json_content:$bg_value_pos:3}

echo "$bg_value"

if [ "$bg_value" = "dev" ]; then
  echo "Green is dev, Blue is prod."
else
  echo "Green is prod, Blud is dev."
fi

