-- Assignment done using postgresql

-- 1.
-- List the city, state, and zip codes in the customer table.  Your result should not have duplicates.
-- (Hint: The DISTINCT keyword eliminates duplicates)
select distinct city, state, zip
from customer;

-- 2.
-- List the name, department, phone number, and email address of employees with a phone number beginning with “3-”
select empname, department, phone, email
from employee
where phone like '3-%';

-- 3.
-- List all columns of the resource table with a rate between $10 and $20. Sort the result by rate.
select *
from resourcetbl
where rate >= 10
  and rate <= 20
order by rate;

-- 4.
-- List the event requests with a status of “Approved” or “Denied” and an authorized date in July 2018.
-- Include the event number, authorization date, and status in the output.
-- (Hint: see the examples in Module 4 for date constants in Oracle and MySQL.)
select eventno, dateauth, status
from eventrequest
where (status = 'Approved' or status = 'Denied')
  and (dateauth >= '2018-07-01' and dateauth <= '2018-07-31');

-- 5.
-- List the location number and name of locations that are part of the “Basketball arena”.
-- Your WHERE clause should not have a condition involving the facility number compared to a constant (“F101”).
-- Instead, you should use a condition on the FacName column for the value of “Basketball arena”.
select locno, locname
from facility
         inner join location l on facility.facno = l.facno
where facname = 'Basketball arena';



-- 6.
-- For each event plan, list the plan number, count of the event plan lines, and sum of the number of resources assigned.
-- For example, plan number “P100” has 4 lines and 7 resources assigned.
-- You only need to consider event plans that have at least one line.
select planno, count(*) as line_count, sum(cast(numberfld as numeric)) as resources_assigned
from eventplanline
group by planno;
