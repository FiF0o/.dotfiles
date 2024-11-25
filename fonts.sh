#!/usr/bin/env bash

# ./fonts.sh; install_dependencies
function install_dependencies()
{
    echo "installing fonts...."
    brew install --cask font-fira-code
    echo "fonts done ✅"
}

install_dependencies;