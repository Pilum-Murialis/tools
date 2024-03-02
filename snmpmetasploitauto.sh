# for scanning snmp using metasploit 1 liner since snmp_enum does not accept text files as target
#!/bin/bash

while IFS= read -r line;
do
    sudo msfconsole -q -x "use auxiliary/scanner/snmp/snmp_enum;set rhost $line;run;exit"
done < ipist.txt
