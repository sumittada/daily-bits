### Install certbot on Ubuntu 16.04 as follows:

`sudo apt update && sudo apt install -y software-properties-common && sudo add-apt-repository ppa:certbot/certbot`

`sudo apt update && sudo apt install -y python-certbot-nginx`

### Let certbot handle everything and use quiet mode with all flags already passed in command

`sudo certbot --nginx --agree-tos -m cloud@sumit.fi -n -d fun.sumit.fi -d moarfun.sumit.fi`


Check your nginx configuration to ensure things are as they should be, tweak it if needed and reload nginx.


Sample Nginx.conf
```

server {
        listen 80;
        listen [::]:80;
        listen [::]:443 ssl ipv6only=on; # managed by Certbot
        listen 443 ssl; # managed by Certbot
        ssl_certificate /etc/letsencrypt/live/moarfun.sumit.fi/fullchain.pem; # managed by Certbot
        ssl_certificate_key /etc/letsencrypt/live/moarfun.sumit.fi/privkey.pem; # managed by Certbot
        include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
        ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
        # Redirect non-https traffic to https
        if ($scheme != "https") {
          return 301 https://$host$request_uri;
         } # managed by Certbot
        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;
        server_name moarfun.sumit.fi; # managed by Certbot
        location / {
                try_files $uri $uri/ =404;
        }
}
```
