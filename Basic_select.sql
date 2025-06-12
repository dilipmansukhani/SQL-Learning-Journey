select database();
use sakila;
select database();
show databases;
show tables;
select * from actor;

select actor_id, first_name from actor;

describe actor; 

select actor_id*10,first_name, actor_id from actor;

select * from actor where actor_id=35;

SELECT * from actor where first_name='ED';

select * from actor where actor_id>50 and actor_id<150;

-- BETWEEEN=>
select * from actor where actor_id between 55 and 155;
select * from actor where actor_id in(5,74,22,55);
select * from actor where actor_id in(3,5,7);
select * from actor where actor_id between 3 and 7;

-- LIKE==> 
select * from actor where actor_id not between 3 and 100;
select * from actor where FIRST_NAME like '_E%R';
select * from actor where FIRST_NAME like '%NN%';