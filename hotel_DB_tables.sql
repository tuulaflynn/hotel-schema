DROP DATABASE IF EXISTS hotel_schema;

CREATE DATABASE hotel_schema;

USE hotel_schema;

CREATE TABLE guest_address (
	guest_address_id INT auto_increment,
    guest_address VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    city VARCHAR(30),
    state VARCHAR(3),
    PRIMARY KEY(guest_address_id)
);

CREATE TABLE guest (
	guest_id INT auto_increment,
    guest_address_id INT NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    guest_phone_num VARCHAR(15) NOT NULL,
    PRIMARY KEY(guest_id),
    FOREIGN KEY (guest_address_id) REFERENCES guest_address(guest_address_id)
);


CREATE TABLE reservation (
	reservation_id INT auto_increment,
    guest_id INT NOT NULL,
    reservation_start VARCHAR(10) NOT NULL,
    reservation_end VARCHAR(10) NOT NULL,
	PRIMARY KEY(reservation_id),
    FOREIGN KEY(guest_id) REFERENCES guest(guest_id)
);


CREATE TABLE reservation_room (
	room_reservation_id INT auto_increment,
    room_num INT NOT NULL,
    reservation_id INT NOT NULL,
    adults INT NOT NULL,
    children INT NOT NULL,
    total_price DOUBLE NOT NULL,
	PRIMARY KEY (room_reservation_id),
    # FOREIGN KEY (room_num) REFERENCES room(room_num), this is added after the creation of the room table.
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id)
);

CREATE TABLE room (
	room_num INT,
    room_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (room_num)
    # FOREIGN KEY (room_type) REFERENCES room_data(room_type) this is added after creating room_data table.
);

ALTER TABLE reservation_room ADD FOREIGN KEY (room_num) REFERENCES room(room_num);

CREATE TABLE room_data (
	room_type VARCHAR(20),
    room_standard_occupancy INT NOT NULL,
    room_max_occupancy INT NOT NULL,
    room_base_price DOUBLE NOT NULL,
    room_extra_pp DOUBLE,
    PRIMARY KEY (room_type)
);

ALTER TABLE room ADD FOREIGN KEY (room_type) REFERENCES room_data(room_type);

CREATE TABLE amenity (
	amenity_id INT auto_increment,
    amenity_name VARCHAR(15) NOT NULL,
    PRIMARY KEY (amenity_id)
);

CREATE TABLE amenity_room (
		amenity_id INT,
        room_num INT,
        PRIMARY KEY (amenity_id, room_num),
        FOREIGN KEY (room_num) REFERENCES room(room_num),
        FOREIGN KEY (amenity_id) REFERENCES amenity(amenity_id)
);
-- Checking tables
-- DESC guest_address;
-- DESC guest;
-- DESC reservation;
-- DESC reservation_room;
-- DESC room;
-- DESC room_data;
-- DESC amenity_room;
-- DESC amenity;



