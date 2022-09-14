#!/bin/bash
# conversatoin tickled up by S.F.
export IYellow='\033[0;93m'      # Yellow
export IBlue='\033[0;94m'        # Blue
export IPurple='\033[0;95m'      # Purple
export Color_Off='\033[0m'       # Red
export IRed='\033[0;91m'  

function example(){
printf "
${IRed}
    Usage: $0 <dir of bins>
    Example: $0 /bin/
    Example2: $0 /usr/bin/ /usr/bin/.local/ /bin/
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

for dir in $@; do
    for i in `ls $dir`; do
        executable="$dir$i"
        ipath=`which $i`
        if [ "$executable" != "$ipath" ]; then
        printf "\r\n ${IBlue} Executable ${IRed} $i ${IBlue} is not in $dir ${Color_Off} \r\n " 
        printf " ${IRed} PATH2CHECK: ${IBlue} Executable $executable  not found within context of env and paths \r"
        printf " ${IRed} possible validation needed $ipath ${Color_Off} \r\n " 
        fi
    done
done
