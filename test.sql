use sakila;
select * from payment;
select * from (
 select payment_id, customer_id, amount, rank() over( partition by customer_id order by amount desc) as rank1,
 dense_rank() over( partition by customer_id order by amount desc) as drank1 from sakila.payment ) as tab where drank1=3;
-- data query?
-- how to insert  and update
use sakila;
create table xyz(id int, fname varchar(20));
insert into xyz values(10,"aman");
insert into xyz values(11);
insert into xyz (id)  values(11);
insert into xyz(fname) values("hey");
select * from xyz;
-- update
update xyz set fname="regex"; 

-- all rows are update
update xyz  set fname="regex " where id=10;
delete from xyz where id=11;
select * from xyz;
-- dml=> insert ,update , delete
-- drop
drop table xyz;  -- ddl
