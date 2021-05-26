create database Insurance;
use Insurance;

create table person(driverID varchar(10), name varchar(20), address varchar(15), primary key(driverID));
create table car(RegNo varchar(10), Model varchar(20), Year date, primary key(RegNo));
create table accident(report_no int, adate date, location varchar(15), primary key(report_no));
create table owns(driverID varchar(10), RegNo varchar(10), primary key(driverID, RegNo),
foreign key(driverID) references person(driverID), foreign key(RegNo) references car(RegNo));
create table participated(driverID varchar(10),  RegNo varchar(10), report_no int, damage_amt int,
foreign key(driverID, RegNo) references owns(driverID, RegNo) on delete cascade,
foreign key(report_no) references accident(report_no) on delete cascade);

show tables;

insert into person values('1111', 'Raju', '1-4-8,Jayanagar');
insert into person values('2222', 'Rahul', '5-2-7,JP Nagar');
insert into person values('3333', 'Ram', '32,Basavangudi');
insert into person values('4444', 'Vamsi', '420,Whitefield');
insert into person values('5555', 'Raghav', '69,Indiranagar');

select * from person;

insert into car values('1234', 'Jeep Cherokee', '2002-12-2');
insert into car values('2345', 'Tata Safari', '2005-10-1');
insert into car values('3456', 'Jaguar XF', '2006-3-2');
insert into car values('4567', 'Tata Safari', '2011-8-3');
insert into car values('5678', 'Acura LSX', '2001-8-3');

select * from car;

insert into accident values(12, '2002-12-23', 'Bangalore');
insert into accident values(13, '2006-11-2', 'Hyderabad');
insert into accident values(14, '2010-8-2', 'Bangalore');
insert into accident values(15, '2015-6-7', 'Hyderabad');
insert into accident values(16, '2008-3-1', 'Chennai');

select * from accident;

insert into owns values('1111', '1234');
insert into owns values('2222', '2345');
insert into owns values('3333', '3456');
insert into owns values('4444', '4567');
insert into owns values('5555', '5678');

select * from owns;

commit;

insert into participated values('1111', '1234', 12, 30000);
insert into participated values('2222', '2345', 13, 10000);
insert into participated values('3333', '3456', 14, 100000);
insert into participated values('4444', '4567', 15, 5000);
insert into participated values('5555', '5678', 16, 150000);

select * from participated;

/* Question 1 where damage amount is updated when given report number*/
update participated set damage_amt=25000 where report_no=12; 

/* Question 2 return count of accidents that occured in 2008*/
select count(report_no) from accident where YEAR(adate) = 2008;

/* Question 3 return the count of models that were in an accident given the model*/
select count(Model) from car where Model='Tata Safari';



