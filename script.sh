#!/bin/bash

done=OK
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
		echo "$i:$wc ---------- OK"
	fi
done
