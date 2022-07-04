#!/bin/bash



cd ~ && mkdir tools c2 payloads others && cd tools && mkdir api enums crlf cloud commandInjection reqsmugle cors csrf dns firebase 403bypass jwt lfi mobile nuclei openredir osint sqli ssrf ssti xss xxe && sleep 5
cd ~/tools/enums && mkdir subdomain directory params && sleep 3
cd ~/tools/cloud && mkdir AD && sleep 3
cd ~/tools/nuclei && mkdir templates && sleep 3

# webpack map unpacker
cd ~/tools && git clone https://github.com/rarecoil/unwebpack-sourcemap


# CRLF
cd ~/tools/crlf && git clone https://github.com/Nefcore/CRLFsuite




# API
cd ~/tools/api && git clone https://github.com/trufflesecurity/truffleHog

cd ~/tools/api && git clone https://github.com/streaak/keyhacks

cd ~/tools/api && git clone https://github.com/momenbasel/KeyFinder

cd ~/tools/api && git clone https://github.com/m4ll0k/SecretFinder

cd ~/tools/api && git clone https://github.com/ozguralp/gmapsapiscanner


# Request smugling
cd ~/tools/reqsmugle && git clone https://github.com/defparam/smuggler


# log4j scanner
cd ~/tools && git clone https://github.com/fullhunt/log4j-scan #&& cd log4j-scan && pip3 install -r requirements.txt



# command and control server
cd ~/c2 && git clone https://github.com/cobbr/Covenant



cd ~/c2 && git clone https://github.com/malwaredllc/byob



# payloads / lists
cd ~/payloads && git clone https://github.com/danielmiessler/SecLists 



#obfuscator 
cd ~/tools && git clone https://github.com/Bashfuscator/Bashfuscator



# cloud
cd ~/tools/cloud/AD && git clone https://github.com/aquasecurity/kube-hunter
cd ~/tools/cloud/AD && git clone https://github.com/ropnop/kerbrute

cd ~/tools/cloud && git clone https://github.com/jordanpotti/AWSBucketDump

cd ~/tools/cloud && git clone https://github.com/nccgroup/ScoutSuite

cd ~/tools/cloud && git clone https://github.com/christophetd/CloudFlair



# command injection
cd ~/tools/commandInjection && git clone https://github.com/commixproject/commix



# CORS
cd ~/tools/cors && git clone https://github.com/s0md3v/Corsy/



# CSRF
cd ~/tools/csrf && git clone https://github.com/0xInfection/XSRFProbe


# DNS
cd ~/tools/dns && git clone https://github.com/nahamsec/HostileSubBruteforcer

cd ~/tools/dns && git clone https://github.com/musana/mx-takeover

cd ~/tools/dns && git clone https://github.com/m4ll0k/takeover


# enumeration tools
#cd ~/tools/enums && mkdir subdomain directory params && sleep 5
cd ~/tools/enums && git clone https://github.com/s0md3v/Smap

cd ~/tools/enums && git clone https://github.com/tomnomnom/gf

cd ~/tools/enums && git clone https://github.com/projectdiscovery/httpx

cd ~/tools/enums && git clone https://github.com/thewhiteh4t/FinalRecon


# subdomain
cd ~/tools/enums/subdomain && git clone https://github.com/tomnomnom/assetfinder



#directory
cd ~/tools/enums/directory && git clone https://github.com/lc/gau

cd ~/tools/enums/directory && git clone https://github.com/ffuf/ffuf



# parameters
cd ~/tools/enums/params && git clone https://github.com/s0md3v/Arjun

cd ~/tools/enums/params && git clone https://github.com/devanshbatham/ParamSpider

cd ~/tools/enums/params && git clone https://github.com/maK-/parameth



#firebase
cd ~/tools/firebase && git clone https://github.com/shivsahni/FireBaseScanner

cd ~/tools/firebase && git clone https://github.com/MuhammadKhizerJaved/Insecure-Firebase-Exploit



# 403 bypass
cd ~/tools/403bypass && git clone https://github.com/lobuhi/byp4xx

cd ~/tools/403bypass && git clone https://github.com/iamj0ker/bypass-403

cd ~/tools/403bypass && git clone https://github.com/gotr00t0day/forbiddenpass



# JWT
cd ~/tools/jwt && git clone https://github.com/aress31/jwtcat

cd ~/tools/jwt && git clone https://github.com/ticarpi/jwt_tool



