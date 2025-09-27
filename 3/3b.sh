#!/bin/bash
space="10G"
space_b=$((10*1024*1024*1024))
used_b=$(du -sb | cut -f1)
used=$(du -sh | cut -f1)
left_b=$((space_b-used_b))
left=$(echo "$left_b" | numfmt --to=iec)
percentage=$(echo "scale=2; 100*$used_b/$space_b" | bc)
exceed_b=$((used_b-space_b))
exceed=$(echo "$exceed_b" | numfmt --to=iec)
sorted=$(du -ha . * | sort -nr | head -n 100 | column -t -N SIZE,FILE)

echo "Total space limit:            $space"
echo "Used:                         $used"
echo "Left:                         $left"
echo "Used (percentage):            $percentage %"
if [ "$used_b" -gt "$space_b" ]; then
    echo "------------------------------------"
    echo "|\  Exceeded space Limit!"
    echo "|/  You need to free up $exceed" 
    echo "------------------------------------"
fi
echo "Most largest files and dirs:"
echo "$sorted"
