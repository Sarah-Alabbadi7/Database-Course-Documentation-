create database trainingcmp
use trainingcmp


create Table department
(
DName nvarchar (20) not null,
ManagerSSN int,
hiringdate date,
Dnum int primary key identity (1,1)

)
--foreign key(ManagerSSN) references Employee (SSN)


create Table Employee
(
FName nvarchar (20) not null,
LName nvarchar (20) not null,
Bdate date,
Gender bit default 0,
SSN2 Int,
Dnum Int,
SSN int primary key identity (1,1)
foreign key(SSN2) references Employee (SSN),
foreign key (Dnum) references department (Dnum),
)

ALTER TABLE department
ADD foreign key(ManagerSSN) references Employee (SSN)



create Table Locations
(
locations nvarchar (60),
Dnum Int,
primary key (Dnum, locations),
foreign key (Dnum) references department (Dnum)

)

create Table Project
(
PNumber int primary key,
PName nvarchar (20),
city nvarchar (30),
location nvarchar (60),
Dnum int,
foreign key (Dnum) references department (Dnum)

)


create Table Dependent 
(
DName nvarchar (20),
gender bit default 0,
birthday date,
SSN int,
primary key (SSN, DName),
foreign key (SSN)  references Employee(SSN)

)


create Table Work
(
SSN int,
PNumber int,
workinghour int,
primary key (SSN, PNumber),
foreign key (SSN) references Employee(SSN),
foreign key (PNumber) references project (PNumber)

)

select * from Employee
select * from department
select * from Locations
select * from Locations
select * from project 
select * from Dependent
select * from work  

insert INTO department (DName, ManagerSSN, hiringdate)
VALUES ('Engineering',null , '01-01-2022');


insert INTO Employee (FName, LName, Bdate, Gender, SSN2, Dnum)
VALUES ('SARAH', 'ALI', '2000-12-07', 0, NULL, 4)

insert INTO Locations (locations, Dnum)
VALUES ('Muscat', 4)

insert INTO Project (PNumber, PName, city, location, Dnum)
Values (201, 'FALAJ','MUSCAT', 'QURAYAT', 4) 

insert INTO Dependent (DName, gender, birthday, SSN)
Values ('RUAA', 1,'2001-10-06', 2)

insert INTO Work (SSN, PNumber, workinghour)
Values (2, 201, 60)

-- to check the error in the SSN
SELECT SSN FROM Employee;
-- if i mentioned a value in like SSN 2 it has to be same in all
