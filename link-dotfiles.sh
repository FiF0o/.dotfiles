cd ~
mkdir Development
mkdir ~/Development/work
mkdir ~/Development/personal
mkdir -p ~/.ssh

# symlinks are optional are .dotfile is set a bare repo
# credits: https://news.ycombinator.com/item?id=11070797
ln -s ~/.dotfiles/.zshrc                ~/.zshrc
ln -s ~/.dotfiles/.zprofile             ~/.zprofile
ln -s ~/.dotfiles/.functions            ~/.functions
ln -s ~/.dotfiles/.aliases              ~/.aliases
ln -s ~/.dotfiles/.zshenv               ~/.zshenv
ln -s ~/.dotfiles/.zlogin               ~/.zlogin

ln -s ~/.dotfiles/.vimrc                ~/.vimrc

ln -s ~/.dotfiles/.gitconfig            ~/.gitconfig
ln -s ~/.dotfiles/.gitignore            ~/.gitignore
ln -s ~/.dotfiles/.gitconfig.work       ~/.gitconfig.work
ln -s ~/.dotfiles/.gitconfig.personal   ~/.gitconfig.personal
ln -s ~/.dotfiles/.gitconfig-local      ~/.gitconfig-local

ln -s ~/.dotfiles/.editorconfig         ~/.editorconfig
# vscode global config
cp ~/.dotfiles/configurations/settings.json ~/Library/Application\ Support/Code/User/settings.json

###########################################################
##                     Mac Config                        ##
###########################################################
# source ./.macos



# ./.install-dev-toolkit.sh
# ./.install-machine.sh
# ./.install-vscode-extensions.sh
# ./.install-softwares.sh
# ./.install-dotfiles.sh

# echo '\n\n'
# echo 'All Done! ✅'
# echo '😎'
# exit 0
