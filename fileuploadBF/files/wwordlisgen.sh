#!/bin/bash

while IFS= read -r line;
do
 #echo $line
 	while IFS= read -r line1;
	do
		echo $line$line1 >> double_extension_list.txt

	done < extensionLists.txt


done <  extensionLists.txt
