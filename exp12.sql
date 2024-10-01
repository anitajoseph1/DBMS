create table bank_exp12(bankcode varchar(3) primary key, bankname varchar(50) not null, headoffice varchar(50), branches int check(branches>0));
insert into bank_exp12 values('AB', 'Axis Bank',  'Mumbai', 250);
insert into bank_exp12 values('HDB', 'HDFC Bank',  'Hyderabad', 300);
insert into bank_exp12 values('UB', 'Union Bank',  'Banglore', 100);
insert into bank_exp12 values('CB', 'Canara Bank',  'Chennai', 150);
insert into bank_exp12 values('SBT', 'State Bank of Travancore',  'Ernakulam', 200);
select * from  bank_exp12;

create table Branch_exp12(BranchId varchar(3) primary key, BranchName varchar(50) default 'New Delhi', BankId varchar(50), foreign key(BankId) references Bank_exp12(BankCode) on delete cascade);

insert into branch_exp12 values('B1', default, 'HDB');
insert into branch_exp12 values('B2', 'Kottayam', 'CB');
insert into branch_exp12 values('B3', default, 'SBT');
insert into branch_exp12 values('B4', 'Kottayam', 'UB');
insert into branch_exp12 values('B5', default, 'AB');

select * from  branch_exp12;
delete from bank_exp12 where bankcode = 'SBT';

alter table branch_exp12 drop primary key;
desc branch_exp12;

create view bank_headoffice as select * from bank_exp12 where headoffice = 'Ernakulam';
select  * from bank_headoffice;

update bank_exp12 set headoffice = 'Ernakulam' where bankcode in ('AB', 'UB', 'CB');

create view bank_branch as select * from branch_exp12 where branchname = 'Kottayam';
select  * from bank_branch;
