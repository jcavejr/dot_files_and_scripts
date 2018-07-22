#!/usr/bin/env bash

#########################################
# Script to setup a fresh linux install #
# with everything I need                #
#########################################

#########################################
# Setup ~/school                        #
#########################################

mkdir ~/school
mkdir ~/school/research
mkdir ~/school/fall16
mkdir ~/school/spring17
mkdir ~/school/fall17
mkdir ~/school/spring18
git clone git@github.com:jcavejr/cs113.git ~/school/spring17/cs113
git clone git@github.com:jcavejr/cs211.git ~/school/fall17/cs211
git clone git@github.com:jcavejr/cs331.git ~/school/fall17/cs331

#########################################
# Setup ~/repos                         #
#########################################

mkdir ~/repos
git clone git@github.com:jcavejr/dot_files_and_scripts.git ~/repos/dot_files_and_scripts
git clone git@github.com:jcavejr/ramaswami_research.git ~/repos/ramaswami_research
git clone git@github.com:jcavejr/weightlifted.git ~/repos/weightlifted
git clone git@github.com:jcavejr/pypong.git ~/repos/pypong
git clone git@github.com:jcavejr/perpdiscordbot.git ~/repos/perpdiscord.git
git clone git@github.com:jcavejr/encryption.git ~/repos/encryption.git

#########################################
# Setup other random directories        #
#########################################

mkdir ~/testing
mkdir ~/learning
