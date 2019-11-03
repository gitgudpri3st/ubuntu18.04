#/bin/sh
# Install Nginx
sudo apt-get update
sudo apt-get install nginx

# Install MySQL
sudo apt-get install mysql-server # Or MariaDB: sudo apt-get install mariadb-server
sudo mysql_secure_installation

# Install PHP 7.2
sudo apt install php-fpm php-mysql

sudo touch /etc/nginx/sites-available/example.com
sudo bash -c 'cat > /etc/nginx/sites-available/example.com << EOL
server {
        listen 80;
        root /var/www/html;
        index index.php index.html index.htm index.nginx-debian.html;
        server_name example.com;

        location / {
                try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }
}
EOL'
sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/
sudo unlink /etc/nginx/sites-enabled/default

sudo nginx -t
sudo systemctl reload nginx
