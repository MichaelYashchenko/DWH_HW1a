#!/bin/bash

# echo "host all all all scram-sha-256" >> "$PGDATA/pg_hba.conf"
set -e

echo "Setup start"

# Create replicator user
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER replicator WITH REPLICATION ENCRYPTED PASSWORD 'my_replicator_password';
    SELECT * FROM pg_create_physical_replication_slot('replication_slot_slave1');
EOSQL
# cat >> ${PGDATA}/postgresql.conf <
# wal_level = logical
# hot_standby = on
# max_wal_senders = 10
# max_replication_slots = 10
# hot_standby_feedback = on
# EOF
# Backup master
# pg_basebackup -D /var/lib/postgresql/data-slave -S replication_slot_slave1 -X stream -P -U replicator -Fp -R

# Init slave
# cp /etc/postgresql/init-script/slave-config/* /var/lib/postgresql/data-slave
# cp /etc/postgresql/init-script/config/pg_hba.conf /var/lib/postgresql/data

# Shutdown
# pg_ctl -D "/var/lib/postgresql/data" -m fast -w stop

echo "Setup finished"
