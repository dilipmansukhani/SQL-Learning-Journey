-- Question

-- Q1 Get the payment_id , customer_id,amount from the payment table where the amnt spend by the customer > the avg amount 
-- spend by the customer
 
 use sakila;
 select payment_id, customer_id , amount from payment p
 where amount > ( select avg (amount) from payment where customer_id= p.customer_id);