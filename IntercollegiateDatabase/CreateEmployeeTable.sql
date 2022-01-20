DROP TABLE IF EXISTS Employee CASCADE;

CREATE TABLE Employee
(
    EmpNo        varchar(8)  not null,
    EmpFirstName varchar(30) not null,
    EmpLastName  varchar(30) not null,
    EmpPhone     varchar(11) not null,
    EmpEmail     varchar(30) not null,
    CONSTRAINT EmpNoPK PRIMARY KEY (EmpNo)
);