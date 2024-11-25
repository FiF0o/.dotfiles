# ./brew.sh; brew_dependencies
function brew_dependencies()
{
    echo "installing brew dependencies...."
    # Make sure we’re using the latest Homebrew.
    brew update
    # list formulas
    brew list --full-name

    ############################################################
    ##                        FORMULAE                        ##
    ############################################################
    # Upgrade any already-installed formulae.
    brew upgrade
    brew install --cask visual-studio-code
    brew install wget

    echo "brew dependencies done ✅"
    brew list --full-name
}

brew_dependencies;
