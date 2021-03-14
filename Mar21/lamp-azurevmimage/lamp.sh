#!/bin/bash
sudo apt update
sleep 30s
sudo apt install apache2 -y
sleep 30s
sudo apt install php libapache2-mod-php php-cli -y
echo '<?php phpinfo(); ?>' | sudo tee /var/www/html/info.php
sudo systemctl enable apache2
sudo systemctl restart apache2