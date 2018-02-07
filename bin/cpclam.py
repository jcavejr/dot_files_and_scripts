#!/usr/bin/env python3.5
#http://www.linuxproblem.org/art_9.html <- for ssh/scp without a password
import os
import sys
from subprocess import call

if __name__ == "__main__":
    cwd = os.getcwd() 
    cwd_list = cwd.split("/")
    if not "pa" == cwd_list[-1][0:2]:
        print("Error: {} is not a valid directory to work from.", file=sys.stderr)
        sys.exit(-1)
    upload_dir = "~/" + "/".join(cwd_list[-3:])
    upload_files = [item for item in os.listdir(cwd) if os.path.isfile(os.path.join(cwd, item)) and not os.access(item, os.X_OK) and not item.endswith(".o")]
    command = "scp " + cwd + "/" + (" " + cwd + "/").join(upload_files) + " jtc178@clamshell.rutgers.edu:" + upload_dir
    call(command.split(" "))
