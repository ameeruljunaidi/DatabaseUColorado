DROP TABLE IF EXISTS Facility CASCADE;

CREATE TABLE Facility
(
    FacNo   varchar(8)  not null,
    FacName varchar(30) not null,
    CONSTRAINT FacilityPK PRIMARY KEY (FacNo),
    CONSTRAINT UniqueFacName UNIQUE (FacName)
);