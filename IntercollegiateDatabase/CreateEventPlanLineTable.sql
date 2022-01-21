DROP TABLE IF EXISTS EventPlanLine CASCADE;

CREATE TABLE EventPlanLine
(
    PlanNo    varchar(8) not null,
    LineNo    char(1)    not null,
    TimeStart time       not null,
    TimeEnd   time       not null,
    NumberFld char(1)    not null,
    LocNo     varchar(8) not null,
    ResNo     varchar(8) not null,
    CONSTRAINT LineNoPlanNoPK PRIMARY KEY (PlanNo, LineNo),
    CONSTRAINT PlanNoFK FOREIGN KEY (PlanNo) REFERENCES EventPlan (PlanNo),
    CONSTRAINT LocNoFK FOREIGN KEY (LocNo) REFERENCES Location (LocNo),
    CONSTRAINT ResNoFK FOREIGN KEY (ResNo) REFERENCES ResourceTbl (ResNo),
    CONSTRAINT ValidTime CHECK (TimeStart < TimeEnd)
);