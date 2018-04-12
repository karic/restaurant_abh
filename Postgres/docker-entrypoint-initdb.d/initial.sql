CREATE DATABASE restaurant_abh;
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS  postgis_topology;
CREATE USER abh;
alter user abh with encrypted password 'password';
grant all privileges on database restaurant_abh to abh;

