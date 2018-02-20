export PATH=$PATH:/opt/play/activator

cd /vagrant/ember/restaurant_abh
echo "Installing project node modules"
mkdir -p ~/rabh/
cp package.json ~/rabh/
cd ~/rabh/

sudo chown -R $USER:$(id -gn $USER) /home/vagrant/.config
npm install
mkdir -p /vagrant/ember/restaurant_abh/node_modules/
sudo mount --bind ~/rabh/node_modules/ /vagrant/ember/restaurant_abh/node_modules/

echo "/home/vagrant/rabh/node_modules /vagrant/ember/restaurant_abh/node_modles none defaults,bind 0 0" | sudo tee -a /etc/fstab


cd /vagrant/ember/restaurant_abh
echo "Installing project bower components"
bower install 

cd /vagrant/
echo "Running ember build script"
./build-ember.sh 

echo "Making binary for service to start"
activator stage 
sudo systemctl restart restaurant_abh.service
