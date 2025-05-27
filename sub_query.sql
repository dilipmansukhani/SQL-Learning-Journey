-- sub Query.......
-- case 1 
use sakila;
select * from payment; 
select * from payment where payment_id=6;
select * from payment where amount = 4.99;
-- by sub query
select * from payment
	where amount =(select amount from payment where payment_id=6);
-- ------------------------------------------------------------------------
-- Q. get all columns from the actor  whose actor_id > the actor_id of the person
-- whose first_name ='ED' and last_name ='chase'.
use sakila;
select * from actor;
-- inner query
select actor_id from actor where first_name ='ED' and last_name = 'chase'; 

select * from actor
where actor_id>( select actor_id from actor where first_name ='ED' and last_name = 'chase');
 
 -- ------------------------------------------------------
-- Q. get all the payment detail for those payment 
-- where the month = the payment month of payment-id 5

 select * from payment;
 -- inner query
select month (payment_date) from payment where payment_id=5 ;
    
select * from payment
where month (payment_date) = (select month (payment_date) from payment where payment_id=5);

-- ---------------------------------------------------------------
-- Q. Get the customer_id , payment_id and the amount for the payment 
-- where the rental_id < renta_id of payment_id 7 and amount < 5.

select * from payment;
-- inner query 
select * from payment where payment_id = 7 and amount < 5;

 select * from payment 
 where rental_id < (select rental_id from payment where payment_id = 7 and amount < 5);
 
 -- ------------------------------------------------------------------------
-- get the amount and the total  number of payment done 
-- where the total no. of paymwnt >  total no. of payment done by amount 5.99. 

select * from payment; 
-- inner query 
select count(payment_id) from payment where amount =5.99;
  
select * from payment 
where count(payment_id) > (select count(payment_id) from payment where amount =5.99);
  
  
  
-- Single Row Sub Query( jojo upper krte aye )

-- Multi Row Sub Query -- we can not apply any operator ( =, <,> <=, etc )
 select * from payment;
 -- inner query 
 select amount from payment where payment_id in (3,1);
 
 -- by sub query 
 
 -- IN OPERATOR 
 
 select * from payment 
 where amount in (select amount from payment where payment_id in (3,1));
-- ----------------------------------------- 
 -- =any 
  select * from payment 
 where amount =any (select amount from payment where payment_id in (3,1));
 
 -- ---------------------------------------------------
--  >any -- grater than any   ( 2.99 , 5.99)
-- grater then any smaller value of your sub query ( 2.99 se badi value hogi sari value milegi)
select * from payment 
where amount >any (select amount from payment where payment_id in (3,1));

-- ------------------------------------------------------
--  <any -- less than any   ( 2.99 , 5.99)
-- less then  grater value of your sub query ( 5.99 se choti  value  sari value milgi)
select * from payment 
where amount <any (select amount from payment where payment_id in (3,1));

-- ------------------------------------------------
-- GRATERTAN ALL --  >all


 --  >all -- grater than all  ( 2.99 , 5.99)
-- grater then all maximum value of your sub query ( 5.99se badi value  sari value hogi)

select * from payment 
 where amount >all (select amount from payment where payment_id in (3,1));

 -- --------------------------------------------------
-- LESSTHAN ALL --  <all


 --  <all -- less than all  ( 2.99 , 5.99)
-- grater then all maximum value of your sub query ( 2.99 se sari value hogi)

select * from payment 
 where amount <all (select amount from payment where payment_id in (3,1));
 
 
 





