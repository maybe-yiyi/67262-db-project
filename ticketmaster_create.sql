-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-11-19 19:55:32.23

-- tables
-- Table: Event
CREATE TABLE Event (
    event_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    date timestamp  NOT NULL,
    venue_id int  NOT NULL,
    CONSTRAINT Event_pk PRIMARY KEY (event_id)
);

-- Table: Seat
CREATE TABLE Seat (
    seat_id int  NOT NULL,
    venue_id int  NOT NULL,
    seat_number int,
    row_number int,
    section char(1)  NOT NULL,
    CONSTRAINT Seat_pk PRIMARY KEY (seat_id)
);

-- Table: Ticket
CREATE TABLE Ticket (
    event_id int  NOT NULL,
    seat_id int  NOT NULL,
    type varchar(255)  NOT NULL,
    cost decimal(8,2)  NOT NULL,
    qr_code bytea  NOT NULL,
    availability Availability_Type  NOT NULL,
    CONSTRAINT Ticket_pk PRIMARY KEY (event_id,seat_id)
);

-- Table: Venue
CREATE TABLE Venue (
    venue_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    location varchar(255)  NOT NULL,
    max_capacity int  NOT NULL,
    CONSTRAINT Venue_pk PRIMARY KEY (venue_id)
);

-- foreign keys
-- Reference: Event_Venue (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Venue
    FOREIGN KEY (venue_id)
    REFERENCES Venue (venue_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Seat_Venue (table: Seat)
ALTER TABLE Seat ADD CONSTRAINT Seat_Venue
    FOREIGN KEY (venue_id)
    REFERENCES Venue (venue_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Ticket_Event (table: Ticket)
ALTER TABLE Ticket ADD CONSTRAINT Ticket_Event
    FOREIGN KEY (event_id)
    REFERENCES Event (event_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Ticket_Seat (table: Ticket)
ALTER TABLE Ticket ADD CONSTRAINT Ticket_Seat
    FOREIGN KEY (seat_id)
    REFERENCES Seat (seat_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

