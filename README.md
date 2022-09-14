# execbin_ver_hash_check
executable version, hash, and path check

Simple Execution to validate binaries, hashes, and the execution path.

    Usage: $0 <executable full path of space separated executables>
    Example: $0 /usr/bin/ls  
    Example2: $0 /usr/bin/awk /usr/bin/ps /usr/bin/ls
    
 Executable:  ls  
                 /usr/bin/ls version is  ls (GNU coreutils) 8.30  
                  Hash is:   0112ce45ea0b927048acc1c1962dfde145e94c74  /usr/bin/ls  
                 Current enviroment for  path of execution is:  /usr/bin/ls  
 
 Executable:  who  
                 /usr/bin/who version is  who (GNU coreutils) 8.30  
                  Hash is:   eaf06299e6d1149eb6c8e42e704ac7ae860c1686  /usr/bin/who  
                 Current enviroment for  path of execution is:  /usr/bin/who  
 
 Executable:  /bin/python  
  
  /bin/python does not exist in the context of the environment and path  


# Check Bin Dir

    Usage: $0 <dir of bins>
    Example: $0 /bin/
    Example2: $0 /usr/bin/ /usr/bin/.local/ /bin/
