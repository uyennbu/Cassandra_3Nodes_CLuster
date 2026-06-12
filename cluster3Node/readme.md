# hard setup
install docker
docker pull cassandra:latest
create docker compose file: docker-compose.yml
run the command: docker-compose up -d
wait for the nodes to start
connect to one of the nodes: docker exec -it <container_id> cqlsh
-> start querying the cluster
# PERFORMING OPERATIONS
# setup-cassandra-cluster
docker compose up
docker exec -it cassandra-1 cqlsh
docker exec -it cassandra-2 cqlsh
docker exec -it cassandra-3 cqlsh
# check keyspace status
DESC KEYSPACE cycling;
docker exec -it cassandra-1 nodetool status cycling
SELECT * FROM cycling.cyclist_semi_pro;
# when one node is down
docker stop cassandra-3
docker exec -it cassandra-1 nodetool status cycling
SELECT * FROM cycling.cyclist_semi_pro;
# one node is down but replication factor is 2
DESC KEYSPACE cycling_contest;
docker exec -it cassandra-1 nodetool status cycling_contest
DESC KEYSPACE cycling_contest;
SELECT * FROM cycling_contest.staffs;
# consistency level test
CONSISTENCY;
CONSISTENCY TWO;
SELECT * FROM cycling_contest.staffs;