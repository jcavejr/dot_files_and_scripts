#!/usr/bin/env bash

##################
# Find installer #
##################
$INSTALL=apt install
command -v apt >/dev/null 2>&1 || $INSTALL=pacman -Su

###############################
# Check for required programs #
###############################
command -v git >/dev/null 2>&1 || sudo INSTALL git
command -v vim >/dev/null 2>&1 || sudo INSTALL vim
command -v ssh >/dev/null 2>&1 || sudo INSTALL openssh-client
command -v gcc >/dev/null 2>&1 || sudo INSTALL gcc

#################
# Setup SSH Key #
#################
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub | ssh jtc178@clamshell.rutgers.edu 'cat >> .ssh/authorized_keys'
echo "Add the following to github"
echo "---------------------------"
cat ~/.ssh/id_rsa.pub
echo "---------------------------"
read -p "Press any key to continue..."

####################
# Setup school dir #
####################
mkdir ~/school
mkdir ~/school/spring18
mkdir ~/school/spring18/os
git clone git@github.com:jcavejr/cs341 ~/school/spring18/os
mkdir ~/school/spring18/networks
mkdir ~/school/spring18/compgeo
mkdir ~/school/spring18/algorithms
mkdir ~/school/spring18/philanthropy

