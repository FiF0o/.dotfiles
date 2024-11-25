#!/usr/bin/env zsh

echo "Bootstraping dotfiles..."

echo "set permissions to execute files"
chmod -R +rwx ~/.dotfiles


# Setting up bare repository to checkout config
# Create dotfiles to be migrated to new machine
# https://www.atlassian.com/git/tutorials/dotfiles

git clone --bare git@github.com:FiF0o/.dotfiles.git $HOME/.dotfiles

function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    mkdir -p .config-backup
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    config checkout
fi;
config config status.showUntrackedFiles no


mydotfiles=(
    fonts.sh
    brew.sh
    install-terminal.sh
    link-dotfiles.sh
    .macos
)


function set_ssh_key()
{
    ssh-keygen -t rsa -b 4096 -C "lazarini.jonathan.com" -f ~/.ssh/jonlazarini_personal -P ""
    # ssh agent adds key for authenticating to GH 
    ssh-add ~/.ssh/jonlazarini_personal
    # https://stackoverflow.com/questions/26505980/ github-permission-denied-ssh-add-agent-has-no-identities

    # verify auth
    ssh -vT git@github.com
    echo 'copying key to clipboard & opening key settings on GH'
    pbcopy <  ~/.ssh/jonlazarini_personal.pub
    open https://github.com/settings/ssh/new
}
set_ssh_key

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