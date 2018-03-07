[[ `command -v puppet` ]] && exit 0
sudo apt update
sudo apt install rubygems -y
sudo gem install puppet bundler --no-rdoc --no-ri
