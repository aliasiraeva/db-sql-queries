-- first homework
-- №1
select * from flights
where date_part('day', scheduled_departure) = 13 and date_part('hour', scheduled_departure) = 15;
-- №2
select fare_conditions, max(amount), min(amount)
from ticket_flights
group by fare_conditions;
-- №3
select fare_conditions, sum(amount)
from ticket_flights
group by fare_conditions;
-- №4
select fare_conditions, count(seat_no)from seats
group by fare_conditions;