# Defaults
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock magnification -int 1
killall Dock
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder
# Can`t setting key repeat
# https://github.com/mathiasbynens/dotfiles/issues/687
mkdir -p ~/Pictures/Screenshots/
defaults write com.apple.screencapture location ~/Pictures/Screenshots/
defaults write com.apple.screencapture name "screenshot_"
killall SystemUIServer


cd ~/ && ln -s gh/settings/dotfiles/.* ./ && cd -

