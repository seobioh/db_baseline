FROM postgres:15.4

RUN mkdir -p /startup && ls -l /startup
COPY pg_hba.conf /startup/pg_hba.conf
COPY postgresql.conf /startup/postgresql.conf
COPY init-db.sh /startup/init-db.sh

RUN chmod +x /startup/init-db.sh

ENV POSTGRES_USER = your_db_user
ENV POSTGRES_PASSWORD = your_db_password
ENV POSTGRES_DB = your_db_name

EXPOSE 5432
