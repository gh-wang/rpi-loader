#!/bin/bash

# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      0.4
#
# DESCRIPTION:
#
# NOTE:



############################ ############################

# Note:
# The shell does not exit if the command that fails is part of the command list immediately following a while or until keyword, part of the test following the if or elif reserved words, part of any command executed in a && or || list except the command following the final && or ||, any command in a pipeline but the last, or if the command's return value is being inverted with !
#
# Set +e' will revert the setting again, so you can have only certain blocks that exit automatically on errors.

# Any subsequent commands which fail will cause the shell script to exit immediately
#trap 'sys_abort' 0
#set -e

# directory for where rpi-loader is installed
HOME="/home/pi"
ROOT="$HOME/src/rpi-loader"

# github branch you wish to compile
BRANCH="master"

source "$ROOT/ansi.sh"
source "$ROOT/functions.sh"

# Test if user is pi and abort this script if not
roottest

TRUE=1
FALSE=0
TMP="/tmp"           # location for temporary files
ANS="dummy-value"    # string will store answers to prompt responses
OPTS=" --yes"        # option parameters used for apt-get command


############################ ############################

messme "\nBuilding the TensorFlow Environment.\n"

# update your pip utility and install python dependencies
pip3 install --upgrade pip
pip3 install --upgrade six numpy wheel 

# install tensorflow
pip3 install --upgrade tensorflow

############################ ############################

messme "\nTensorFlow is now installed.\n"

# clean up before exiting
echo -e -n ${NColor}
