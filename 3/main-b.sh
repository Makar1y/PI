#!/bin/bash

space=$((10*1024*1024*1024))
used=$(du -s --block-size=1 | cut -f1)
left=$((space-used))
percentage=$((100*used/left))
sorted=$(du -b * | sort -nr)

echo "Total (bytes):                $space"
echo "Used (bytes):                    $used"
echo "Left (bytes):                 $left"
echo "Used (percentage):            $percentage"
echo "Most largest files and dirs:"
echo "$sorted"