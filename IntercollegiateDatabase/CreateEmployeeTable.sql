DROP TABLE IF EXISTS Employee CASCADE;

CREATE TABLE Employee
(
    EmpNo      varchar(8)  not null,
    EmpName    varchar(30) not null,
    Department varchar(30) not null,
    Email      varchar(30) not null,
    Phone      varchar(30) not null,
    CONSTRAINT EmpNoPK PRIMARY KEY (EmpNo),
    CONSTRAINT EmpEmailUnique UNIQUE (Email)
);