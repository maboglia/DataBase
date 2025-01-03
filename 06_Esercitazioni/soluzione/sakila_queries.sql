# **Utilizzo del database Sakila**

-- Parte 1
-- 1a. Mostra i nomi e i cognomi di tutti gli attori dalla tabella actor.
SELECT first_name, last_name 
FROM actor; 

-- 1b. Mostra nome e cognome di ciascun attore in un'unica colonna, tutto in maiuscolo. Nomina la colonna "Actor Name".
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS 'Actor Name' 
FROM actor; 

-- Parte 2
-- 2a. Trova ID, nome e cognome di un attore di cui conosci solo il nome "Joe".
SELECT actor_id, first_name, last_name 
FROM actor 
WHERE first_name = 'Joe';

-- 2b. Trova tutti gli attori i cui cognomi contengono le lettere GEN.
SELECT actor_id, first_name, last_name 
FROM actor
WHERE last_name LIKE '%GEN%';

-- 2c. Trova tutti gli attori i cui cognomi contengono le lettere LI. Ordina per cognome e poi per nome.
SELECT actor_id, first_name, last_name 
FROM actor
WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

-- 2d. Utilizzando IN, mostra gli ID e i nomi dei seguenti paesi: Afghanistan, Bangladesh e Cina.
SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- Parte 3
-- 3a. Aggiungi una colonna "description" nella tabella actor con tipo di dato BLOB.
ALTER TABLE actor
ADD COLUMN description BLOB AFTER last_update;

-- 3b. Elimina la colonna "description" dalla tabella actor.
ALTER TABLE actor
DROP COLUMN description;

-- Parte 4
-- 4a. Elenca i cognomi degli attori e il numero di attori con ciascun cognome.
SELECT last_name, COUNT(*) AS 'Last Name Count'   
FROM actor
GROUP BY last_name;

-- 4b. Elenca i cognomi degli attori con il numero di attori per ciascun cognome, mostrando solo quelli con almeno 2 attori.
SELECT last_name, COUNT(*) AS 'Last Name Count'   
FROM actor  
GROUP BY last_name
HAVING COUNT(*) >= 2; 

-- 4c. Correggi un errore: cambia "GROUCHO WILLIAMS" in "HARPO WILLIAMS".
UPDATE actor 
SET first_name = 'HARPO' 
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';

-- 4d. Reverti la modifica precedente: cambia "HARPO" in "GROUCHO".
UPDATE actor 
SET first_name = 'GROUCHO' 
WHERE first_name = 'HARPO' AND last_name = 'WILLIAMS';

-- Parte 5
-- 5a. Recupera lo schema della tabella address.
SHOW CREATE TABLE address; 

-- Parte 6
-- 6a. Usa un JOIN per mostrare nome, cognome e indirizzo di ogni membro dello staff.
SELECT first_name, last_name, address    
FROM staff INNER JOIN address
ON staff.address_id = address.address_id;

-- 6b. Mostra il totale incassato da ciascun membro dello staff ad agosto 2005.
SELECT first_name, last_name, SUM(amount) AS 'Total Amount'
FROM staff INNER JOIN payment
ON staff.staff_id = payment.staff_id AND payment_date LIKE '2005-08%'
GROUP BY first_name, last_name;

-- 6c. Elenca ciascun film e il numero di attori associati. Usa INNER JOIN.
SELECT title, COUNT(actor_id) AS 'Actor Count'
FROM film_actor INNER JOIN film
ON film_actor.film_id = film.film_id
GROUP BY title;

-- 6d. Quante copie del film "Hunchback Impossible" esistono nell'inventario?
SELECT title, COUNT(title) AS 'Copies Available'
FROM film INNER JOIN inventory
ON film.film_id = inventory.film_id
WHERE title = 'Hunchback Impossible';

-- 6e. Mostra il totale pagato da ciascun cliente, ordinato alfabeticamente per cognome.
SELECT first_name, last_name, SUM(amount) AS 'Total Paid by Each Customer'
FROM payment INNER JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY first_name, last_name
ORDER BY last_name;

-- Parte 7
-- 7a. Mostra i titoli dei film che iniziano con "K" o "Q" e sono in lingua inglese.
SELECT title
FROM film
WHERE title LIKE 'K%' OR title LIKE 'Q%' 
AND title IN (
    SELECT title
    FROM film
    WHERE language_id IN (
        SELECT language_id 
        FROM language
        WHERE name = 'English'
    )
);

-- 7b. Mostra gli attori che appaiono nel film "Alone Trip".
SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_id IN (
        SELECT film_id
        FROM film
        WHERE title = 'Alone Trip'
    )
);

-- 7c. Mostra nome, cognome ed email dei clienti canadesi.
SELECT first_name, last_name, email 
FROM customer 
JOIN address ON (customer.address_id = address.address_id)
JOIN city ON (city.city_id = address.city_id)
JOIN country ON (country.country_id = city.country_id)
WHERE country.country = 'Canada';

-- 7d. Identifica tutti i film categorizzati come "Family".
SELECT title 
FROM film 
WHERE film_id IN (
    SELECT film_id 
    FROM film_category 
    WHERE category_id IN (
        SELECT category_id 
        FROM category 
        WHERE name = 'Family'
    )
);

-- 7e. Mostra i film più noleggiati in ordine decrescente.
SELECT title, COUNT(rental_id) AS 'Rental Count'
FROM rental 
JOIN inventory ON (rental.inventory_id = inventory.inventory_id)
JOIN film ON (inventory.film_id = film.film_id)
GROUP BY film.title
ORDER BY COUNT(rental_id) DESC;

-- 7f. Mostra quanto ha incassato ogni negozio.
SELECT store.store_id, SUM(amount)
FROM store
INNER JOIN staff ON store.store_id = staff.store_id
INNER JOIN payment ON payment.staff_id = staff.staff_id
GROUP BY store.store_id;

-- 7g. Mostra ID, città e paese di ciascun negozio.
SELECT store_id, city, country
FROM store 
INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON city.city_id = address.city_id
INNER JOIN country ON country.country_id = city.country_id;

-- 7h. Elenca i 5 generi con maggiori ricavi in ordine decrescente.
SELECT name, SUM(amount)
FROM category 
INNER JOIN film_category ON category.category_id = film_category.category_id
INNER JOIN inventory ON film_category.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY name
ORDER BY SUM(amount) DESC LIMIT 5;

-- Parte 8
-- 8a. Crea una vista per mostrare i 5 generi con maggiori ricavi.
CREATE VIEW top_revenues_by_genre AS
SELECT name, SUM(amount)
FROM category 
INNER JOIN film_category ON category.category_id = film_category.category_id
INNER JOIN inventory ON film_category.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY name
ORDER BY SUM(amount) DESC LIMIT 5;

-- 8b. Mostra il contenuto della vista creata in 8a.
SELECT * FROM top_revenues_by_genre;

-- 8c. Elimina la vista creata.
DROP VIEW top_revenues_by_genre;