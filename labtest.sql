create database pizza;
use pizza;

create table Pizza(pid int, pname varchar(20), quality int, Qualityrating varchar(20), primary key(pid));
create table Store(SID int, sname varchar(20), phone varchar(10), address varchar(35), primary key(SID));
create table Soldby(pid int, SID int, price float, primary key(pid, SID), foreign key(pid) references Pizza(pid) on delete cascade, foreign key(SID) references Store(SID) on delete cascade);

insert into Pizza values(100, "veggie", 4, "very good");
insert into Pizza values(101, "veggie", 5, "excellent");
insert into Pizza values(102, "cheese", 3, "good");
insert into Pizza values(103, "vegcheese", 4, "very good");
insert into Pizza values(104, "cheese", 4, "very good");
insert into Pizza values(105, "vegcheese", 5, "excellent");

select * from Pizza;

insert into Store values(200, "Franks", 6303104939, "2nd Block Jayanagar");
insert into Store values(201, "Dumont", 6303104939, "1st Block JP nagar");
insert into Store values(202, "Pizza Hut", 6303104939, "8th Cross Banshankari");
insert into Store values(203, "Dominoes", 6303104939, "2nd Cross Banshankari");
insert into Store values(204, "Olive Garden", 6303104939, "3rd cross whitefield");



insert into Soldby values(100, 200, 50);
insert into Soldby values(102, 200, 65);
insert into Soldby values(103, 200, 75);
insert into Soldby values(101, 200, 65);
insert into Soldby values(104, 201, 70);
insert into Soldby values(105, 201, 70);
insert into Soldby values(100, 202, 55);
insert into Soldby values(102, 202, 50);
insert into Soldby values(101, 203, 45);
insert into Soldby values(104, 203, 50);
insert into Soldby values(100, 204, 80);
insert into Soldby values(103, 204, 85);



-- 3
select distinct s.sname from Pizza p, Store s, Soldby sb where sb.pid = p.pid and sb.SID = s.SID and p.pname in ("veggie","cheese");
-- 6
select SID, avg(price) from Soldby b group by b.SID having avg(b.price) > (select avg(price) from Soldby);
-- 5
update Pizza inner join Soldby on Pizza.pid=Soldby.pid set price=price*1.1 where Pizza.pname="vegcheese";
-- 7
create view Pizza_view3 as select Soldby.pid, pname, sum(price) as Totalprice, avg(price) as Avgrprice from Soldby, Pizza group by Soldby.pid, pname;
select * from Pizza_view3;
-- 4
select distinct s.sname, p.Qualityrating from Pizza p, Store s, Soldby sb where sb.pid = p.pid and sb.SID = s.SID and (p.Qualityrating like "good" or p.Qualityrating like "excellent") and sb.price < 100

