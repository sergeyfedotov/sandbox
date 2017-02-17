```
docker-machine create --driver generic --generic-ip-address={MASTER_ADDR} --generic-ssh-key ~/.ssh/id_rsa master
docker-machine create --driver generic --generic-ip-address={SLAVE1_ADDR} --generic-ssh-key ~/.ssh/id_rsa slave1
docker-machine create --driver generic --generic-ip-address={SLAVE2_ADDR} --generic-ssh-key ~/.ssh/id_rsa slave2
docker-machine ssh master docker swarm init --advertise-addr {MASTER_ADDR}
docker-machine ssh slave1 docker swarm join --token {TOKEN} {MASTER_ADDR}:2377
docker-machine ssh slave2 docker swarm join --token {TOKEN} {MASTER_ADDR}:2377
docker-machine env master
eval $(docker-machine env master)
docker login registry.gitlab.com
docker stack deploy --compose-file docker-stack.yml --with-registry-auth example
```
