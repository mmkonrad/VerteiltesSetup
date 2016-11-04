#!/bin/sh

# Create Default RabbitMQ setup
( sleep 10 ; \

# Create users
rabbitmqctl add_user booking booking ; \
rabbitmqctl add_user seatoverview seatoverview ; \
rabbitmqctl add_user seatmanagement seatmanagement ; \
rabbitmqctl add_user notification notification ; \
# Set user rights
rabbitmqctl set_user_tags booking bookingservice ; \
rabbitmqctl set_user_tags seatoverview seatoverviewservice ; \
rabbitmqctl set_user_tags seatmanagement seatmanagementservice ; \
rabbitmqctl set_user_tags notification notificationservice ; \
# Create vhosts
rabbitmqctl add_vhost host_db ; \
# Set vhost permissions
rabbitmqctl set_permissions -p host_db booking ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p host_db seatoverview ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p host_db seatmanagement ".*" ".*" ".*" ; \
rabbitmqctl set_permissions -p host_db notification ".*" ".*" ".*" ; \
) &    
rabbitmq-server $@
