#!/bin/bash
# inspired by conversatoin tickled up by S.F.
export IYellow='\033[0;93m'      # Yellow
export IBlue='\033[0;94m'        # Blue
export IPurple='\033[0;95m'      # Purple
export Color_Off='\033[0m'       # Red
export IRed='\033[0;91m'  

function example(){
printf "
${IRed}
    Usage: $0 <executable full path of space separated executables>
    Example: $0 /usr/bin/ls  
    Example2: $0 /usr/bin/awk /usr/bin/ps /usr/bin/ls
${Color_Off}
"
}
if [ $# -eq 0 ]; then
    example
    exit 1
    elif [[ $1 == "-h"* || $1 == "--h"* ]]; then
    example
    exit 1
fi
executable_list=$@
for i in $executable_list; do 
    if [ `ls $i 2> /dev/null` ]; then 
        verscheck=`/bin/bash -c "$i --version | grep -E '[0-9]\.[0-9]+'" 2>/dev/null || bin/bash -c "$i -v" 2>/dev/null`; 
        execbin=`echo $i | rev | cut -d'/' -f1 | rev` ; 
        printf "\r\n ${IBlue}Executable: ${IRed} $execbin ${Color_Off} \r\n "
        printf "\t\t $i version is ${IPurple} $verscheck ${Color_Off} \r\n"
        printf "\t\t ${iBlue} Hash is: ${Color_Off} ${IYellow} `sha1sum $i` ${Color_Off} \r\n "
        printf "\t\t Current enviroment for  path of execution is: ${IBlue} `/bin/bash -c "which $execbin"` ${Color_OFF} \r\n " ;
        printf ${Color_Off}
    else
        printf "${IBlue}Executable: ${IRed} $i ${Color_Off} \r\n "
        printf " 
        \t\r ${IRed} $i does not exist in the context of the environment and path ${Color_Off} \r\n"
    fi 
done