# LFI
cd ~/tools/lfi && git clone https://github.com/P0cL4bs/kadimus

cd ~/tools/lfi && git clone https://github.com/D35m0nd142/LFISuite

cd ~/tools/lfi && git clone https://github.com/lightos/Panoptic



# mobile
cd ~/tools/mobile && git clone https://github.com/0x1CA3/AdbNet

cd ~/tools/mobile && git clone https://github.com/Impact-I/reFlutter

cd ~/tools/mobile && git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF



#sqli
cd ~/tools/sqli && git clone https://github.com/swisskyrepo/GraphQLmap

cd ~/tools/sqli && git clone https://github.com/codingo/NoSQLMap

cd ~/tools/sqli && git clone https://github.com/ghostlulzhacks/waybackSqliScanner
###sqlmap



# vulnscanner
cd ~/tools/nuclei && git clone https://github.com/projectdiscovery/nuclei # && mkdir templates && sleep 5



# nuclei templates
cd ~/tools/nuclei/templates && git clone https://github.com/projectdiscovery/nuclei-templates

cd ~/tools/nuclei/templates && git clone https://github.com/esetal/nuclei-bb-templates

cd ~/tools/nuclei/templates && git clone https://github.com/pikpikcu/nuclei-templates

cd ~/tools/nuclei/templates && git clone https://github.com/MrCl0wnLab/Nuclei-Template-CVE-2022-1388-BIG-IP-iControl-REST-Exposed



# open redirect
cd ~/tools/openredir && git clone https://github.com/Elsfa7-110/OpenRedireX



# OSINT
cd ~/tools/osint && git clone https://github.com/sherlock-project/sherlock

cd ~/tools/osint && git clone https://github.com/thewhiteh4t/seeker

cd ~/tools/osint &7 git clone https://github.com/trustedsec/social-engineer-toolkit


# SSRFmap
cd ~/tools/ssrf && git clone https://github.com/swisskyrepo/SSRFmap

cd ~/tools/ssrf && git clone https://github.com/taviso/rbndr

cd ~/tools/ssrf && git clone https://github.com/daeken/httprebind
 
cd ~/tools/ssrf && git clone https://github.com/nccgroup/singularity


# fileupload


#SSTI 
cd ~/tools/ssti && git clone https://github.com/epinna/tplmap



#XSS
cd ~/tools/xss && git clone https://github.com/DanMcInerney/xsscrapy

cd ~/tools/xss && git clone https://github.com/s0md3v/XSStrike

cd ~/tools/xss && git clone https://github.com/hahwul/dalfox


# HTTP request smugling


# XXE 
cd ~/tools/xxe && git clone https://github.com/enjoiz/XXEinjector


# others
cd ~/others && git clone https://github.com/SecureAuthCorp/impacket 
cd ~/others && git clone https://github.com/samratashok/nishang
cd ~/others && git clone https://github.com/stealthcopter/deepce
cd ~/others && git clone https://github.com/RythmStick/AMSITrigger
cd ~/others && git clone https://github.com/PercussiveElbow/docker-escape-tool
cd ~/others && git clone https://github.com/danielbohannon/Invoke-Obfuscation
cd ~/others && git clone https://github.com/rasta-mouse/ThreatCheck
cd ~/others && git clone https://github.com/carlospolop/PEASS-ng
cd ~/others && wget https://github.com/carlospolop/PEASS-ng/releases/download/20220619/linpeas_linux_amd64
cd ~/others && git clone https://github.com/JonathanSalwan/ROPgadget


#### bin files 
#sudo apt install gccgo-go 
sudo apt-get update
apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools
sudo apt install neo4j
sudo apt install golang-go
sudo apt install docker.io
sudo apt-get install python3-venv


