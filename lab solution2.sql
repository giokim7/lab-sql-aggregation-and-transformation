#Challenge 1:

#1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration:

SELECT MIN(length) AS min_duration, MAX(length) AS max_duration
FROM film;

#1.2 Express the average movie duration in hours and minutes:

SELECT CONCAT(FLOOR(AVG(length) / 60), ' hours ', ROUND(AVG(length) % 60), ' minutes') AS average_duration
FROM film;

#2.1 Calculate the number of days that the company has been operating:

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days
FROM rental;

#2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results:

SELECT rental_id, rental_date, MONTH(rental_date) AS rental_month, WEEKDAY(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

#2.3 Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week:

SELECT rental_id, rental_date, 
       CASE WHEN WEEKDAY(rental_date) IN (5, 6) THEN 'weekend'
            ELSE 'workday' END AS day_type
FROM rental;

#Retrieve the film titles and their rental duration, replacing any NULL values with the string 'Not Available'. Sort the results by the film title in ascending order:

SELECT title, COALESCE(length, 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;

#Retrieve the concatenated first and last names of customers, along with the first 3 characters of their email address. Order the results by last name in ascending order:

SELECT CONCAT(first_name, ' ', last_name) AS full_name, SUBSTRING(email, 1, 3) AS email_prefix
FROM customer
ORDER BY last_name ASC;

#Challenge 2:

#1.1 The total number of films that have been released:

SELECT COUNT(*) AS total_films
FROM film;

#1.2 The number of films for each rating:

SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;

#1.3 The number of films for each rating, sorted in descending order of the number of films:

SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC;

# Determine the number of rentals processed by each employee:

SELECT staff_id, COUNT(*) AS rental_count
FROM rental
GROUP BY staff_id;

#3.1 The mean film duration for each rating, sorted in descending order of the mean duration:

SELECT rating, ROUND(AVG(length), 2) AS average_duration
FROM film
GROUP BY rating
ORDER BY average_duration DESC;

#3.2 Identify which ratings have a mean duration of over two hours:

SELECT rating
FROM film
GROUP BY rating
HAVING AVG(length) > 120;

#Determine which last names are not repeated in the actor table:

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;