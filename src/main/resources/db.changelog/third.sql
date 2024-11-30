-- third homework
insert into bookings(book_ref, book_date, total_amount)
values ('010000', now(), 400000.00),
       ('020000', now(), 100000.00);

insert into tickets(ticket_no, book_ref, passenger_id, passenger_name, contact_data)
values ('0011234567890', '010000', '1111 111111', 'SIRAEV RUSTEM', '89000000000'),
       ('0021234567890', '010000', '2222 222222', 'SIRAEVA NAILYA', '88000000000'),
       ('0031234567890', '010000', '3333 333333', 'SIRAEVA ALIYA', '87000000000'),
       ('0041234567890', '010000', '4444 444444', 'SIRAEVA KARINA', '86000000000'),
       ('0010987654321', '020000', '0000 000000', 'IVANOV IVAN', '80000000000');

insert into flights(flight_id, flight_no, scheduled_departure, scheduled_arrival, departure_airport, arrival_airport, status, aircraft_code, actual_departure, actual_arrival)
values (33122, 'PG1111', now(), now() + interval '3 hours', 'KZN', 'YKS', 'On Time', '773', null, null),
       (33123, 'PG2222', now(), now() + interval '3 hours', 'LED', 'KZN', 'On Time', '773', null, null);

insert into ticket_flights(ticket_no, flight_id, fare_conditions, amount)
values ('0011234567890', 33122, 'Economy', 150000.00),
       ('0021234567890', 33122, 'Economy', 150000.00),
       ('0031234567890', 33122, 'Economy', 150000.00),
       ('0041234567890', 33122, 'Economy', 150000.00),
       ('0010987654321', 33123, 'Business', 30000.00);