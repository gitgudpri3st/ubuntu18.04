cd /hdd && mkdir demo && cd demo
wget -N --no-check-certificate https://release.larsjung.de/h5ai/h5ai-0.29.2.zip
sudo apt install unzip -y && unzip -o h5ai-0.29.2.zip && rm h5ai-0.29.2.zip

HOST_IP=`hostname -I | cut -d' ' -f1`

sudo touch /etc/nginx/sites-available/h5ai
sudo bash -c 'cat > /etc/nginx/sites-available/h5ai << EOL 
server {
    listen 80;
    server_name $HOST_IP;
    root /hdd/demo;
    index /_h5ai/public/index.php;
    limit_rate 1500k;
    auth_basic off;

    location / {
      try_files $uri $uri/ =404;
    }

    location /_h5ai/privates/conf/options.json {
      allow 127.0.0.1;
      deny all;
      try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
      fastcgi_pass unix:/run/php/php7.2-fpm.sock;
      include snippets/fastcgi-php.conf;
    }

    location ~ /\.ht {
      deny all;
    }
}
EOL'

sudo ln -s /etc/nginx/sites-available/h5ai /etc/nginx/sites-enabled/h5ai
sudo chown -R www-data:www-data /hdd/demo
sudo systemctl reload nginx.service
