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
sudo apt install libnet-ssleay-perl libauthen-pam-perl libio-pty-perl apt-show-versions unzip python -y
sudo apt install webmin
