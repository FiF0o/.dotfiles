#!/usr/bin/env zsh

# ./install-terminal.sh; set_terminal
function set_terminal()
{
    brew install zsh
    brew install zsh-completions
    brew install iterm2 --cask
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    # set ui profile
    # cp .dotfiles/configurations/iterm2.profile.dark.json ~/Library/Application\ Support/iTerm2/DynamicProfiles
    echo "Your 🐚 is: $SHELL; with version: $(zsh --version)"
}

# set_terminal;