create table items(itemid int primary key, itemname varchar(50), category varchar(50), price int, instock int check(instock>=0));
drop table items;
create table items_exp9_csa_15(itemid int primary key, itemname varchar(50), category varchar(50), price int, instock int check(instock>=0));
create table customers_exp9_csa_15(custid int primary key,custname varchar(50),address varchar(50),state varchar(50));
create table orders_exp9_csa_15(orderid int primary key, itemid int, custid int, quantity int,orderdate date, foreign key(itemid) references items_exp9_csa_15, foreign key(custid) references customers_exp9_csa_15);
create table delivery_exp9_csa_15(deliveryid int primary key, custid int, orderid int, foreign key(custid) references customers_exp9_csa_15, foreign key(orderid) references orders_exp9_csa_15);

insert into items_exp9_csa_15 values(1001,'Samsung GalaxyS4','Gadgets',25000,10);
insert into items_exp9_csa_15 values(1002,'Boat Earbuds','Gadgets',4000,40);
insert into items_exp9_csa_15 values(1003,'Whirlpool AC','Home Appliances',18000,50);
insert into items_exp9_csa_15 values(1004,'Alchemist','Books',400,100);
insert into items_exp9_csa_15 values(1005,'Lehenga Set','Dresses',3500,80);

insert into customers_exp9_csa_15 values(1010,'Aswathy R','Kottayam','Kerala');
insert into customers_exp9_csa_15 values(1011,'Janet James','Chennai','TamilNadu');
insert into customers_exp9_csa_15 values(1012,'Rose Mathew','Kochi','Kerala');
insert into customers_exp9_csa_15 values(1013,'Meenakshy M','Trichy','TamilNadu');
insert into customers_exp9_csa_15 values(1014,'Mickey D','Mumbai','Maharashtra');
insert into customers_exp9_csa_15 values(1015,'John Jacob','Bangalore','Karnataka');
delete from customers_exp9_csa_15 where custid=1015;
insert into orders_exp9_csa_15 values(1020,1001,1014,1,'16-02-2011');
insert into orders_exp9_csa_15 values(1021,1003,1011,1,'24-04-2012');
insert into orders_exp9_csa_15 values(1022,1004,1014,1,'03-08-2011');
insert into orders_exp9_csa_15 values(1023,1002,1015,1,'12-06-2015');
insert into orders_exp9_csa_15 values(1024,1005,1013,1,'28-10-2014');

insert into delivery_exp9_csa_15 values(1030,1014,1020);
insert into delivery_exp9_csa_15 values(1031,1014,1022);
insert into delivery_exp9_csa_15 values(1032,1011,1021);
insert into delivery_exp9_csa_15 values(1033,1013,1024);

select c.custid,custname,address,state from customers_exp9_csa_15 c join orders_exp9_csa_15 o on c.custid=o.custid;
select c.custid,custname,address,state from customers_exp9_csa_15 c join delivery_exp9_csa_15 d on c.custid=d.custid;

select custname,orderdate from orders_exp9_csa_15 o join customers_exp9_csa_15 c on o.custid=c.custid where custname like 'J%';

commit;