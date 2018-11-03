#!/bin/sh

# parse_ycb.sh
# 横浜市交通局(市営バス)の時刻表をパースする

cat $1 |
sed -n '/<div class="[btm|target]/,/<\/div>/p' |
sed 's/\t//g' |
sed 's/<.*>//g' |
awk 'NF!=0' |
# 奇数行に時刻、偶数行にバス停名称が来るため、「時刻 バス停名称」の形にする
awk 'NR%2==0{print $0."_"}NR%2!=0{print $0." "}' |
tr -d '\n' |
tr '_' '\n'
