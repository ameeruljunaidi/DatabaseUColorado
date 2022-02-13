-- Identifying errors
-- 1.
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest,
     employee,
     facility,
     eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno
  AND eventrequest.facno = facility.facno
  AND facname = 'Football stadium'
  AND empname = 'Mary Manager';
-- No error

-- 2.
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest,
     eventplan
WHERE estaudience > 4000
  AND eventplan.eventno = eventrequest.eventno
GROUP BY eventrequest.eventno, dateheld, status, estcost;
-- No error

-- 3.
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest,
     employee,
     facility,
     eventplan
WHERE estaudience > 5000
  AND eventplan.empno = employee.empno
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno
  AND facname = 'Football stadium';
-- No error

-- 4.
SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest,
     employee,
     eventplan
WHERE estaudience BETWEEN 5000 AND 10000
  AND eventplan.empno = employee.empno
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager';
-- Semantic error, wrong spelling on between and eventno is ambiguous


-- 5.
SELECT eventplan.planno, lineno, resname, numberfld, timestart, timeend
FROM eventrequest,
     facility,
     eventplan,
     eventplanline,
     resourcetbl
WHERE estaudience = '10000'
  AND eventplan.planno = eventplanline.planno
  AND eventrequest.facno = facility.facno
  AND facname = 'Basketball arena'
  AND eventplanline.resno = resourcetbl.resno
  AND eventrequest.eventno = eventplan.eventno;
-- Use joints rather than cross product

select eventplanline.planno, lineno, resname, numberfld, timestart, timeend
from eventplanline
         inner join resourcetbl r on r.resno = eventplanline.resno
         inner join eventplan e on e.planno = eventplanline.planno
         inner join eventrequest e2 on e.eventno = e2.eventno
         inner join facility f on e2.facno = f.facno
where estaudience = '10000'
  and facname = 'Basketball arena';
