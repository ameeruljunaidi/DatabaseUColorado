DROP TABLE IF EXISTS Location;

CREATE TABLE Location
(
    LocNo   varchar(8)  not null,
    FacNo   varchar(8)  not null,
    LocName varchar(30) not null,
    CONSTRAINT LocationPK PRIMARY KEY (LocNo),
    CONSTRAINT FacilityFK FOREIGN KEY (FacNo) REFERENCES Facility (FacNo)
);