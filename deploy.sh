#!/bin/bash
#File name: deploy.sh
#Summary: Deploys RHEL/CentOS/Ubuntu system with settings customized by Kyle Sliva.
#                             Meant to be deployed in conjunction with the dotfiles folder.     
#                             Copy this to home directory.
# https://help.ubuntu.com/community/AutomaticSecurityUpdates
#This is helpful for server deployments!

#run this as root! or nothing will happen
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

apt update

#desktop init
apt install -y curl git deluge htop redshift-gtk virt-manager qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils powerline keepassxc filezilla gparted vim chromium-browser rsync tmux unattended-upgrades jq python3-pip ansible python-pip netcat nmap solaar tcpdump

#server init
#apt-get install -y curl rsync git htop vim tmux unattended-upgrades jq python3-pip powerline ansible python-pip netcat nmap
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

#install pathogen for vim
sudo mkdir -p ~/.vim/autoload ~/.vim/bundle
sudo curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

#Installs airline for vim
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

#install vim fugitive
sudo mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
sudo git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q

#Installs tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
