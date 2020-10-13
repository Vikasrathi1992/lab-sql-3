-- 1.How many distinct (different) actors' last names are there?
SELECT COUNT(distinct(last_name)) FROM actor;

-- 2.In how many different languages where the films originally produced?
SELECT distinct(name) FROM language;


-- 3.How many movies were not originally filmed in English?
SELECT * FROM language;


-- 4.Get 10 the longest movies from 2006.
SELECT * FROM film WHERE release_year = 2006
ORDER BY length desc
LIMIT 10;

-- 5.How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(return_date), min(rental_date)) AS operating_in_days, min(rental_date) AS first_rental, max(return_date) AS last_return FROM rental;

-- 6.Show rental info with additional columns month and weekday. Get 20.
SELECT * , date_format(rental_date, '%M') AS 'month' , date_format(rental_date, '%D') AS 'day' FROM rental LIMIT 20;

-- select *, month(rental_date) as month_rental_date, weekday(rental_date) wd_rental_date from rental limit 20 ;


-- 7.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *,
case
	when dayofweek(return_date) =6 or dayofweek(return_date)=7 then 'weekend'
    else 'workday'
end as  'day_type'
FROM rental;


-- 8.How many rentals were in the last month of activity?

select count(rental_id) from rental where ( "2006-02-14" - INTERVAL 30 DAY) <= rental_date;