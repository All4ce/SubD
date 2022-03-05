#!/bin/bash


if [ "$1" == "" ]
then
	echo "======================== All4ce PortScan Subdominio ======================="
	echo "Digite $0 SITE"

else

wget $1

grep href index.html | cut -d '"' -f 2 | grep $1 | cut -d "/" -f 3 | sort | uniq > lista

for url in $(cat lista);
do
host $url | grep "has address";
done
fi

sudo rm index.html
sudo rm lista
