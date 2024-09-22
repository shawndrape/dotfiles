#!/bin/bash

# Get the repo's directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO_ROOT="${SCRIPT_DIR%/*}"


# dependency check
if ! command -v brew &> /dev/null; 
  then echo "Homebrew is not installed. Please install it first.";
   exit 1;
fi

# Brew install
brew bundle --file $REPO_ROOT/program_configs/brew/Brewfile

# Stow "install"
stow .

# setup iterm2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$REPO_ROOT/program_configs/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true