#!/bin/bash
#Ment to be run as root after buildout is done. Will obtain cert and install on nginx debian

cd /etc/nginx
ln -s /home/voteit/srv/sigbg_buildout/etc/nginx.conf ./sites-available/sigbg.conf
cd sites-enabled
ln -s ../sites-available/sigbg.conf

service nginx stop
certbot certonly --standalone -d sigbg.voteit.se
service nginx start
