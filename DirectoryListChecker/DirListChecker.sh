#!/bin/bash

echo -e '\nDirectory Listing Vulnerability Checker\n'

echo -e " 1. URL file lists \n 2. single URL"
read -p "Input: " inp


red='\033[0;31m'
nocol='\033[0m'
blue='\033[0;34m'

regexmatch="[<\w*>([iI]|[dD]).*</\w*>]"
#regexmatch="[([dD])|([iI]).*</\w*>]"

if [[ $inp == "1" ]];
then

	echo -e 'Enter the file list containing web directories (ex. /home/kali/Desktop/lists.txt)\n'
	read -p "$ " inp1
	echo -e '\n'
	while IFS= read -r line;
	do
		output=`curl -s -X GET $line | grep -w "<[tT]\w.*[tT]\w*" -m1 | cut -f2 -d">" | cut -f1 -d"<"`
		#if [[ $output == *"Index of"* || $output == *"index of"* || $output == *"Index of"* ]]
		if [[ $output =~ $regexmatch ]]
		then
			echo -e "\nWeb Title : ${output}"				
			echo -e "${red}[!] Vulnerable ${line}${nocol}"
		else
			echo -e "\nWeb Title : ${output}"
			echo -e "${blue}[X] not vulnerable ${line}${nocol}"
		fi
	done <  $inp1

elif [[ $inp == "2" ]]
then
	echo -e 'Enter the URL to check for Directory Listing Vulnerability'
	read -p "$ " urlinp
	output=`curl -s -X GET $urlinp | grep -w "<[tT]\w.*[tT]\w*" -m1` | cut -f2 -d">" | cut -f1 -d"<"
	
	#if [[ $output == *"Index of"* || $output == *"index of"* || $output == *"<TITLE>Index of"* ]]
	if [[ $output =~ $regexmatch ]]
	then
		echo -e "\nWeb Title : ${output}"	
		echo -e "${red}[!] Vulnerable ${urlinp}${nocol} \n"
	else
		echo -e "${blue}[X] not vulnerable ${urlinp}${nocol} \n"
	fi
else
	echo "enter valid input"
fi

