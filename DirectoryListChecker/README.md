# DirListCh

## Directoy Listing Vulnerability Checker

This tool is a simple bash script that uses curl and grep the Index of to check for potential directory listing vulnerability. 

The Directory Listing Vulnerability might range from low to critical depends on the sensitivity of the information/files it discloses.
  
### Usage

Tool usage.
* 
  ```sh
  chmod +x DirListChecker.sh
  ./DirListChecker.sh
  $ /home/kali/Desktop/list.txt

  or
  bash DirListChecker.sh
  $ /home/kali/Desktop/list.txt
  ```

# Disclaimer
```sh
The tool is for education purpose only. Usage of the tool for attacking the website without consent is illegal. 
The end user of the tool will be responsible for the damage it might cause.
The developer of the tool assume no liability and not responsbile for any misuse and damage.
```

## Authors

[damaidec](https://medium.com/@damaidec)

#### References
```sh
https://cwe.mitre.org/data/definitions/548.html#:~:text=A%20directory%20listing%20is%20inappropriately,potentially%20sensitive%20information%20to%20attackers.&text=A%20directory%20listing%20provides%20an,files%20are%20listed%20and%20accessible.
https://portswigger.net/kb/issues/00600100_directory-listing
https://www.acunetix.com/blog/articles/directory-listing-information-disclosure/
https://hackerone.com/reports/150905
https://hackerone.com/reports/690796


```
