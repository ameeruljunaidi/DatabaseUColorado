DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer
(
    CustNo   char(4)     not null,
    CustName varchar(30) not null,
    Address  varchar(30) not null,
    Internal boolean     not null,
    Contact  varchar(30) not null,
    Phone    char(7)     not null,
    City     varchar(30) not null,
    State    char(2)     not null,
    Zip      char(10)    not null,
    CONSTRAINT CustomerPK PRIMARY KEY (CustNo)
);