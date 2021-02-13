# Change system defaults
echo "Would you like to change system default settings?"
echo "Respond with Y for yes or N for no."
read defaults

if [ $defaults == "Y" ]
then
    # Safari Developer
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
    defaults write -g WebKitDeveloperExtras -bool true

    # Dock Settings
    defaults write com.apple.dock autohide -bool true # Hide the dock automatically
    defaults write com.apple.dock show-recents -bool false # Don't show recent applications in dock
    killall Dock

    # Finder Settings
    defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true # Show hard drives on Desktop
    defaults write com.apple.finder AppleShowAllFiles true # Show all files (primarily for dotfiles)
    defaults write com.apple.finder QuitMenuItem -bool true # Press cmd + q to quit finder
    killall Finder

    # Don't create .DS_Store files
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

    # Disable auto-correct
    defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

    # Check for software updates daily
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

    # Change time zone
    echo "Would you like to change your current timezone?"
    echo "(for if you turned of location services)"
    echo "Respond with Y for yes or N for no."
    read settimezone
    if [ $settimezone == "Y" ]
    then
        echo "What is your current timezone?"
        echo "Respond with Continent/City"
        read timezone
        sudo systemsetup -settimezone $timezone
    fi
fi

# Install XCode Command Line Tools (CLT)
xcode-select --install

# Install Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

# Install Fish Shell
brew install fish

# Make Fish Shell the default shell
echo $(brew --prefix)/bin/fish | sudo tee -a /etc/shells
chsh -s $(brew --prefix)/bin/fish

# Install Starship
brew install starship
echo "starship init fish | source" > ~/.config/fish/config.fish

# Install font Fira Code
brew tap homebrew/cask-fonts
brew install font-fira-code

# Install Formulae
brew install gh
brew install node
brew install deno
brew install tectonic

# Install Casks
brew install --cask visual-studio-code
brew install --cask firefox
brew install --cask google-chrome
brew install --cask tor-browser
brew install --cask discord
