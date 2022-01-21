DROP TABLE IF EXISTS EventPlan CASCADE;

CREATE TABLE EventPlan
(
    PlanNo   varchar(8)  not null,
    EventNo  varchar(8)  not null,
    WorkDate date        not null,
    Notes    varchar(50),
    Activity varchar(30) not null,
    EmpNo    varchar(8),
    CONSTRAINT PlanNoPK PRIMARY KEY (PlanNo),
    CONSTRAINT EvenNoFK FOREIGN KEY (EventNo) REFERENCES EventRequest (EventNo),
    CONSTRAINT EmpNoFK FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)
);