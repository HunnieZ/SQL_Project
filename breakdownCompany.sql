-- MySQL Assignment Hina Zadi

-- Database Creation
create database BreakdownCompany;
use breakdownCompany;

-- Task 1 - Table creation 
create table Member
(
MemberID varchar(10) primary key,
MemberFName varchar(20),
MemberLName varchar(20),
MemberLoc varchar(20)
);
describe member;

create table Vehicle
(
VehicleReg varchar(10) primary key,
VehicleMake varchar(10),
VehicleModel varchar(10),
MemberID varchar(10) -- FK
);

describe vehicle;

create table Engineer
(
EngineerID int primary key,
EngineerFName varchar(20),
EngineerLName varchar(20)
);
describe engineer;

create table Breakdown
(
BreakdownID int primary key,
VehicleReg varchar(10),-- FK
EngineerID int,-- FK
BreakdownDATE date,
BreakdownTIME time,
BreakdownLoc varchar(20)
);
describe breakdown;

-- add foreign keys
-- syntax ALTER TABLE ADD FOREIGN KEY (ForeignKeycolumnName)REFERENCES primaryKeyTableName (primaryKeyColumnName)
alter table vehicle add foreign key (memberID) references member(memberID);
alter table breakdown add foreign key (vehicleReg) references vehicle(vehicleReg);
alter table breakdown add foreign key (engineerID) references engineer(engineerID);
-- alter table breakdown modify column engineerId int; -- updated datatype without dropping table
-- show tables;


-- Task 2 Inserting data
-- Member table – Insert 5 records
insert into Member (MemberID, MemberFName, MemberLName, MemberLoc) values (1, 'Clark','Kent','London');
insert into Member (MemberID, MemberFName, MemberLName, MemberLoc) values (2, 'Lois','Lane','Bristol');
insert into Member (MemberID, MemberFName, MemberLName, MemberLoc) values (3, 'Lex','Luthor','London');
insert into Member (MemberID, MemberFName, MemberLName, MemberLoc) values (4, 'Martha','Kent','Canterbury');
insert into Member (MemberID, MemberFName, MemberLName, MemberLoc) values (5, 'Jonathan','Kent','Canterbury');
-- select * from member;

-- Vehicle table – Insert 8 records
insert into Vehicle (VehicleReg, VehicleMake, VehicleModel, MemberID) values ('A123456789','Mercedes','C180', 1);
insert into Vehicle (VehicleReg, VehicleMake, VehicleModel, MemberID) values ('B123456789','Toyota','Prius', 2);
insert into Vehicle (VehicleReg, VehicleMake, VehicleModel, MemberID) values ('C123456789','Ford','Fiesta', 3);
insert into Vehicle (VehicleReg, VehicleMake, VehicleModel, MemberID) values ('D123456789','BMW','118D', 4);
insert into Vehicle (VehicleReg, VehicleMake, VehicleModel, MemberID) values ('E123456789','Honda','Civic', 5);
insert into Vehicle (VehicleReg, VehicleMake, VehicleModel, MemberID) values ('F123456789','RangeRover','Evoque', 1);
insert into Vehicle (VehicleReg, VehicleMake, VehicleModel, MemberID) values ('G123456789','Kia','Ceed', 2);
insert into Vehicle (VehicleReg, VehicleMake, VehicleModel, MemberID) values ('H123456789','Jeep','Cherokee', 3);
select * from vehicle;

-- Engineer table – Insert 3 records
insert into Engineer (EngineerID, EngineerFName, EngineerLName) values (1, 'Scott','Lang');
insert into Engineer (EngineerID, EngineerFName, EngineerLName) values (2, 'Bruce','Wayne');
insert into Engineer (EngineerID, EngineerFName, EngineerLName) values (3, 'Peter','Parker');
-- select * from engineer;

-- Breakdown table – Insert 12 records
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('1','A123456789','001', '2023-11-05', '11:45', 'Slough');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('2','B123456789','002', '2023-11-05', '20:45', 'Lewisham');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('3','C123456789','003', '2023-11-15', '09:30', 'Uxbridge');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('4','A123456789','001', '2023-04-29', '13:57', 'Kent');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('5','B123456789','002', '2023-08-01', '19:25', 'Richmond');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('6','C123456789','003', '2023-07-06', '13:32', 'Colchester');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('7','D123456789','001', '2023-12-03', '21:00', 'Maldon');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('8','E123456789','002', '2023-08-03', '10:49', 'Southend');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('9','F123456789','003', '2023-04-10', '07:07', 'Chigwell');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('10','G123456789','001', '2023-12-23', '18:48', 'Birmingham');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('11','H123456789','002', '2023-03-10', '17:38', 'Hayes');
insert into Breakdown (BreakdownID, VehicleReg, EngineerID, BreakdownDATE, BreakdownTIME,BreakdownLoc) values ('12','F123456789','003', '2023-04-04', '16:14', 'Cambridge');
-- select * from breakdown;


-- Task 3 - Perfoming queries
-- 1.	The names of members who live in a location e.g. For example, London.
select * from member where memberLoc='London';

