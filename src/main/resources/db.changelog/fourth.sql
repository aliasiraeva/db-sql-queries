-- fourth homework
-- №1
select aircraft_code, max(scheduled_departure) as last_flight
from flights
group by aircraft_code;
-- №2
select a.model, (select max(scheduled_departure) from flights) as flight_date,
       (select t.passenger_name
        from tickets t inner join ticket_flights tf on t.ticket_no = tf.ticket_no
                       inner join flights f on tf.flight_id = f.flight_id
        where f.scheduled_departure = (select max(scheduled_departure) from flights)
        order by t.passenger_name limit 5) as people,
       f.status, t.passenger_name, b.book_date, s.seat_no
from flights f inner join ticket_flights tf on f.flight_id = tf.flight_id
               inner join tickets t on tf.ticket_no = t.ticket_no
               inner join bookings b on t.book_ref = b.book_ref
               inner join aircrafts_data a on f.aircraft_code = a.aircraft_code
               inner join seats s on a.aircraft_code = s.aircraft_code
group by a.model, f.status, t.passenger_name, b.book_date, s.seat_no;
