#!/usr/bin/env zsh

echo "Bootstraping dotfiles..."

echo "set permissions to execute files"
chmod -R +rwx ~/.dotfiles

mydotfiles=(
    fonts.sh
    brew.sh
    # download dotfiles
    install-terminal.sh
    link-dotfiles.sh
    # create aliaes for git bare repo
    # .macos
)

# TODO: 
# Create dotfiles to be migrated to new machine
# git init --bare $HOME/.dotfiles
# alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME/.dotfiles/'
# dotfiles config status.showUntrackedFiles no
# git clone --separate-git-dir=~/.toto git@github.com:FiF0o/.dotfiles.git

ssh-keygen -t rsa -b 4096 -C "lazarini.jonathan.com" -f ~/.ssh/jonlazarini_personal -P ""
# ssh agent adds key for authenticating to GH 
ssh-add ~/.ssh/jonlazarini_personal
# https://stackoverflow.com/questions/26505980/github-permission-denied-ssh-add-agent-has-no-identities

# verify auth
ssh -vT git@github.com
echo 'copying key to clipboard & opening key settings on GH'
pbcopy <  ~/.ssh/jonlazarini_personal.pub
open https://github.com/settings/ssh/new


for script in $mydotfiles; do
    # Check if it's a regular file
    if [ -f "$script" ]; then
        echo "Executing script: $script"
        
        # Make sure the script has execute permissions
        if [ ! -x "$script" ]; then
            echo "Warning: Script $script is not executable. Attempting to add execute permissions."
            chmod +x "$script"
        fi
        
        # Run the script and capture the exit status
        # if ! "./$script"; then
        if ! (source $script); then
            echo "Error: Script $script failed to execute!"
        else
            echo "Successfully executed script $script"
        fi
    else
        echo "Skipping non-file or non-bash script: $script"
    fi
done

echo "Script execution completed."