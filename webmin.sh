#/bin/sh
# Add the Webmin repository
sudo touch /etc/apt/sources.list
sudo bash -c 'cat > /etc/apt/sources.list << EOL
deb http://download.webmin.com/download/repository sarge contrib
EOL'

# Add key
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc

# Install Webmin
sudo apt update
sudo apt install webmin
