# Windfire - Roberto Pozzi website
[TODO]

## Configuration for Raspberry deployment
Apache2 works as web server and serves all content except images
    - configuration in /etc/apache2/apache2.conf
Nginx works as Reverse Proxy and serves images directly from /var/www/html directories
    - configuration in /etc/nginx/sites-enabled/default