-- 2.	All cars registered with the company e.g. all Nissan cars.
select * from vehicle where vehicleMake='BMW';

-- 3.	The number of engineers that work for the company.
select count(*) as 'No of Engineers' from engineer;

-- 4.	The number of members registered.
select count(*) as 'No of Members' from member;

-- 5.	All the breakdown after a particular date
select * from breakdown where breakdownDATE > '2023-11-01';

-- 6.	All the breakdown between 2 dates
select * from breakdown where breakdownDATE between '2023-04-04' and '2023-08-01';

-- 7.	The number of time a particular vehicle has broken down
select count(*) as 'No of breakdowns' from breakdown where vehicleReg='A123456789';

-- 8.	The number of vehicles broken down more than once
select vehicleReg, count(VehicleReg) as 'No of repeat breakdowns' from breakdown group by vehicleReg having count(*)>1;


-- Task 4 - Perfoming queries continued
-- 1.	All the vehicles a member owns. For example, Matt
select memberFName, memberLName,vehicleMake from member left join vehicle on member.memberID=vehicle.memberID where memberFName='clark';

-- 2.	The number of vehicles each member has – sort the data based on the number of car from highest to lowest.
select member.memberID, memberFName, memberLName, count(vehicleReg) as 'No of Vehicles' from member left join vehicle on member.memberID = vehicle.memberID
group by member.memberID, member.memberFName, member.memberLName order by 'No of Vehicles' desc;

-- 3.	All vehicles that have broken down in a particular location along with member details.
select member.memberID, member.memberFName, member.memberLName, vehicle.vehicleReg, vehicle.vehicleMake, vehicle.vehicleModel
from member inner join vehicle on member.memberID = vehicle.memberID inner join breakdown on vehicle.vehicleReg = breakdown.vehicleReg where breakdown.breakdownLoc = 'Richmond';

-- 4.	A list of all breakdowns along with member and engineer details between two dates.
-- used abbreviations (alias) in the form of m for member, v for vehicle and e for engineer etc
select m.memberID, m.memberFName, m.memberlname, v.vehicleReg, e.engineerID, e.engineerFName, e.engineerLName, b.breakdownDATE, b.breakdownTIME, b.breakdownLoc
from breakdown b inner join vehicle v on b.vehicleReg = v.vehicleReg inner join member m on v.memberID = m.memberID inner join engineer e on b.engineerID = e.engineerID
where b.breakdownDATE between '2023-08-01' and '2023-12-31';

-- 5.	A further 3 relational queries of your choice that are meaningful to the company.
-- Top 3 most common breakdown locations
select breakdownLoc, count(*) as 'No of breakdowns' from breakdown group by breakdownLoc order by 'No of breakdowns' desc limit 3;

-- Breakdowns by Day of Week:
select dayname(breakdowndate) as dayofweek, count(*) as 'No of breakdowns' from breakdown group by dayofweek;

-- Number of breakdowns fixed by which engineer
select e.engineerID, e.engineerFName, e.engineerLName, count(b.breakdownID) as 'No of breakdowns fixed' from breakdown b
right join engineer e on e.engineerID = b.engineerID group by e.engineerID, e.engineerFName, e.engineerLName order by 
'No of breakdowns fixed' desc limit 1;


-- Task 5
-- Using W3Schools or any other resource research the following functions – Avg, Max, Min, Sum.  Explain with examples how each one is used

-- Avg()- The AVG() function returns the average value of a numeric column. (src-W3Schools)
select avg(memberID)FROM member;

-- Min()- The MIN() function returns the smallest value of the selected column. (src-W3Schools)
select min(breakdownID) from breakdown;

-- Max()- The MAX() function returns the largest value of the selected column. (src-W3Schools)
select max(breakdownID) from breakdown;

-- Sum()- The SUM() function returns the total sum of a numeric column. (src-W3Schools)
select sum(columnName) from tableName;

-- Task 6
-- 1. If a member has more than one vehicle, then display multi-car policy
select m.memberID, m.memberFName, m.memberLName, count(v.vehicleReg) as 'No of vehicles',
    case
        when count(v.vehicleReg) > 1 then 'Multi-car policy with 10% discount'
        else 'Single-car policy'
    end as policy
from member m inner join vehicle v on m.memberID = v.memberID group by m.memberID, m.memberFName, m.memberLName
having count(v.vehicleReg) > 1;

-- 2. Create a stored procedure which will display number of cars for any member whose first name and last name you are passing as argument 
-- while calling the stored procedure.

DELIMITER $$$
create procedure memberCars(in Firstname varchar(20),in Surname varchar(20))
	begin
		select m.memberID, m.memberFName, m.memberLName, count(v.vehicleReg) as 'no of cars' from member m left join 
        vehicle v on m.memberID = v.memberID where m.memberFName = Firstname and m.memberLName = Surname group by 
        m.memberID, m.memberFName, m.memberLName;
	end$$$
    
    call memberCars('Lois Lane');
