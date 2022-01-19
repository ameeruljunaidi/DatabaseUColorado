DROP TABLE IF EXISTS Facility;

CREATE TABLE Facility
(
    FacNo   char(4)     not null,
    FacName varchar(30) not null,
    CONSTRAINT FacilityPK PRIMARY KEY (FacNo)
);