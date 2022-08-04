#!/bin/bash

echo -e '\nDirectory Listing Vulnerability Checker\n'
echo -e 'Enter the file list containing web directories (ex. /home/kali/Desktop/lists.txt)\n'
read -p "$ " inp1
echo -e '\n'

red='\033[0;31m'
nocol='\033[0m'
blue='\033[0;34m'

while IFS= read -r line;
do
	output=`curl -s -X GET $line | grep '<TITLE>Index of'`
	if [[ $output == *"Index of"* || $output == *"index of"* || $output == *"<TITLE>Index of"* ]]
	then
		echo -e "${red}[!] is Vulnerable ${line}${nocol} Vulnerable to Directory Listing"
	else
		echo -e "${blue}[X] is not vulnerable ${line}${nocol}"
	fi
done <  $inp1
