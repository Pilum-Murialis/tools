#!/bin/bash

echo -e " 1. subfinder  (subdomain) \n 2. gau  (find directories) \n 3. nuclei  (vuln finder) \n 4. paramspider  (crawler and param finder) fresh enum\n 5. FFUF \n default:"
read -p "Input: " inp1

if [[ $inp1 == "1" ]];
then
    echo "Using subfinder: "
    read -p "Enter URL: " url

    subfinder -d $url > subfinder_res.txt

    ##read file
    #filename=subfinder_res.txt
    #while IFS= read -r line;
    #do
        #--connect-timeout <seconds>
        #-m, --max-time <seconds>
     #   curl -vvv -i -X HEAD $line -m 10 >> http_res_code.txt && sleep 0.4 #-H "X-HackerOne: username"
    cat subfinder_res.txt | httpx -probe > runningweb.txt
    #done <  subfinder_res.txt

    #cat curl_res.txt | grep "HTTP" -A 5 >> http_resp_code.txt
    echo -e "do you want to check for CNAME subdomain take over ?"
    read -p "Input: Y/n " subqinp
    if [[ $subqinp == "Y" ]]
    then
        echo -e "CNAME CHECKER for Subdomain Takeover"
        cat runningweb.txt | grep SUCCESS | cut -d' ' -f1 | sed 's/^http:\/\///' | sed 's/^https:\/\///' > checkCNAMEsubdomains.txt
        while IFS= read -r line;
        do
            
            dig CNAME $line +noall +answer >> CNAMEcheck.txt
            cat CNAMEcheck.txt |  sed 's/.*CNAME//' | sed 's/.$//' > cnamepoints.txt
        done < checkCNAMEsubdomains.txt
    fi


elif [[ $inp1 == "2" ]];
then

    echo "Using gau: example: https://testing.com (find directories)"
    read -p "Enter URL: " url2

     #echo $url2 | gau --verbose -random-agent > list.txt
     gau $url2 --blacklist png,jpg,gif,svg --verbose  >> list.txt



elif [[ $inp1 == "3" ]];
then


    echo -e "using nuclei \n 1. 1st template \n 2. 2nd template \n 3. 3rd template \n default: default enum"
    read -p "Input: " nucinp

    if [[ $nucinp == "1" ]]
    then
        echo " dont use got weird stuff first template: "
        #cat list.txt | nuclei -rl 100 -silent -t /home/kali/tools/Bthings/nuclei/plates/nuclei-templates/ -o nuc1.txt #-c 500

    elif [[ $nucinp == "2" ]]
    then    
        echo "2nd template: "
        cat list.txt | nuclei -rl 100 -t /home/kali/tools/Bthings/nuclei/plates/nuclei-bb-templates/ -o nuc2.txt #-c 500 #xss
        #cat gfxss.txt | nuclei -rl 100 -silent -t /home/kali/tools/Bthings/nuclei/plates/nuclei-bb-templates/ -o nuc2.txt

    elif [[ $nucinp == "3" ]]
    then
        echo "3rd template: "
        cat list.txt | nuclei -rl 100 -t /home/kali/tools/Bthings/nuclei/plates/1/nuclei-templates/ -o nuc3.txt #-c 500

    else
        echo "default template: "
        nuclei -rl 100 -list list.txt -o defnuc.txt
    fi
elif [[ $inp1 == "4" ]]
then

    echo -e "using param spider (crawler and param finder) [ex]. https://test.com "
    read -p "Input: " parapider  
    echo -e "\n \n[waiting the script to be finished]"
    python3 /home/kali/tools/Bthings/enums/params/ParamSpider/paramspider.py --domain $parapider --exclude woff,css,js,png,svg,php,jpg --output paramspider.txt
    echo -e "\n \n[done]"

    echo -e "Using gf "

    /home/kali/go/bin/gf xss output/paramspider.txt | grep  "^http" output/paramspider.txt > gfxss.txt
    /home/kali/go/bin/gf potential output/paramspider.txt | grep  "^http" output/paramspider.txt > gfpotent.txt
    /home/kali/go/bin/gf redirect output/paramspider.txt | grep  "^http" output/paramspider.txt > gfOpenredir.txt
    /home/kali/go/bin/gf wordpress output/paramspider.txt | grep  "^http" output/paramspider.txt > gfwordp.txt

elif [[ $inp1 == "5"  ]]
then
    echo -e "Using FFUF\n example:\n URL: https: //testing . com \n wordlist: /usr/share/wordlists/dirb/common.txt"
    read -p "Enter URL: " url
    read -p "Enter wordlist path: " wordlist

    #ffuf -w /usr/share/wordlists/dirb/common.txt:FUZZ -u http: //test.com/FUZZ -recursion -v | tee ./ffuf_res.txt
    ffuf -w $wordlist:FUZZ -u $url/FUZZ -recursion -v | tee ./output.txt

    cat output.txt | grep "Status: 200" -A 1 | grep URL | cut -d' ' -f4 > 200_status_http.txt
    cat output.txt | grep "Status: 301" -A 1 | grep URL | cut -d' ' -f4 > 301_status_http.txt
    cat output.txt | grep "Status: 403" -A 1 | grep URL | cut -d' ' -f4 > 403_status_http.txt


############dont use this parameter bruteforcing first probably will cause false positive ###########
##brute force parameters on 200 http status code
#echo -e "brute forcing parameters"
#read -p "Enter wordlist path: " param_wordlist
#while IFS= read -r line;
#do
    #ffuf -w $param_wordlist:PARAM -u $line?PARAM=test -v | tee ./ffuf_param_200.txt

#done <  200_status_http.txt
##########################################################################

## not tested yet##
## parameter bruteforcing using arjun 
    echo -e "do you want to brute force parameters using arjun"
    read -p "Input: Y/n" innq
    if [[ $innq == "Y" ]]
    then
        while IFS= read -r line;
            do
                arjun.py -u $line -oT params_from_200http.txt
            done <  200_status_http.txt 

    else
        echo -e "exiting... \n"
    fi


    


else

 echo "Enter input"

fi

