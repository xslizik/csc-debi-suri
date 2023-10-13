cd /root/DVWA
curl https://get.docker.com | bash
curl -L https://github.com/docker/compose/releases/download/v2.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose -f compose.yml up -d