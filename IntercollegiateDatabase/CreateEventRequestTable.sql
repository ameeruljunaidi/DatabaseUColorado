DROP TABLE IF EXISTS EventRequest CASCADE;

CREATE TABLE EventRequest
(
    EventNo     varchar(8)  not null,
    DateHeld    date        not null,
    DateReq     date        not null,
    FacNo       varchar(8)  not null,
    CustNo      varchar(8)  not null,
    DateAuth    date,
    Status      varchar(10) not null,
    EstCost     decimal(10) not null,
    EstAudience integer     not null,
    BudNo       varchar(8),
    CONSTRAINT EventNoPK PRIMARY KEY (EventNo),
    CONSTRAINT CustNoFK FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
    CONSTRAINT FacNoFK FOREIGN KEY (FacNo) REFERENCES Facility (FacNo),
    CONSTRAINT ValidStatus CHECK (Status IN ('Pending', 'Denied', 'Approved')),
    CONSTRAINT ValidEstAudience CHECK (EstAudience > 0)
);