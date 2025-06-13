use sakila ;
 select * from actor;
 select  *  from film_actor;
 
 select * from film;
 
 -- combine film actor anf film id or film_table to find out the acot_id and the movie_name ,done by each actor
 select fa.actor_id, fa.film_id , f.film_id , f.title from film_actor as fa join film as f on fa.film_id = f.film_id; 

 -- find out the actor id the movie name only for those movie which has a length than 100
 SELECT fa.actor_id, f.title
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
WHERE f.length < 100;

 
 
  -- get the actor id and  the number of movies he has done in his career
  
  select actor_id , movie_id  from actor ;
    select actor_id, COUNT(film_id) as movie_count from film_actor group by actor_id;

-- 

 select film_id , title ,rating  from  film where rating = 'nc-17' 
 order by  film_id desc;
 