# on server
  ## to create certificates run
  docker-compose -f nginx-proxy-compose.yml run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d bluechickenwings.online

# after certificates
  ## to create certificates run
  docker-compose -f nginx-proxy-compose.yml run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d bluechickenwings.online