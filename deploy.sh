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

apt-get update
apt-get install -y git deluge htop virt-manager qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils powerline keepassx filezilla gparted vim chromium tmux unattended-upgrades

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

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline