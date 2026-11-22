-- drop database if it exists
DROP database if EXISTS ticketmaster;

-- create it fresh
CREATE database ticketmaster;
\c ticketmaster

CREATE TYPE Availability_Type AS ENUM('available', 'reserved', 'unavailable');

\i ticketmaster_create.sql

\copy Venue(venue_id, name, location, max_capacity) FROM data/venues.csv csv header;
\copy Event(event_id, name, date, venue_id) FROM data/events.csv csv header;
\copy Seat(seat_id, venue_id, seat_number, row_number, section) FROM data/seats.csv csv header;
\copy Ticket(event_id, seat_id, type, cost, qr_code, availability) FROM data/tickets.csv csv header;
