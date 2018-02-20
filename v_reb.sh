cd /vagrant/ember/restaurant_abh
echo "Installing project node modules"
mkdir -p ~/rabh/
cp package.json ~/rabh/
cd ~/rabh/

sudo chown -R $USER:$(id -gn $USER) /home/vagrant/.config
rm -rf ~/rabh/node_modules
npm install
sudo umount /vagrant/ember/restaurant_abh/node_modules/
rm -rf /vagrant/ember/restaurant_abh/node_modules/
mkdir -p /vagrant/ember/restaurant_abh/node_modules/
sudo mount --bind ~/rabh/node_modules/ /vagrant/ember/restaurant_abh/node_modules/

echo "/home/vagrant/rabh/node_modules /vagrant/ember/restaurant_abh/node_modles none defaults,bind 0 0" | sudo tee -a /etc/fstab


#mkdir ./node_modules/
#sudo mount --bind ~/node_modules/ ./node_modules/
#npm install -no-bin-links
cd /vagrant/ember/restaurant_abh
echo "Installing project bower components"
bower install 

cd /vagrant/
echo "Running ember build script"
./build-ember.sh 

echo "Making binary for service to start"
activator stage 
sudo systemctl restart restaurant_abh.service
