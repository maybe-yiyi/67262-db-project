-- drop database if it exists
DROP database if EXISTS ticketmaster;

-- create it fresh
CREATE database ticketmaster;
\c ticketmaster

\i ticketmaster_create.sql
