#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup

url = "https://free-proxy-list.net/"

r = requests.get(url)
soup = BeautifulSoup(r.text,'html.parser')
gdp_table = soup.find("table", attrs={"class": "table table-striped table-bordered"})
gdp_table_data = gdp_table.tbody.find_all("tr")
tds = []
for tr in gdp_table_data:
    tds.append(tr.find_all('td'))

addrs = []
for td in tds:
    addr = str(td[0]).rstrip().replace("<td>","").replace("</td>","")
    port = str(td[1]).rstrip().replace("<td>","").replace("</td>","")
    ip = f"{addr}:{port}"
    addrs.append(ip)




print(addrs[0])

f = open("ip_list.txt", "w")
for i in addrs:
    f.write(f"{i}\n")
    #print(i)
f.close()