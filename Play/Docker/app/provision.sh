set -e set -x


cd /usr/share/app
echo "Set ./conf/application.conf"
sed -i 's/^[^#]b\.default\.driver.*$/db.default.driver=org.postgresql.Driver/gm' ./conf/application.conf 
sed -i 's/^[^#]b\.default\.url.*$/db.default.url="jdbc:postgresql:\/\/postgres:5432\/restaurant_abh"/gm' ./conf/application.conf 
sed -i 's/^[^#]b\.default\.user.*$/db.default.user=abh/gm' ./conf/application.conf 
sed -i 's/^[^#]b\.default\.password.*$/db.default.password="password"/gm' ./conf/application.conf 

cat <<EOF >> ./conf/application.conf

applyEvolutions.default=true
pidfile.path=/var/run/activator/RUNNING_PID
production.application.mode=prod
EOF






if [ ! -d "/opt/play/" ]; then
	echo "Making /opt/play"
	sudo mkdir /opt/play
	sudo chown vagrant:vagrant /opt/play
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
    cat <<EOF | sudo tee /etc/profile.d/10-activator.sh
    #!/bin/sh
    export PATH=$PATH:/opt/play/activator
EOF

else 
	echo "/opt/activator exists"
	cd /opt/play
	export PATH=$PATH:/opt/play/activator
    cat <<EOF | sudo tee /etc/profile.d/10-activator.sh
    #!/bin/sh
    export PATH=$PATH:/opt/play/activator
EOF
fi





sudo mkdir -p /home/vagrant/.npm
sudo mkdir -p /home/vagrant/.config
sudo chown -R vagrant /home/vagrant/.npm/
sudo chown -R vagrant /home/vagrant/.config/


sudo npm install -g ember-cli 
sudo npm install -g bower 


sudo mkdir -p /home/vagrant/.npm
sudo mkdir -p /home/vagrant/.config
sudo chown -R vagrant /home/vagrant/.npm/
sudo chown -R vagrant /home/vagrant/.config/

cd /usr/share/app/ember/restaurant_abh
npm install



bower install 

cd /usr/share/app/
echo "Running ember build script"
./build-ember.sh 

sudo mkdir -p /var/run/activator
sudo chown vagrant /var/run/activator
echo "d! /var/run/activator 744 vagrant vagrant - -" | sudo tee /etc/tmpfiles.d/activator.conf


cd /usr/share/app/
activator stage
sudo mkdir /usr/share/app/dep
sudo chown vagrant /usr/share/app/dep
cp -r `sudo find / -name 'restaurant_abh' | grep -P -o ".+?(?=/target/universal/stage/bin/restaurant_abh)"`/target/* /usr/share/app/dep/
