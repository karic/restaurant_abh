FROM postgres:9.5
RUN apt-get update && apt-get install -y postgis postgresql-9.5-postgis-2.2
COPY docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/
