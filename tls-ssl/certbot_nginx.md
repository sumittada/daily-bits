### Install certbot on Ubuntu 16.04 as follows:

`sudo apt update && sudo apt install -y software-properties-common && sudo add-apt-repository ppa:certbot/certbot`

`sudo apt update && sudo apt install -y python-certbot-nginx`

### Let certbot handle everything and use quiet mode with all flags already passed in command

`sudo certbot --nginx --agree-tos -m cloud@sumit.fi -n -d fun.sumit.fi -d moarfun.sumit.fi`


Check your nginx configuration to ensure things are as they should be, tweak it if needed and reload nginx.
