-- second homework
-- №1
select * from bookings
order by  total_amount, book_date desc;
-- №2
select * from bookings
order by  total_amount, book_date desc
limit 256;
-- №3
select * from
    (select * from flights
     order by scheduled_departure
     limit 1) as "f"
union all
(select * from flights
 order by scheduled_departure desc
 limit 1);
-- №4
select passenger_name, concat_ws('.', left(split_part(passenger_name, ' ', 1), 1), left(split_part(passenger_name, ' ', 2), 1), '')
from tickets
limit 100;
-- №5
select passenger_id, cast(replace(passenger_id, passenger_id, concat(split_part(passenger_id, ' ', 1), split_part(passenger_id, ' ', 2))) as bigint) as new_passenger_id
from tickets
limit 100;
-- №6
select flight_id, scheduled_departure, date_part('year', scheduled_departure) as year, date_part('month', scheduled_departure) as month,
       date_part('day', scheduled_departure) as day, date_part('hour', scheduled_departure) as hour, date_part('minute', scheduled_departure) as minute
from flights
order by flight_id desc
limit 100;
-- №7.1
select flight_id, coalesce(actual_departure, scheduled_departure) as planned_departure, coalesce(actual_arrival, scheduled_arrival) as planned_arrival
from (select * from flights
      order by flight_id
      offset 50 limit 100) as cte
where actual_departure is null;
-- №7.2
with cte as (select * from flights
             order by flight_id
             offset 50 limit 100)
select flight_id, coalesce(actual_departure, scheduled_departure) as planned_departure, coalesce(actual_arrival, scheduled_arrival)
from cte
where actual_departure is null;
-- №8&9
select ticket_no, amount, round(amount * 0.95, 2) as new_amount, round(amount * 0.05, 2) as discount_amount
from ticket_flights
order by flight_id desc
offset 50 limit 100;
-- №10
select ticket_no, amount, round(amount * 1.2, 2) as amount_with_tax, round(amount * 0.2, 2) as tax_amount
from ticket_flights
order by flight_id desc
offset 50 limit 100;

