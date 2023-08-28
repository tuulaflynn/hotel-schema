# hotel-schema-mysql
I converted existing data, shown in the three tables below, into a relational database for The Guild Hotel.
I designed a 3NF data scheme <i>[ERD_hotel_schema.drawio]</i> and created SQL scripts to 
  <ol> 
    <li>build the database <i>[hotel_DB_tables.sql]</i></li>
    <li>input the existing data <i>[hotel_data.sql]</i></li>
    <li>query the data <i>[hotel_queries.sql].</i></li> 
  </ol>
  
### Room data
![room_data](https://github.com/tuulaflynn/hotel-schema-mysql/assets/62618067/2633d635-ced8-421a-8b63-fbdab38bc9ae)
### Guest data
![guest_data](https://github.com/tuulaflynn/hotel-schema-mysql/assets/62618067/05ee4a8c-f423-4606-bc7e-af6a0837ede9)
### Reservation data
![reservation_data](https://github.com/tuulaflynn/hotel-schema-mysql/assets/62618067/3c5c0741-a015-4356-bb71-f0db44ac1372)

<ul>Comments for the data
<li>In the database, a reservation can include multiple rooms reserved by the same guest and for the same dates. There are two examples in the table above.</li>
<li>Adults are guests whose age is 18 or older.</li>
<li>Children are guests under the age of 18.</li>
<li>Start date represents the first evening the guest will stay at the hotel.</li>
<li>End date represents the day the guest plans to check out.</li>
</ul>
