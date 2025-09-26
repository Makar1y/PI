#!/bin/bash
disk_space=$((10*1024*1024*1024))
memory_used=$(du -sb  | cut -f1)
byte_mem=$((disk_space-memory_used))
proc_mem=$(echo "scale=5; 100*$memory_used/$disk_space" | bc)
sorted_mem=$(du -b * | sort -nr)

echo "Total (bytes):                  $disk_space"
echo "Memory used (bytes):              $memory_used"
echo "Left memory (bytes):            $byte_mem"
echo "Percentage(used):               0$proc_mem %"
if [$used ]
fi
echo "Most weightest files (bytes):"
echo "$sorted_mem"

