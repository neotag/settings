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

# Tools

## Vagrant

## Sierra で vagrant の curl が動かないので削除して system のをつかう
sudo mv /opt/vagrant/embedded/bin/curl /opt/vagrant/embedded/bin/curl_renamed_for_sierra
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-vmware-fusion
vagrant plugin license vagrant-vmware-fusion ~/Dropbox/license/vagrant-vmware-provider/license.lic

## Anyenv

git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(anyenv init -)"' >> ~/.zprofile
exec $SHELL -l

anyenv install rbenv
anyenv install ndenv
exec $SHELL -l

