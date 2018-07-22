#!/usr/bin/env bash

##################
# Find installer #
##################
echo "CHECKING WHICH PACKAGE MANAGER TO USE..."
command -v pacman >/dev/null 2>&1 && INSTALL="sudo pacman -S --noconfirm"
command -v apt >/dev/null 2>&1 && INSTALL="sudo apt -y install"
command -v zypper >/dev/null 2>&1 && INSTALL="sudo zypper in -y"
echo "FOUND INSTALL COMMAND IS: $INSTALL"

###############################
# Check for required programs #
###############################
echo "CHECKING FOR AND INSTALLING REQUIRED PROGRAMS..."
command -v git >/dev/null 2>&1 || $INSTALL git 2>/dev/null
command -v vim >/dev/null 2>&1 || $INSTALL vim 2>/dev/null
command -v ssh >/dev/null 2>&1 || $INSTALL openssh-client 2>/dev/null
command -v gcc >/dev/null 2>&1 || $INSTALL gcc 2>/dev/null
command -v deluge >/dev/null 2>&1 || $INSTALL deluge 2>/dev/null
command -v opencad >/dev/null 2>&1 || $INSTALL opencad 2>/dev/null
command -v blender >/dev/null 2>&1 || $INSTALL blender 2>/dev/null
command -v gimp >/dev/null 2>&1 || $INSTALL gimp 2>/dev/null
command -v keepass >/dev/null 2>&1 || $INSTALL keepass 2>/dev/null
command -v hp-setup >/dev/null 2>&1 || $INSTALL hplip 2>/dev/null
command -v okular >/dev/null 2>&1 || $INSTALL okular 2>/dev/null
command -v thunderbird >/dev/null 2>&1 || $INSTALL thunderbird 2>/dev/null
command -v chromium >/dev/null 2>&1 || $INSTALL chromium 2>/dev/null

#################
# Setup SSH Key #
#################
if [ ! -f ~/.ssh/id_rsa.pub ]; then #checks if ssh key already exists before creating
    echo "SETTING UP SSH KEY..."
    ssh-keygen -t rsa
    cat ~/.ssh/id_rsa.pub | ssh jtc178@clamshell.rutgers.edu 'cat >> .ssh/authorized_keys'
    echo "Add the following to github"
    echo "---------------------------"
    cat ~/.ssh/id_rsa.pub
    echo "---------------------------"
    read -p "Press [enter] to continue..."
fi

#################### can possibly write this way more efficiently with loops and python..
# Setup school dir #
####################
echo "SETTING UP SCHOOL DIRECTORY..."
if [ ! -d ~/school ]; then
    mkdir ~/school
fi
if [ ! -d ~/school/acm ]; then
    mkdir ~/school/acm
fi
if [ ! -d ~/school/princeton ]; then
    mkdir ~/school/princeton
fi
if [ ! -d ~/school/princeton/introcs ]; then
    mkdir ~/school/princeton/introcs
    git clone git@github.com:jcavejr/cos126.git ~/school/princeton/cos126
fi
if [ ! -d ~/school/spring18 ]; then
    mkdir ~/school/spring18
fi
if [ ! -d ~/school/os ]; then
    mkdir ~/school/spring18/os
    git clone git@github.com:jcavejr/cs341.git ~/school/spring18/os
fi
if [ ! -d ~/school/spring18/networks ]; then
    mkdir ~/school/spring18/networks
    git clone git@github.com:jcavejr/cs446.git ~/school/spring18/networks
fi
if [ ! -d ~/school/spring18/compgeo ]; then
    mkdir ~/school/spring18/compgeo
fi
if [ ! -d ~/school/spring18/algorithms ]; then
    mkdir ~/school/spring18/algorithms
fi
if [ ! -d ~/school/spring18/philanthropy ]; then
    mkdir ~/school/spring18/philanthropy
fi
if [ ! -d ~/school/fall17 ]; then
    mkdir ~/school/fall17
fi
if [ ! -d ~/school/fall17/candsystems ]; then
    mkdir ~/school/fall17/candsystems
    git clone git@github.com:jcavejr/cs211.git ~/school/fall17/candsystems
fi
if [ ! -d ~/school/fall17/comporg ]; then
    mkdir ~/school/fall17/comporg
    git clone git@github.com:jcavejr/cs331.git ~/school/fall17/comporg
fi
if [ ! -d ~/school/spring17 ]; then
    mkdir ~/school/spring17
fi
if [ ! -d ~/school/spring17/objectoriented ]; then
    mkdir ~/school/spring17/objectoriented
    git clone git@github.com:jcavejr/cs113.git ~/school/spring17/objectoriented
fi


###################
# Clone git repos #
###################
echo "SETTING UP ~/repos..."
cd ~/repos
if [ ! -d ~/repos/ramaswami_research ]; then
    git clone git@github.com:jcavejr/ramaswami_research.git
fi
if [ ! -d ~/repos/encryption ]; then
    git clone git@github.com:jcavejr/encryption.git
fi
if [ ! -d ~/repos/perpdiscordbot ]; then
    git clone git@github.com:jcavejr/perpdiscordbot.git
fi
if [ ! -d ~/repos/pypong ]; then
    git clone git@github.com:jcavejr/pypong.git
fi
if [ ! -d ~/repos/dot_randomizer ]; then
    git clone git@github.com:jcavejr/dot_randomizer.git
fi
if [ ! -d ~/repos/clip_acute_angles ]; then
    git clone git@github.com:jcavejr/clip_acute_angles.git
fi
if [ ! -d ~/repos/weightlifted ]; then
    git clone git@github.com:jcavejr/weightlifted.git
fi
if [ ! -d ~/repos/goto ]; then
    git clone https://github.com/iridakos/goto.git
fi

##################
# Setup programs #
##################
echo "SETTING UP ~/bin..."
if [ ! -d ~/bin ]; then
    mkdir ~/bin
fi
cp ~/repos/dot_files_and_scripts/bin/* ~/bin

echo "Copying dot files..."
cp ~/repos/dot_files_and_scripts/dot_files/.vimrc ~/.vimrc
cat ~/repos/dot_files_and_scripts/dot_files/.bashrc >> ~/.bashrc
echo "DONE."
