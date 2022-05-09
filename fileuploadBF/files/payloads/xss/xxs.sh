#!/bin/bash


echo -e "Enter your XSS payload to the png "
read -p "Input: " inp1

exiftool index.jpeg -Comment="$inp1" && mv index.jpeg xss1.jpeg && mv index.jpeg_original index.jpeg  
