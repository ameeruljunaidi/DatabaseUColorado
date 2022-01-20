DROP TABLE IF EXISTS OrderTable;

-- Contains basic facts about customer orders
-- CustNo & EmpNo are foreign keys

CREATE TABLE OrderTable
(
    OrdNo   varchar(8),
    OrdDate date       not null,
    CustNo  varchar(8) not null,
    EmpNo   varchar(8) not null,
    CONSTRAINT OrdNoPK PRIMARY KEY (OrdNo),
    CONSTRAINT CustNoFK FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
    CONSTRAINT EmpNoFK FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)
);
