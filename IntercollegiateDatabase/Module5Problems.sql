-- 1.
-- List the event number, date held, customer number, customer name, facility number, and facility name of 2018 events
-- placed by Boulder customers.
select eventno, dateheld, eventrequest.custno, custname, eventrequest.facno, facname

from eventrequest
         inner join customer c on eventrequest.custno = c.custno
         inner join facility f on eventrequest.facno = f.facno
where (dateheld between '2018-01-01' and '2018-12-31')
  and city = 'Boulder';


-- 2.
-- List the customer number, customer name, event number, date held, facility number, facility name, and estimated
-- audience cost per person (EstCost / EstAudience) for events held on 2018, in which the estimated cost per person is
-- less than $0.2
select customer.custno, custname, eventno, dateheld, f.facno, facname, estcost / estaudience as estcostperpax
from customer
         inner join eventrequest e on customer.custno = e.custno
         inner join facility f on e.facno = f.facno
where (dateheld between '2018-01-01' and '2018-12-31')
  and estcost / estaudience < 0.2;

-- 3.
-- List the customer number, customer name, and total estimated costs for Approved events. The total amount of events
-- is the sum of the estimated cost for each event. Group the results by customer number and customer name.
select customer.custno, custname, sum(estcost) as totalestcost
from customer
         full outer join eventrequest e on customer.custno = e.custno
where e.status = 'Approved'
group by customer.custno, custname
order by customer.custno;

-- 4.
-- Insert yourself as a new row in the Customer table.
insert into customer(custno, custname, address, internal, contact, phone, city, state, zip)
values ('C106', 'Formula 1', 'Bletchley Park', 'Y', 'Lewis Hamilton', '14234823', 'London', 'UK', '34243');


-- 5.
-- Increase the rate by 10 percent of resource names equal to nurse. In MySQL, you need to place the UPDATE statement
-- between two SET statements.
-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE statement
update resourcetbl
set rate = rate * 2
where resname = 'nurse';


-- 6.
-- SET SQL_SAFE_UPDATES = 1;

-- 7.
-- Delete the new row added to the Customer table.
delete
from customer
where custname = 'Formula 1';

select *
from customer;