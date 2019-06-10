#!/bin/sh

cd ~
pwd

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

# TODO add .env to be sourced
# ./.env.*

echo '\n\n'
echo 'All Done! ✅'
echo '😎'
exit 0
