#!/bin/bash

done=OK
MAX=0
found=`find . -name push_swap | wc -l`
bleu="\033[1;34m"

if [ $found -eq 0 ]
then
	echo " "
	echo -e "${bleu} PUT YOUR OBJECTS FILES INSIDE push_swap"
	echo " "
	exit 1
fi
if [ $# -lt 3 ] || [ $# -gt 3 ]
then
	echo -n " KEEP IT 3 ARGUMENT "
	echo -e "\033[1;33m bash script.sh 100 10"
	exit 1
fi
for ((i=1; i <= $2; i++))
do
	ARG=`bash rand.sh $1`
	check=`./push_swap $ARG | ./checker $ARG | tail -1`
	wc=`./push_swap $ARG | wc -l`
	if [ $check != $done ] || [ $wc -gt $3 ]
	then
		echo "you have problem with this stack !!"
		echo $ARG
		exit 1
	else
		echo "$i:$wc"
		if [ $wc -gt $MAX ]
		then
			MAX=$wc
		fi
	fi
done
echo -e "THE MAXIMUM INSTRUCTION IS : \033[1;32m$MAX"
