#!/bin/sh
# wait-for-postgres.sh

host="$1"
port="$2"

until PGPASSWORD=$DB_PASS psql -h $host -p $port -U postgres -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done