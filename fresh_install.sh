#!/usr/bin/env bash

##################
# Find installer #
##################
#INSTALL=apt install
#command -v apt >/dev/null 2>&1 || INSTALL="pacman -Su"
#echo $INSTALL
INSTALL="sudo pacman -Su"

###############################
# Check for required programs #
###############################
#command -v git >/dev/null 2>&1 || sudo $INSTALL git
#command -v vim >/dev/null 2>&1 || sudo $INSTALL vim
#command -v ssh >/dev/null 2>&1 || sudo $INSTALL openssh-client
#command -v gcc >/dev/null 2>&1 || sudo $INSTALL gcc

#################
# Setup SSH Key #
#################
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    ssh-keygen -t rsa
    cat ~/.ssh/id_rsa.pub | ssh jtc178@clamshell.rutgers.edu 'cat >> .ssh/authorized_keys'
    echo "Add the following to github"
    echo "---------------------------"
    cat ~/.ssh/id_rsa.pub
    echo "---------------------------"
    read -p "Press [enter] to continue..."
fi

####################
# Setup school dir #
####################
mkdir ~/school
mkdir ~/school/spring18
mkdir ~/school/spring18/os
git clone git@github.com:jcavejr/cs341.git ~/school/spring18/os
mkdir ~/school/spring18/networks
git clone git@github.com:jcavejr/cs446.git ~/school/spring18/networks
mkdir ~/school/spring18/compgeo
mkdir ~/school/spring18/algorithms
mkdir ~/school/spring18/philanthropy
mkdir ~/school/fall17
mkdir ~/school/fall17/candsystems
git clone git@github.com:jcavejr/cs211.git ~/school/fall17/candsystems
mkdir ~/school/fall17/comporg
git clone git@github.com:jcavejr/cs331.git ~/school/fall17/comporg
mkdir ~/school/spring17
mkdir ~/school/spring17/objectoriented
git clone git@github.com:jcavejr/cs113.git ~/school/spring17/objectoriented

###################
# Clone git repos #
###################
cd ~/repos
git clone git@github.com:jcavejr/ramaswamiresearch.git
git clone git@github.com:jcavejr/encryption.git
git clone git@github.com:jcavejr/perpdiscordbot.git
git clone git@github.com:jcavejr/pypong.git
git clone git@github.com:jcavejr/dot_randomizer.git
git clone git@github.com:jcavejr/clip_acute_angles.git
git clone git@github.com:jcavejr/weightlifted.git
git clone https://github.com/iridakos/goto.git

##################
# Setup programs #
##################
mkdir ~/bin
cp ~/repos/dot_files_and_scripts/bin/* ~/bin/*
$INSTALL deluge
$INSTALL gimp
$INSTALL blender
$INSTALL opencad
