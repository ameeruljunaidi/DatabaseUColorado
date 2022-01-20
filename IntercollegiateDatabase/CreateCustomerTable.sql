DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer
(
    CustNo   varchar(8)  not null,
    CustName varchar(30) not null,
    Address  varchar(50) not null,
    Internal char(1)     not null,
    Contact  varchar(35) not null,
    Phone    varchar(11) not null,
    City     varchar(30) not null,
    State    varchar(2)  not null,
    Zip      varchar(10) not null,
    CONSTRAINT CustomerPK PRIMARY KEY (CustNo)
);