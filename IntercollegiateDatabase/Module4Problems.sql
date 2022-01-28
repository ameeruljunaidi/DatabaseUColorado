-- 1.
-- List the customer number, the name, the phone number, and the city of customers
select custno, custname, phone, city
from customer;

-- 2.
-- List the customer number, the name, the phone number, and the city of customers who reside in Colorado
select custno, custname, phone, city
from customer
where state = 'CO';

-- 3.
-- List all the columns of the EventRequest table for events costing more than $4,000
-- Order the result by the event date (DateHeld)
select eventno,
       dateheld,
       datereq,
       facno,
       custno,
       dateauth,
       status,
       estcost,
       estaudience,
       budno
from eventrequest
where estcost < 4000
order by dateheld;

-- 4.
-- List the event number, the event date (DateHeld), and the estimated audience number with approved status
-- audience greater than 9,000 or with pending status and audience greater than 7,000
select eventno, dateheld, status, estaudience
from eventrequest
where (status = 'Approved' and estaudience > 9000)
   or (status = 'Pending' and estaudience > 7000);

-- 5.
-- List the event number, event date, customer number and customer name of events placed in January 2018
-- by customers from Boulder
select eventrequest.eventno, eventrequest.dateheld, customer.custno, customer.custname
from eventrequest
         inner join customer on eventrequest.custno = customer.custno
where eventrequest.dateheld between '2018-12-01' and '2018-12-31'
  and customer.city = 'Boulder';

-- 6.
-- List the average number of resources used (NumberFld) by plan number
-- Include only location number L100
select planno, avg(cast(numberfld as numeric)) as avg_number_fld
from eventplanline
where locno = 'L100'
group by planno;

-- 7.
-- List the average number of resources used (NumberFld) by plan number
-- Only include location number L100
-- Eliminate plans with less than two event lines containing location number L100
select planno, avg(cast(numberfld as numeric)) as avg_number_fld, count(*) as num_event_lines
from eventplanline
where locno = 'L100'
group by planno
having count(*) > 1;

