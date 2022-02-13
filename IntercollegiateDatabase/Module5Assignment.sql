-- Select statement problems
--1.
-- For event requests, list the event number, event date (eventrequest.dateheld), and count of the event plans.
-- Only include event requests in the result if the event request has more than one related event plan with a work date
-- in December 2018.
select e.eventno, dateheld, count(planno) as plans_count
from eventplan
         inner join eventrequest e on eventplan.eventno = e.eventno
where dateheld between '2018-12-01' and '2018-12-31'
group by e.eventno
order by eventno;

-- 2.
-- List the plan number, event number, work date, and activity of event plans meeting the following two conditions:
-- (1) the work date is in December 2018 and
-- (2) the event is held in the “Basketball arena”. Your query must not use the facility number (“F101”) of the
-- basketball arena in the WHERE clause.
-- Instead, you should use a condition on the FacName column for the value of “Basketball arena”.
select planno, eventplan.eventno, workdate, activity
from eventplan
         inner join eventrequest e on eventplan.eventno = e.eventno
         inner join facility f on e.facno = f.facno
where (workdate between '2018-12-01' and '2018-12-31')
  and f.facname = 'Basketball arena';

-- 3.
-- List the event number, event date, status, and estimated cost of events where there is an event plan managed by
-- Mary Manager and the event is held in the basketball arena
-- in the period October 1 to December 31, 2018.
-- Your query must not use the facility number (“F101”) of the basketball arena or the employee number (“E101”)
-- of “Mary Manager” in the WHERE clause. Thus, the WHERE clause should not have conditions involving the facility
-- number or employee number compared to constant values.
select eventno, dateheld, status, estcost
from eventrequest
         inner join customer c on eventrequest.custno = c.custno
         inner join facility f on eventrequest.facno = f.facno
where c.contact = 'Mary Manager'
  and f.facname = 'basketball arena'
  and dateheld between '2018-10-01' and '2018-12-31';

-- 4.
-- List the plan number, line number, resource name, number of resources (eventplanline.number), location name, time
-- start, and time end
-- where the event is held at the basketball arena,
-- the event plan has activity of activity of “Operation”,
-- and the event plan has a work date in the period October 1 to December 31, 2018.
-- Your query must not use the facility number (“F101”) of the basketball arena in the WHERE clause. Instead, you should
-- use a condition on the FacName column for the value of “Basketball arena”.
select eventplanline.planno, lineno, resname, numberfld, locname, timestart, timeend
from eventplanline
         inner join resourcetbl r on r.resno = eventplanline.resno
         inner join location l on l.locno = eventplanline.locno
         inner join eventplan e on e.planno = eventplanline.planno
         inner join facility f on l.facno = f.facno
where facname = 'Basketball arena'
  and activity = 'Operation'
  and workdate between '2018-10-01-' and '2018-12-31';

-- Database modifications problem
-- 1.
-- Insert a new row into the Facility table with facility name “Swimming Pool”.
delete
from facility
where facname = 'Swimming Pool';
insert into facility(facno, facname)
values ('F104', 'Swimming Pool');
select *
from facility;

-- 2.
-- Insert a new row in the Location table related to the Facility row in modification problem 1.
-- The new row should have “Door” for the location name.
delete
from location
where locname = 'Door';
insert into location(locno, facno, locname)
values ('L107', 'F104', 'Door');
select *
from location;

-- 3.
-- Insert a new row in the Location table related to the Facility row in modification problem 1.
-- The new row should have “Locker Room” for the location name.
delete
from location
where locname = 'Locker Room';
insert into location(locno, facno, locname)
values ('L108', 'F104', 'Locker Room');
select *
from location;

-- 4.
update location
set locname = 'Gate'
where locname = 'Door';
select *
from location;

-- 5.
delete
from location
where locname = 'Locker Room';
select *
from location;

