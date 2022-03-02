#!/bin/bash

done=OK
Error="\e[33mbash script.sh 100 10"
MAX=0


if [ $# -lt 2 ] || [ $# -gt 2 ]
then
	echo -n " JUST 2 ARGUMENT "
	echo -e $Error
	exit 1
fi
for ((i=1; i <= $2; i++))
do
	ARG=`bash rand.sh $1`
	check=$(./push_swap $ARG | ./checker $ARG | tail -1)
	if [ $check != $done ]
	then
		echo "you have problem with this stack !!"
		echo $ARG
		exit 1
	else
		wc=`./push_swap $ARG | wc -l`
		echo "$i:$wc"
		if [ $wc -gt $MAX ]
		then
			MAX=$wc
		fi
	fi
done
MSG="\e[92m$MAX"
echo -e "THE MAXIMUM INSTRUCTION IS : $MSG"
