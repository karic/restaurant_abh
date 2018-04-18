#!/bin/bash
sudo apt-get install -y curl apt-utils wget git unzip default-jre default-jdk

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
