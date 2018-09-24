#!/bin/bash
#File name: deploy.sh
#Summary: Deploys RHEL/CentOS/Ubuntu system with settings customized by Kyle Sliva.
#                             Meant to be deployed in conjunction with the dotfiles folder.     
#                             Copy this to home directory.

#run this as root! or nothing will happen
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

apt-get update

#desktop init
#apt-get install -y curl git deluge htop redshift-gtk virt-manager qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils powerline keepassx filezilla gparted vim chromium-browser tmux unattended-upgrades

#server init
apt-get install -y curl git htop vim tmux unattended-upgrades update-notifier-common
# Check to see if a dotfile exists
# Back up dotfiles
# Symlink the enclosed dotfiles
if [[ -e /home/kyle/.bashrc ]]
then
                mv /home/kyle/.bashrc /home/kyle/.bashrc.bak
fi

if ! [[ -e /home/kyle/.bashrc ]]
then
                touch .bashrc
                ln -s /home/kyle/dotfiles/.bashrc /home/kyle/.bashrc
fi
 
if [[ -e /home/kyle/.vimrc ]]
then
                mv /home/kyle/.vimrc /home/kyle/.vimrc.bak
fi

if ! [[ -e /home/kyle/.vimrc ]]
then
                ln -s /home/kyle/dotfiles/.vimrc /home/kyle/.vimrc
fi

if [[ -e /home/kyle/.tmux.conf ]]
then
                mv /home/kyle/.tmux.conf /home/kyle/.tmux.conf.bak
fi            

if ! [[ -e /home/kyle/.tmux.conf ]]
then
                ln -s /home/kyle/dotfiles/.tmux.conf /home/kyle/.tmux.conf
fi


