#!/bin/sh

echo '\n'
echo 'Configuring .dotfiles to be visible 🔍'
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder /System/Library/CoreServices/Finder.app

echo '\n'
echo 'Fetching all the .dotfiles and configuring them... ⚙️'
mv .dotfiles/.* ./
mv .dotfiles/Library/Application\ Support/Code/User/settings.json Library/Application\ Support/Code/User/
rm -rf .git .dotfiles
source ~/.zshrc
echo '... .dotfiles and configuration done'
