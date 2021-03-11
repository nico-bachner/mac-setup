# Install XCode Command Line Tools (CLT)
xcode-select --install

# Install Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

# Install Fish Shell
brew install fish

# Make Fish Shell the default shell
echo $(brew --prefix)/bin/fish | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/fish
set fish_greeting ""
