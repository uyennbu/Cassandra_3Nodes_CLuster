(link to chGPT)[https://chatgpt.com/c/69131162-c438-8324-a1ae-247511385bd4]

install docker

docker pull cassandra:latest

create docker compose file: docker-compose.yml

run the command: docker-compose up -d

wait for the nodes to start

connect to one of the nodes: docker exec -it <container_id> cqlsh

-> start querying the cluster