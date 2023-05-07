#!/bin/bash -eu

## last name and worth of people worth $2.99, $5.99 or $9.99 (million or billion)
cat files/yolo.csv | grep "\$[259]\.99[MB]$" | cut -d"," -f 3,7 >&2

## IPs with one number in 1st and 2nd octet
cat files/yolo.csv | cut -d"," -f 6 | grep -E "^[0-9]{1}\.[0-9]{1}\." >&2