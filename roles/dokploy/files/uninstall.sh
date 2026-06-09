docker service remove dokploy dokploy-traefik dokploy-postgres dokploy-redis
docker container remove -f dokploy-traefik
docker volume remove -f dokploy dokploy-postgres dokploy-redis
docker network remove -f dokploy-network
docker network remove -f ingress
sudo rm -rf /etc/dokploy