#/bin/sh
# Add the Webmin repository
sudo sh -c 'cat << EOF >> /etc/apt/sources.list
deb http://download.webmin.com/download/repository sarge contrib
EOF'

# Add key
wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc

# Install Webmin
sudo apt update
sudo apt install webmin
