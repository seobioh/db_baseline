FROM postgres:15.4

RUN mkdir -p /startup
COPY pg_hba.conf /startup/pg_hba.conf
COPY postgresql.conf /startup/postgresql.conf
COPY init-db.sh /startup/init-db.sh

RUN chmod +x /startup/init-db.sh
EXPOSE 5432
