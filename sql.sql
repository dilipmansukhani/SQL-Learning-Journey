show databases;
use sakila;
show tables;
select first_name from actor where actor_id=3 or actor_id=5 or actor_id=7;
-- select first_name from actor where actor_id<=7 and actor_id>=3;
-- select first_name,actor_id from actor where actor_id<=3 or actor_id>100;

-- select first_name,actor_id from actor where first_name like "_e%r";

-- select first_name,actor_id from actor where first_name like "%nn%";


-- select first_name,actor_id,last_name from actor where first_name like "%s__" and last_name like "%s__" ;

-- select first_name,actor_id from actor where first_name like "_____";

-- select first_name,actor_id from actor where first_name like "_a%t%h__";


-- finctions

-- scaler funciton      1 row ==>apply==>result for each row

select first_name,lower(first_name),upper(lower(first_name)),length(first_name) from actor;
# substr(col,index,total_character)
select first_name,substr(first_name,3,3) from actor;
select first_name,substr(first_name,-3,3) from actor;
# insrt
select first_name,instr(first_name,'i') from actor ;
select first_name,last_name, concat(first_name,'-',last_name) as fullName from actor;
select first_name,last_name, concat_ws('-',first_name,last_name) as fullName from actor;

-- trim ==> white splace trim
select first_name ,trim('     hi     ') as hi from actor;

# lpad(), rpad()
select first_name ,rpad(first_name,6,'$') as lpad from actor;
-- multirow funcitons

-- code reusable
-- string functions

-- function related number and date
select now(),sysdate(),current_timestamp(),curdate(),current_time() from dual;
select now(),adddate(now(),2) from dual;
select now(),adddate(now(),interval 2 month) from dual;-- 
select now(),adddate(now(),interval 2 week) from dual;
select now(),adddate(now(),interval 2 year) from dual;
select now(),datediff(now(),'2025-06-16 17:17:09');
select now(),datediff(now(),last_day(now()));
 
select last_day(now()) from dual;
select month(now()),year(now()) from dual;
select extract(year from now()) from dual;
select extract(minute from '2025-06-16 17:17:09') from dual;
select now(),date_format(now(),'this is a %Y');
select now(),date_format(now(),'this is a %M');
select now(),date_format(now(),'this is a %m');


-- numbers
-- round and truncate(),pow,floor,ceil

select  24.345,round(24.345) from dual;

select  24.645,round(24.645) from dual;
select  24.645,round(24.645,1) from dual;
select  24.675,round(24.675,1) from dual;
select round(24.32,-1) from dual;
select round(26.32,-1) from dual;
select round(24.32,-2) from dual;
select round(64.32,-2) from dual;
select round(364.37,1), truncate(364.37,1) from dual;
select round(364.37,-2), truncate(364.37,-2) from dual;
select mod(11,2),pow(2,3),floor(10.99),ceil(19.001) from dual;

-- genral functions

# if (condition,true,false)

select first_name,actor_id, 
if(first_name='Nick','yes',if(first_name='ED','yess','no')) from sakila.actor;




-- agar actor id ==even first name and last name concat if odd hai then concat with $ sign

select first_name,last_name, if(actor_id%2=0,concat(first_name," ",last_name),concat(first_name," ",last_name,"$")) from sakila.actor;
select actor_id,first_name,last_name,
case
	when actor_id%2=0 then "yes"
    when actor_id=5 then "###yes###"
    else "no"
    end
    from sakila.actor;
    
    select * from sakila.actor order by first_name, actor_id desc;
	select actor_id,actor_id*10 as a from sakila.actor order by first_name, actor_id desc;
    
    -- multi row function apply multiple row and give single result
   -- sum(),count(),max(),average,min()-- 
   -- agregate function which are calucate help to over certain value  and return a single value 
   -- not select normal column with agrigate funciton
   select distinct(customer_id) from sakila.payment;
    select count(customer_id) as total , count(distinct(customer_id)) as unique_customer,count(customer_id)-count(distinct(customer_id)) as repeat_customer from sakila.payment;
    
    select count(amount),sum(amount),min(amount),avg(amount),max(amount) from sakila.payment;
    
    -- group by 
    -- create a group of similar value 
    --
    select sum(amount) from sakila.payment where customer_id=1;
    
    select sum(amount) from sakila.payment where customer_id=1;
    
    select sum(amount) from sakila.payment where customer_id=1;
    
    
    select customer_id,count(amount),sum(amount),max(amount),min(amount),avg(amount) from sakila.payment group by customer_id;
    
    -- if we are using group by than tthat column use only with select not another column we are use
    
    -- amount 
    
    select amount,count(amount) from sakila.payment group by amount order by amount;
    -- get the total count of rented id total amount of spent and maximum rented value for each staff
    -- find out the total payment rented the sum of the amount and the max rental id
    select staff_id,count(rental_id),max(amount),sum(amount) from sakila.payment group by staff_id; 
    
    -- get the total no of customer serve which a maximun and minimum renatal id with the avg amount spended for each month of payment date
    select payment_date,date_format(payment_date,'%m') as month,  count(customer_id) ,max(rental_id),min(rental_id),avg(amount) from sakila.payment 
    group by date_format(payment_date,'%m')
    
    
    
    





