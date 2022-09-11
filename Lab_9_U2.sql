use sakila;
select * from rental;

-- In this lab we will find the customers who were active in consecutive months of May and June. 
-- Follow the steps to complete the analysis.

-- 1. Create a table rentals_may to store the data from rental table with information for the month of May.
create table rentals_may like rental;
select * from rentals_may;

-- 2. Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
select extract(month from rental_date) from rental where extract(month from rental_date) = 5; -- inspecting the amount of entries for may (1156)

insert into rentals_may 
select * from rental
where rental_date between "2005-05-01 00:00:00" and "2005-05-31 23:59:59";

select * from rentals_may;

-- 3. Create a table rentals_june to store the data from rental table with information for the month of June.
create table rentals_june like rental;
select * from rentals_june;

-- 4. Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
select extract(month from rental_date) from rental where extract(month from rental_date) = 6; -- inspecting the amount of entries for june (2311)

insert into rentals_june 
select * from rental
where rental_date between "2005-06-01 00:00:00" and "2005-06-30 23:59:59";

select * from rentals_june;

-- 5. Check the number of rentals for each customer for May.

select customer_id, count(rental_id) as 'rentals_per_customer'
from rentals_may
group by customer_id;

-- 6. Check the number of rentals for each customer for June.

select customer_id, count(rental_id) as 'rentals_per_customer'
from rentals_june
group by customer_id;

-- Next steps are written in the jupyter notebook