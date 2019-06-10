#!/bin/sh

echo 'installing terminal and configuring it'
echo '💻'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install zsh zsh-completions
echo 'Your 🐚 is:'
echo $SHELL
zsh --version
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
brew tap caskroom/fonts
brew cask install font-fira-code
echo 'terminal installation finished'