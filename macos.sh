#!/usr/bin/env bash

# ~/.macos — https://mths.be/macos
#
# Trimmed to settings that are actually wanted and verified to work on current
# macOS. Everything here writes a user domain, so no sudo is required.

# Close any open System Settings panes, to prevent them from overriding
# settings we're about to change
osascript -e 'tell application "System Settings" to quit'

###############################################################################
# Keyboard, trackpad and text input                                           #
###############################################################################

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Curly quotes are not shell quoting, so substitution silently breaks scripts:
# it is how `man`, osascript and a sqlite3 statement in .aliases came to fail.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it's annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

###############################################################################
# Finder                                                                      #
###############################################################################

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Open new Finder windows in the home directory
defaults write com.apple.finder NewWindowTarget -string "PfHm"

# Show all filename extensions, and stop warning when one changes
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show the status and path bars
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Stop littering .DS_Store files on network shares and USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

defaults write com.apple.dock tilesize -int 65

# Minimize windows into their application's icon
defaults write com.apple.dock minimize-to-application -bool true

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don't show recent applications in the Dock
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop as PNG
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
