#!/bin/bash
echo "Updating and upgrading the system"
sudo apt-get update -y  
sudo apt-get upgrade -y 
sudo apt-get install -y curl apt-utils wget git
#Insecure write your own script here
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs


echo "Installing default-jre"
sudo apt-get install -y default-jre 
echo "Installing default-jdk"
sudo apt-get install -y default-jdk 

echo "Installing unzip and npm"
sudo apt-get install -y unzip 
#sudo apt-get install -y npm  


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



cd /usr/share/app
echo "Adding alias node to nodejs"
if [ ! -f "/usr/bin/node" ]; then
    sudo ln -sf `which nodejs` /usr/bin/node 
fi
echo "Installing ember-cli and bower with npm"