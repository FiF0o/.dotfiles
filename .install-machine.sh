#!/bin/sh

echo '\n'
echo 'Setting up your computerName 🖋'
read -p "what is your hostname? \n" newHostname
sudo scutil --set HostName ${newHostname}
sudo scutil --set ComputerName ${newHostname}
echo "your new hostname is: ${newHostname}"
echo '..hostname written'

echo '\n'
echo 'Setting up your new .dotfiles 🔐 in ./cfg'
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc
echo '..hostname written'

# git config
echo '\n'
read -p "what email do you want to use? " gitEmail
git config --global user.email ${gitEmail}
read -p "what is your username? " gitUsername
git config --global user.name ${gitUsername}
cat ~/.gitconfig

# ssh keys
echo '\n'
ssh-keygen -t rsa -b 4096 -C "${gitEmail}"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
echo 'Add the following ssh key to your github account:'
echo '\n'
cat ~/.ssh/id_rsa.pub
echo 'Copying public ssh key to clipboard'
pbcopy < ~/.ssh/id_rsa.pub
echo 'Opening github.com'
open https://github.com/settings/keys
