#!/bin/sh

cd ~
pwd

sudo chown -R $(whoami):admin /usr/local/* && sudo chmod -R g+rwx /usr/local/*

echo '\n'
echo 'Installing Brew... ☕️'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew --version
brew tap caskroom/cask
echo 'Brew installed'

./.install-terminal.sh
./.install-dev-toolkit.sh
./.install-machine.sh
./.install-vscode-extensions.sh
./.install-softwares.sh
./.install-dotfiles.sh

# TODO add .env to be sources
# ./.env.*

echo '\n\n'
echo 'All Done! ✅'
echo '😎'
exit 0