######## pip3 install for libraries
pip3 install urlparse
pip3 install -r ~/tools/403bypass/forbiddenpass/requirements.txt
pip3 install kube-hunter
pip3 install -r ~/tools/cloud/AWSBucketDump/requirements.txt
pip3 install -r ~/tools/cloud/ScoutSuite/requirements.txt
pip3 install -r ~/tools/cors/Corsy/requirements.txt
pip3 install -r ~/tools/enums/FinalRecon/requirements.txt
pip3 install -r ~/tools/enums/params/parameth/requirements.txt
pip3 install -r ~/tools/enums/params/ParamSpider/requirements.txt
pip3 install -r ~/tools/firebase/Insecure-Firebase-Exploit/requirements.txt
pip3 install -r ~/tools/jwt/jwtcat/requirements.txt
pip3 install -r ~/tools/jwt/jwt_tool/requirements.txt
pip3 install -r ~/tools/log4j-scan/requirements.txt
pip3 install -r ~/tools/mobile/Mobile-Security-Framework-MobSF/requirements.txt
bash ~/tools/mobile/Mobile-Security-Framework-MobSF/setup.sh
pip3 install -r ~/tools/osint/sherlock/requirements.txt
pip3 install -r ~/tools/sqli/GraphQLmap/requirements.txt
pip3 install -r ~/tools/ssrf/SSRFmap/requirements.txt
pip3 install -r ~/tools/ssti/tplmap/requirements.txt
pip3 install -r ~/tools/unwebpack-sourcemap/requirements.txt
pip3 install -r ~/tools/xss/xsscrapy/requirements.txt
pip3 install -r ~/tools/xss/XSStrike/requirements.txt
pip3 install -r ~/others/impacket/requirements.txt
pip3 install -r ~/tools/api/SecretFinder/requirements.txt
pip3 install -r ~/tools/cloud/CloudFlair/requirements.txt
pip3 install -r ~/tools/osint/social-engineer-toolkit/requirements.txt



######## setup install tool
sudo python3 ~/tools/crlf/CRLFsuite/setup.py install 
sudo python3 ~/tools/csrf/XSRFProbe/setup.py install 
sudo python3 ~/tools/enums/params/Arjun/setup.py install 
sudo python3 ~/tools/cloud/AD/kube-hunter/setup.py install
sudo python3 ~/tools/mobile/reFlutter/setup.py install 
sudo python3 ~/tools/sqli/GraphQLmap/setup.py install
#sudo python3  ~/tools/cloud/ScoutSuite/setup.py install 
#pip3 install -r ~/tools/cloud/AD/kube-hunter/requirements.txt

###### go install
#go install -v github.com/s0md3v/smap/cmd/smap@latest
#go get -u github.com/tomnomnom/assetfinder

wget https://github.com/s0md3v/Smap/releases/download/0.1.11/smap_0.1.11_linux_amd64.tar.xz && tar -xvf smap_0.1.11_linux_amd64.tar.xz && cd ~/Downloads/smap_0.1.11_linux_amd64 && sudo mv smap /usr/bin
wget https://github.com/projectdiscovery/httpx/releases/download/v1.2.2/httpx_1.2.2_linux_amd64.zip && unzip httpx_1.2.2_linux_amd64.zip && sudo mv httpx /usr/bin
wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.1/assetfinder-linux-amd64-0.1.1.tgz && tar -xvf assetfinder-linux-amd64-0.1.1.tgz && sudo mv assetfinder /usr/bin
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.5.2/subfinder_2.5.2_linux_amd64.zip && unzip subfinder_2.5.2_linux_amd64.zip && sudo mv subfinder /usr/bin
wget https://github.com/lc/gau/releases/download/v2.1.1/gau_2.1.1_linux_amd64.tar.gz && tar -xvf gau_2.1.1_linux_amd64.tar.gz && sudo mv gau /usr/bin
wget https://github.com/ffuf/ffuf/releases/download/v1.5.0/ffuf_1.5.0_linux_amd64.tar.gz && tar -xvf ffuf_1.5.0_linux_amd64.tar.gz && sudo mv ffuf /usr/bin
wget https://github.com/projectdiscovery/nuclei/releases/download/v2.7.2/nuclei_2.7.2_linux_amd64.zip && unzip nuclei_2.7.2_linux_amd64.zip && sudo mv nuclei /usr/bin
wget https://github.com/hahwul/dalfox/releases/download/v2.7.5/dalfox_2.7.5_linux_amd64.tar.gz && tar -xvf dalfox_2.7.5_linux_amd64.tar.gz && sudo mv dalfox /usr/bin
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 && chmod +x kerbrute_linux_amd64 && sudo mv kerbrute_linux_amd64 /usr/bin 

cd ~/tools/api/truffleHog && go install
docker run -it -v "$PWD:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/trufflesecurity/test_keys


#wget https://github.com/trufflesecurity/trufflehog/releases/download/v3.6.4/trufflehog_3.6.4_darwin_amd64.tar.gz && tar -xvf trufflehog_3.6.4_darwin_amd64.tar.gz

 
