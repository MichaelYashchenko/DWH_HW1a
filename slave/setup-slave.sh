#!/bin/bash

sleep 10s

echo "Setup start"

until pg_basebackup -h postgres_master -D /var/lib/postgresql/data-slave -S replication_slot_slave1 -X stream -P -U replicator -Fp -R
do
    echo "Waiting for master to connect..."
    sleep 1s
done
# echo "host all all all scram-sha-256" >> "$PGDATA/pg_hba.conf"
# Init slave
# cp /etc/postgresql/init-script/slave-config/* /var/lib/postgresql/data-slave
# cp /etc/postgresql/init-script/config/pg_hba.conf /var/lib/postgresql/data

echo "Setup finished"