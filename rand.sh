#!/bin/bash

for (( i=1; i <= $1; i++ ))
do
	rand=$(shuf -i 0-2147483647 -n1)
	echo -n "$rand "	
done

