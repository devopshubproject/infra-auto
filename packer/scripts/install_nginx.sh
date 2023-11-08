#!/bin/bash

# Install nginx
sudo apt-get update
sudo apt-get install -y nginx

# Replace default index.html with custom content
sudo rm /var/www/html/index.html
sudo cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
  <head>
    <title>Example Page</title>
  </head>
  <body>
    <h1>Welcome to Example Page 1!</h1>
  </body>
</html>
EOF

# Restart nginx service
sudo systemctl restart nginx



#############

#!/bin/bash

# Install nginx
sudo apt-get update
sudo apt-get install -y nginx

# Replace default index.html with custom content
if [[ "$(hostname)" == "backend1"* ]]; then
  # Set content for backend 1
  sudo rm /var/www/html/index.html
  sudo cat <<EOF > /var/www/html/index.html
  <!DOCTYPE html>
  <html>
    <head>
      <title>Example Page</title>
    </head>
    <body>
      <h1>Welcome to Example Page 1!</h1>
    </body>
  </html>
  EOF
else
  # Set content for backend 2
  sudo rm /var/www/html/index.html
  sudo cat <<EOF > /var/www/html/index.html
  <!DOCTYPE html>
  <html>
    <head>
      <title>Example Page</title>
    </head>
    <body>
      <h1>Welcome to Example Page 2!</h1>
    </body>
  </html>
  EOF
fi

# Restart nginx service
sudo systemctl restart nginx
