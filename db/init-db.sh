#!/bin/bash
set -e

echo "🔹 Waiting for PostgreSQL to start..."
until pg_isready -h localhost -p 5432 -U $POSTGRES_USER; do
    sleep 2
done

echo "✅ PostgreSQL is running. Copying custom pg_hba.conf and postgresql.conf..."

# Ensure PostgreSQL has initialized before copying files
if [ -d "/var/lib/postgresql/data" ] && [ "$(ls -A /var/lib/postgresql/data)" ]; then
    cp /startup/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf
    cp /startup/postgresql.conf /var/lib/postgresql/data/postgresql.conf
    chown postgres:postgres /var/lib/postgresql/data/pg_hba.conf
    chown postgres:postgres /var/lib/postgresql/data/postgresql.conf
    chmod 600 /var/lib/postgresql/data/pg_hba.conf
    chmod 600 /var/lib/postgresql/data/postgresql.conf
    echo "✅ Configuration copied successfully!"

    # ✅ Reload PostgreSQL configuration to apply changes
    echo "🔄 Reloading PostgreSQL configuration..."
    PGPASSWORD=$POSTGRES_PASSWORD psql -U $POSTGRES_USER -d $POSTGRES_DB -c "SELECT pg_reload_conf();"
    echo "✅ PostgreSQL configuration reloaded!"
else
    echo "⚠️ PostgreSQL data directory is empty, skipping config copy."
fi
