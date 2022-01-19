DROP TABLE IF EXISTS Location;

CREATE TABLE Location
(
    LocNo   char(4)     not null,
    FacNo   char(4)     not null,
    LocName varchar(30) not null,
    CONSTRAINT LocationPK PRIMARY KEY (LocNo),
    CONSTRAINT FacilityFK FOREIGN KEY (FacNo) REFERENCES Facility
);