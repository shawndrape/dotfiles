# dependency check
if ! command -v brew &> /dev/null; 
  then echo "Homebrew is not installed. Please install it first.";
   exit 1;
fi

# pre-install
if ! brew ls --versions "stow"; then brew install "stow"; fi

# Main install
stow .

# setup iterm2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2_profile"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true