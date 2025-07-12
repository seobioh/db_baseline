#!/bin/bash
set -e

echo "🔹 Starting PostgreSQL setup..."

# Postgres 실행 대기
until pg_isready -h localhost -p 5432 -U "$POSTGRES_USER"; do
    sleep 2
done

# Postgres 설정
echo "✅ PostgreSQL is up. Copying configs..."
cp /startup/pg_hba.conf /var/lib/postgresql/data/pg_hba.conf
cp /startup/postgresql.conf /var/lib/postgresql/data/postgresql.conf
chown postgres:postgres /var/lib/postgresql/data/*.conf
chmod 600 /var/lib/postgresql/data/*.conf

# 원래 entrypoint 실행
echo "🚀 Launching PostgreSQL..."
exec docker-entrypoint.sh postgres
