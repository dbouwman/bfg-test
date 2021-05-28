#!/bin/sh

mkdir -p ./tmp
git rev-list --objects --all | sort -k 2 > ./tmp/allfileshas.txt
git rev-list --objects --all | sort -k 2 | cut -f 2 -d\  | uniq > ./tmp/uniquefiles.txt
git gc && git verify-pack -v .git/objects/pack/pack-*.idx | egrep "^\w+ blob\W+[0-9]+ [0-9]+ [0-9]+$" | sort -k 3 -n -r > ./tmp/bigobjects.txt
for SHA in `cut -f 1 -d\  < ./tmp/bigobjects.txt`; do
echo $(grep $SHA ./tmp/bigobjects.txt) $(grep $SHA ./tmp/allfileshas.txt) | awk '{print $1,$3,$7}' >> bigtosmall.txt
done;