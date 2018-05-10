#! /bin/bash
#File name: deploy.sh
#Summary: Deploys RHEL/CentOS/Ubuntu system with settings customized by Kyle Sliva.
#                             Meant to be deployed in conjunction with the dotfiles folder.     
#                             Copy this to home directory.

#run this as root! or nothing will happen
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
# Installs:
# Git version control
# Tmux terminal multiplexer
# Yum-cron automatic updater
 
#yum -y install git tmux yum-cron

#for Debian derivatives (ubuntu, etc.)
#installs git, tmux, python{2-3}, pip{2-3}, and unattended-upgrades
# for php php7.0 / grav libapache2-mod-php7.0 php7.0-mysql php7.0-mbstring
apt-get update
apt-get install -y git tmux python python3 python-pip python3-pip unattended-upgrades
#ufw allow http
#ufw allow https
 
# Check to see if a dotfile exists
# Back up dotfiles
# Symlink the enclosed dotfiles
if [[ -e /home/$USER/.bashrc ]]
then
                mv /home/$USER/.bashrc /home/$USER/.bashrc.bak
fi

if ! [[ -e /home/$USER/.bashrc ]]
then
                touch .bashrc
                ln -s /home/$USER/dotfiles/.bashrc /home/$USER/.bashrc
fi
 
if [[ -e /home/$USER/.vimrc ]]
then
                mv /home/$USER/.vimrc /home/$USER/.vimrc.bak
fi

if ! [[ -e /home/$USER/.vimrc ]]
then
                ln -s /home/$USER/dotfiles/.vimrc /home/$USER/.vimrc
fi

if [[ -e /home/$USER/.tmux.conf ]]
then
                mv /home/$USER/.tmux.conf /home/$USER/.tmux.conf.bak
fi            

if ! [[ -e /home/$USER/.tmux.conf ]]
then
                ln -s /home/$USER/dotfiles/.tmux.conf /home/$USER/.tmux.conf
fi
