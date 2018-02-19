set -e


#Insecure write your own script here
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs


echo "Updating and upgrading the system"
sudo apt-get update -y  
sudo apt-get upgrade -y 
echo "Installing default-jre"
sudo apt-get install -y default-jre 
echo "Installing default-jdk"
sudo apt-get install -y default-jdk 
echo "Installing postgresql"
sudo apt-get install -y postgresql 
echo "Installing postgis and postgresql-9.5-postgis-2.2"
sudo apt-get install -y postgis postgresql-9.5-postgis-2.2 

cd /vagrant

echo "Running psql"
echo "CREATE DATABASE restaurant_abh;"
if sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw restaurant_abh; then
    echo "DB already exists"
else
sudo -u postgres psql -c "CREATE DATABASE restaurant_abh;" 
fi

echo "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology;"
sudo -u postgres psql -c "CREATE EXTENSION IF NOT EXISTS postgis; CREATE EXTENSION IF NOT EXISTS  postgis_topology;" restaurant_abh 

echo "Createuser abh"
sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='abh'" | grep -q 1 || sudo -u postgres createuser abh
echo "Change abh user password"
sudo -u postgres psql -c "alter user abh with encrypted password 'password';"  
echo "Grant abh user privileges on the restaurant_abh database"
sudo -u postgres psql -c "grant all privileges on database restaurant_abh to abh; " 

echo "Set ./conf/application.conf"
sed -i 's/^[^#]b\.default\.driver.*$/db.default.driver=org.postgresql.Driver/gm' ./conf/application.conf 
sed -i 's/^[^#]b\.default\.url.*$/db.default.url="jdbc:postgresql:\/\/127.0.0.1:5432\/restaurant_abh"/gm' ./conf/application.conf 
sed -i 's/^[^#]b\.default\.user.*$/db.default.user=abh/gm' ./conf/application.conf 
sed -i 's/^[^#]b\.default\.password.*$/db.default.password="password"/gm' ./conf/application.conf 

cat <<EOF >> ./conf/application.conf

applyEvolutions.default=true
pidfile.path=/var/run/activator/RUNNING_PID
production.application.mode=prod
EOF


echo "Installing unzip and npm"
sudo apt-get install -y unzip 
#sudo apt-get install -y npm  

if [ ! -d "/opt/play/" ]; then
	echo "Making /opt/play"
	sudo mkdir /opt/play
	sudo chown vagrant /opt/play
	echo "Installing typesafe-activator"
	cd /opt/play
	echo "Downloading activator"
	wget http://downloads.typesafe.com/typesafe-activator/1.3.2/typesafe-activator-1.3.2-minimal.zip 
	echo "Unziping activator"
	unzip typesafe-activator-1.3.2-minimal.zip 
	echo "Renaming activator-1.3.2.minimal to activator"
	mv activator-1.3.2-minimal activator 
	echo "Removing unnecessary files"
	rm -rf typesafe-activator-1.3.2-minimal.zip 
	echo "Adding activator to PATH and making it executable"
	export PATH=$PATH:/opt/play/activator
	chmod +x `which activator/activator` 
else 
	echo "/opt/activator exists"
	cd /opt/play
	export PATH=$PATH:/opt/play/activator
fi

cd /vagrant
echo "Adding alias node to nodejs"
sudo ln -sf `which nodejs` /usr/bin/node 
echo "Installing ember-cli and bower with npm"
sudo npm install -g ember-cli 
sudo npm install -g bower 


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

cat <<EOF | sudo tee /etc/systemd/system/restaurant_abh.service
[Unit]
Description=Restaurant_abh server

[Service]
User=vagrant
ExecStart="/vagrant/target/universal/stage/bin/restaurant_abh"
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

sudo mkdir -p /var/run/activator

sudo chown vagrant /var/run/activator

echo "d! /var/run/activator 744 vagrant vagrant - -" | sudo tee /etc/tmpfiles.d/activator.conf

sudo systemctl daemon-reload
sudo systemctl enable restaurant_abh.service
sudo systemctl start restaurant_abh.service
