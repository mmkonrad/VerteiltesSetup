sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)


sudo docker-compose up -d
sleep 30

sudo docker run -d \
    --name=registrator \
    --net=host \
    --volume=/var/run/docker.sock:/tmp/docker.sock \
    gliderlabs/registrator:latest \
      consul://127.0.0.1:8500

cd "testdata"
#flush redis instances
redis-cli flushall
redis-cli -p 6380 flushall
redis-cli -p 6381 flushall
redis-cli -p 6382 flushall

#initialize databases and tables
sudo docker exec -i seat_database_copy mysql -uroot -proot < seat_init.sql
sudo docker exec -i seat_database mysql -uroot -proot < seat_init.sql
sudo docker exec -i customer_database mysql -uroot -proot < customer_init.sql
sudo docker exec -i cassandra cqlsh < booking_init.cql

#correct testdata
sudo docker exec -i seat_database_copy mysql -uroot -proot < seatoverview_data.sql
sudo docker exec -i seat_database mysql -uroot -proot < seatmanagement_data.sql
sudo docker exec -i customer_database mysql -uroot -proot < customer_data.sql

sudo docker exec -i cassandra cqlsh < booking_init.cql
redis-cli -p 6381 flushall
redis-cli -p 6382 flushall
