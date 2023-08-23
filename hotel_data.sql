USE hotel_schema;
#SHOW TABLES;

INSERT INTO guest_address(guest_address, zip, city, state) VALUES
	("100 Downton Avenue", "03349", "London", "LB"),
    ("379 Old Shore Street", "51501", "Council Bluffs", "IA"),
	("750 Wintergreen Dr.", "99654", "Wasilla", "AK"),
	("9662 Foxrun Lane", "78552", "Harlingen", "TX"),
	("9378 W. Augusta Ave.", "08096", "West Deptford", "NJ"),
	("762 Wild Rose Street", "48601", "Saginaw", "MI"),
	("7 Poplar Dr.", "80003", "Arvada", "CO"),
	("70 Oakwood St.", "60099", "Zion", "IL"),
	("7556 Arrowhead St.", "02864", "Cumberland", "RI"),
	("77 West Surrey Street", "13126", "Oswego", "NY"),
	("939 Linda Rd.", "22015", "Burke", "VA"),
	("87 Queen St.", "19026", "Drexel Hill", "PA");
    
INSERT INTO guest(guest_address_id, first_name, last_name, guest_phone_num) VALUES 
(1, "Tuula", "Flynn", "(44) 797-0293"),
(2, "Mack", "Simmer", "(291) 553-0508" ),
(3, "Bettyann", "Seery", "(478) 277-9632" ),
(4, "Duane", "Cullison", "(308) 494-0198" ),
(5, "Karie", "Yang", "(214) 730-0298" ),
(6, "Aurore", "Lipton", "(377) 507-0974" ),
(7, "Zachery", "Luechtefeld", "(814) 485-2615" ),
(8, "Jeremiah", "Pendergrass", "(279) 491-0960" ),
(9, "Walter", "Holaway", "(446) 396-6785" ),
(10, "Wilfred", "Vise", "(834) 727-1001" ),
(11, "Maritza", "Tilton", "(446) 351-6860" ),
(12, "Joleen", "Tison", "(231) 893-2755" );


SELECT * FROM guest;

INSERT INTO reservation(guest_id, reservation_start, reservation_end) VALUES
	(2, "2/2/2023", "2/4/2023"),
    (3, "2/5/2023", "2/10/2023"),
    (4, "2/22/2023", "2/24/2023"),
    (5, "3/6/2023", "3/7/2023"),
    (1, "3/17/2023","3/20/2023"),
    (6, "3/18/2023", "3/23/2023"),
    (7, "3/29/2023", "3/31/2023"),
    (8, "3/31/2023", "4/5/2023"),
    (9, "4/9/2023", "4/13/2023"),
    (10, "4/23/2023", "4/24/2023"),
    (11, "5/30/2023", "6/2/2023"),
    (12, "6/10/2023", "6/14/2023"),
    (6, "6/17/2023", "6/18/2023"),
    (1, "6/28/2023", "7/2/2023"),
    (9, "7/13/2023", "7/14/2023"),
    (10, "7/18/2023", "7/21/2023"),
    (3, "7/28/2023", "7/29/2023"),
    (3, "8/30/2023", "9/1/2023"),
    (2, "9/16/2023", "9/17/2023"),
    (5, "9/13/2023", "9/15/2023"),
    (4, "11/22/2023", "11/25/2023"),
    (2, "11/22/2023", "11/25/2023"),
    (11,"12/24/2023", "12/28/2023");
    
SELECT * FROM RESERVATION;

INSERT INTO room VALUES	 # doesn't work as FK is not yet created
	(201, "Double"),
    (202, "Double"), 
    (203, "Double"),
    (204, "Double"),
    (205, "Single"),
    (206, "Single"), 
    (207, "Single"),
    (208, "Single"),
    (301, "Double"),
    (302, "Double"), 
    (303, "Double"),
    (304, "Double"),
    (305, "Single"),
    (306, "Single"),
    (307, "Single"),
    (308, "Single"),
    (401, "Suite"),
    (401, "Suite");
  
INSERT INTO reservation_room(room_num, reservation_id, adults, children, total_price) VALUES   # doesn't work as FK is not yet created
	(308, 1, 1, 0, 299.98),
    (203, 2, 2, 0, 999.95),
    (305, 3, 2, 0, 349.98),
    (201, 4, 2, 2, 199.99),
    (307, 5, 1, 1, 524.97),
    (302, 6, 3, 0, 924.95),
    (202, 7, 2, 2, 349.98),
    (304, 8, 2, 0, 874.95),
    (301, 9, 1, 0, 799.96),
    (207, 10, 1, 1, 174.99),
    (401, 11, 2, 4, 1199.97),
    (206, 12, 2, 0 , 599.96),
    (208, 12, 1, 0, 599.96),
    (304, 13, 3, 0, 184.99),
    (205, 14, 2, 0, 699.96),
    (204, 15, 3, 1, 184.99),
    (401, 16, 4, 2, 1259.97),
    (303, 17, 2, 1, 199.99),
    (305, 18, 1, 0, 349.98),
    (208, 19, 2, 0, 149.99),
    (203, 20, 2, 2, 399.98),
    (401, 21, 2, 2, 1199.97),
    (206, 22, 2, 0, 449.97),
    (301, 22, 2, 2, 599.97),
    (302, 23, 2, 0, 699.96);




INSERT INTO amenity(amenity_name) VALUES 
	("Microwave"),
    ("Refrigerator"),
    ("Jacuzzi"),
    ("Oven");



INSERT INTO room_data VALUES
	("Single", 2, 2, 149.99, NULL),
    ("Double", 2, 4, 174.99, 10),
    ("Suite", 3, 8, 399.99, 20);


INSERT INTO amenity_room VALUES  # doesn't work as FK is not yet created
	(1, 201), (3, 201),
    (2, 202), 
    (1, 203), (3, 203), 
    (2, 204),
    (1, 205), (2, 205), (3, 205),
    (1, 206), (2, 206), 
    (1, 207), (2, 207), (3, 207),
    (1, 208), (2, 208),
    (1, 301), (3, 301),
    (2, 302), 
    (1, 303), (3, 303), 
    (2, 304),
    (1, 305), (2, 305), (3, 305),
    (1, 306), (2, 306),
    (1, 307), (2, 307), (3, 307),
    (1, 308), (2, 308),
    (1, 401), (2, 401), (4, 401),
    (1, 401), (2, 401), (4, 401);
    

    