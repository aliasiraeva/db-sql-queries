-- fifth homework
-- №1.1
delete from ticket_flights
where flight_id in (33122, 33123);
-- №1.2
delete from flights
where flight_id in (33122, 33123);
-- №1.3
delete from tickets
where ticket_no in ('0011234567890', '0021234567890', '0031234567890', '0041234567890')
or ticket_no like '0010987654321';
-- №1.4
delete from bookings where book_ref in ('010000', '020000');
-- №2.1
update tickets t set passenger_name = concat_ws(', ', passenger_name, a.aircraft_code, b.seat_no)
from flights f inner join aircrafts_data a on f.aircraft_code = a.aircraft_code
               inner join boarding_passes b on f.flight_id = b.flight_id
where t.ticket_no = b.ticket_no and f.scheduled_departure = (select max(scheduled_departure) from flights);
-- №3.1
update ticket_flights tf set amount = tf.amount * 0.85
from (select tf.ticket_no, tf.fare_conditions, max(scheduled_departure)
      from ticket_flights tf inner join flights f on tf.flight_id = f.flight_id
                              inner join tickets t on tf.ticket_no = t.ticket_no
      where passenger_id like '%777%'
      group by tf.ticket_no, tf.fare_conditions) cte
where tf.ticket_no = cte.ticket_no and cte.fare_conditions = 'Economy';
