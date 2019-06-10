#!/bin/sh

echo 'Installing Node 🕸'
brew install node
node --version
echo '... Node installed'

echo 'Installing nvm 🕸'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm --version
nvm install 12.0.0
nvm ls
echo '... nvm installed'

echo '\n'
echo 'Installing python dependencies 🐍'
python -V
echo '*** ...installing pip...'
sudo easy_install pip
echo '*** ...pip install finished...'
echo '*** ...installing virtualenv...'
pip install --user virtualenv
echo '*** ...virtualenv install finished...'
echo '... python dependencies installed'

echo '\n'
echo '...Installing ruby dependencies 💎'
brew install rbenv
# echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshrc
# source ~/.zshrc
brew install cmake
sudo gem install bundler
echo '💎 dependencies installed'

echo '\n'
echo '...Installing dev tools'
brew cask install iterm2
brew cask install visual-studio-code
  
echo '...dev tools installed'