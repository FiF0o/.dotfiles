#!/bin/sh

echo '\n'
echo 'Installing apps ...'

brew cask install whatsapp
brew cask install google-chrome
brew cask install charles
brew cask install arduino
# used for ps2pdf to alter pdf reso instead of Acrobat
brew install ghostscript

### TODO softwares without brew formulae :(
# Adobe
# Affinity Designer.app
# Affinity Photo.app
# AirParrot 2.app
# Android File Transfer.app
# Canon Utilities
# Cisco Jabber.app
# Framer Studio.app
# GraphQL
# Hype2.app ?
# Kaleidoscope.app ?
# OmniGraffle.app ?
# ScreenFlow.app
# Silverback.app
# Skala Preview.app ?
# TheBrain.app
# xSort.app
# zoom.us.app

# install react-native-cli things
# android studio: https://facebook.github.io/react-native/docs/0.60/getting-started
npm install -g react-native-cli
brew install watchman
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8

echo '... Apps installation finished'