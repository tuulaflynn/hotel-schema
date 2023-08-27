# Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT guest.first_name, guest.last_name,
	reservation.reservation_start, reservation.reservation_end,
    reservation_room.room_num
	FROM guest 
    INNER JOIN reservation ON guest.guest_id = reservation.guest_id 
    INNER JOIN reservation_room ON reservation.reservation_id = reservation_room.reservation_id
	WHERE MONTH(reservation.reservation_end) = 7;
    # This only works for strings -> WHERE LEFT(reservation.reservation_end, 7) = "2023/7/"; 
/*
# first_name	last_name	reservation_start	reservation_end	room_num
Tuula	Flynn	2023-06-28	2023-07-02	205
Bettyann	Seery	2023-07-28	2023-07-29	303
Walter	Holaway	2023-07-13	2023-07-14	204
Wilfred	Vise	2023-07-18	2023-07-21	401
*/


# Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT guest.first_name, guest.last_name, 
	reservation.reservation_start, reservation.reservation_end,
	reservation_room.room_num
	FROM amenity_room
	INNER JOIN reservation_room ON amenity_room.amenity_id = 3 AND amenity_room.room_num = reservation_room.room_num
    INNER JOIN reservation ON reservation_room.reservation_id = reservation.reservation_id
    INNER JOIN guest ON reservation.guest_id = guest.guest_id;
/*
# first_name	last_name	reservation_start	reservation_end	room_num
Karie	Yang	2023-03-06	2023-03-07	201
Bettyann	Seery	2023-02-05	2023-02-10	203
Karie	Yang	2023-09-13	2023-09-15	203
Tuula	Flynn	2023-06-28	2023-07-02	205
Wilfred	Vise	2023-04-23	2023-04-24	207
Walter	Holaway	2023-04-09	2023-04-13	301
Mack	Simmer	2023-11-22	2023-11-25	301
Bettyann	Seery	2023-07-28	2023-07-29	303
Duane	Cullison	2023-02-22	2023-02-24	305
Bettyann	Seery	2023-08-30	2023-09-01	305
Tuula	Flynn	2023-03-17	2023-03-20	307
*/


# Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, 
# and how many people were included in the reservation. (Choose a guest's name from the existing data.)
SELECT guest.first_name, guest.last_name,
	reservation.reservation_start, reservation.reservation_end,
    reservation_room.room_num,
    (reservation_room.adults + reservation_room.children) AS people_in_reservation
    FROM guest
    INNER JOIN reservation ON guest.guest_id = reservation.guest_id
    INNER JOIN reservation_room ON reservation_room.reservation_id = reservation.reservation_id
	WHERE guest.first_name = "Mack" AND guest.last_name = "Simmer";
 /*
# first_name	last_name	reservation_start	reservation_end	room_num	people_in_reservation
Mack	Simmer	2023-02-02	2023-02-04	308	1
Mack	Simmer	2023-09-16	2023-09-17	208	2
Mack	Simmer	2023-11-22	2023-11-25	206	2
Mack	Simmer	2023-11-22	2023-11-25	301	4
*/


# Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation.
# The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT room.room_num,
	reservation_room.room_reservation_id, reservation_room.total_price
    FROM room
    LEFT JOIN reservation_room ON room.room_num = reservation_room.room_num;
/*    
# room_num	room_reservation_id	total_price
201	4	199.99
202	7	349.98
203	2	999.95
203	21	399.98
204	16	184.99
301	9	799.96
301	24	599.97
302	6	924.95
302	25	699.96
303	18	199.99
304	14	184.99
205	15	699.96
206	12	599.96
206	23	449.97
207	10	174.99
208	13	599.96
208	20	149.99
305	3	349.98
305	19	349.98
306		
307	5	524.97
308	1	299.98
401	11	1199.97
401	17	1259.97
401	22	1199.97
402		
*/


# Write a query that returns all rooms with a capacity of three or more and that are reserved on any date in April 2023.
SELECT room_data.room_type, room_data.room_max_occupancy, 
	room.room_num,
    reservation.reservation_start, reservation.reservation_end
	FROM room_data
    INNER JOIN room ON room_data.room_type = room.room_type
    INNER JOIN reservation_room ON reservation_room.room_num = room.room_num
    INNER JOIN reservation ON reservation_room.reservation_id = reservation.reservation_id
    WHERE (room_data.room_max_occupancy >= 3) 
    AND YEAR(reservation.reservation_start) = 2023 AND YEAR(reservation.reservation_end) = 2023
	# A room start date is either booked in april or is not booked in april:
		# if the start date is in april the room is reserved in april,
		# if the start date is not in april, but the end date is in april, the room is reserved in april.
    AND (MONTH(reservation.reservation_start) = 4 OR MONTH(reservation.reservation_end) = 4);
/*
# room_type	room_max_occupancy	room_num	reservation_start	reservation_end
Double	4	301	2023-04-09	2023-04-13
*/    
    
    
# Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT guest.first_name, guest.last_name,
	count(reservation.guest_id) AS reservations
	FROM guest
    INNER JOIN reservation ON guest.guest_id = reservation.guest_id
    GROUP BY reservation.guest_id		# This takes all the entries in the guest_id column which are the same and groups them together. The count, then counts how many items ther are in each of these groups.
	ORDER BY reservations DESC, guest.last_name;
/*
# first_name	last_name	reservations
Bettyann	Seery	3
Mack	Simmer	3
Duane	Cullison	2
Tuula	Flynn	2
Walter	Holaway	2
Aurore	Lipton	2
Maritza	Tilton	2
Wilfred	Vise	2
Karie	Yang	2
Zachery	Luechtefeld	1
Joleen	Tison	1
*/


# Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
SELECT guest.first_name, guest.last_name, guest.guest_phone_num,
	guest_address.guest_address
	FROM guest
    INNER JOIN guest_address ON guest.guest_address_id = guest_address.guest_address_id
    WHERE guest.guest_phone_num = "(291) 553-0508";
    

/*
SELECT * FROM guest_address;
SELECT * FROM guest;  
SELECT * FROM reservation;     
SELECT * FROM reservation_room;
SELECT * FROM room;
SELECT * FROM room_data;
SELECT * FROM amenity_room;
SELECT * FROM amenity;
*/