DROP TABLE IF EXISTS ResourceTbl CASCADE;

CREATE TABLE ResourceTbl
(
    ResNo   varchar(8)  not null,
    ResName varchar(30) not null,
    Rate    decimal(5, 2),
    CONSTRAINT LocNoPK PRIMARY KEY (ResNo),
    CONSTRAINT ResNameUnique UNIQUE (ResName),
    CONSTRAINT ValidRate CHECK (Rate > 0)
);