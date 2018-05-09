# dot_files_and_scripts
This repository contains most of the configuration files and scripts that I need when I install a new operating system.

The most important part is fresh_install.sh which sets up just about everything for me when I install a new operating system.. It sets up my ~/bin, ~/school, and ~/repos directories; my ssh key for github and connecting to rutgers machines; and installs most necessary programs.
There's also "required_programs.txt" which is a list of all programs that I should make sure are installed. This file exists because unfortunatley some packages have different names in different repositories (e.g. openjdk and linux dev). I should automate this process in the future by checking the OS before installing packages, then I could just add this to fresh_install.sh. This works for now though.
