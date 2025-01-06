### **Padroneggiare SQL: Database Sakila**

---

### **Database Sakila**

Il database Sakila è un modello normalizzato di un negozio di noleggio DVD. Include entità come film, attori e relazioni tra film e attori, oltre a una tabella centrale di inventario che collega film, negozi e noleggi.

---

### **Esempi di query con Sakila**

#### **Domanda 5: Attore più impegnato**

Trova l’attore che ha partecipato al maggior numero di film.  

```sql
SELECT CONCAT(first_name, " ", last_name) AS Full_name
FROM ACTOR
LEFT JOIN FILM_ACTOR USING(ACTOR_ID)
GROUP BY Full_name
ORDER BY COUNT(film_id) DESC
LIMIT 1;
```

---

#### **Domanda 6: Terzo attore più impegnato**

Trova l’attore che ha partecipato al terzo maggior numero di film.  

```sql
SELECT CONCAT(first_name, " ", last_name) AS Full_name
FROM ACTOR
LEFT JOIN FILM_ACTOR USING(ACTOR_ID)
GROUP BY Full_name
ORDER BY COUNT(film_id) DESC
LIMIT 2, 1;
```

---

#### **Domanda 7: Film con il maggior incasso**

Trova il film che ha generato il massimo incasso.  

```sql
SELECT Title
FROM FILM
INNER JOIN inventory USING(FILM_ID)
INNER JOIN RENTAL USING(INVENTORY_ID)
INNER JOIN PAYMENT USING(RENTAL_ID)
GROUP BY Title
ORDER BY SUM(AMOUNT) DESC
LIMIT 1;
```

---

#### **Domanda 8: Città con il massimo incasso**

Trova la città che ha generato il massimo incasso.  

```sql
SELECT City
FROM CITY
INNER JOIN address USING(CITY_ID)
INNER JOIN CUSTOMER USING(ADDRESS_ID)
INNER JOIN PAYMENT USING(CUSTOMER_ID)
GROUP BY City
ORDER BY SUM(AMOUNT) DESC
LIMIT 1;
```

---

#### **Domanda 9: Analisi delle categorie**

Trova quante volte è stata noleggiata ogni categoria di film, ordinando per numero di noleggi.

```sql
SELECT Name, COUNT(Name) AS Rental_count
FROM category
INNER JOIN film_category USING(CATEGORY_ID)
INNER JOIN FILM USING(FILM_ID)
INNER JOIN inventory USING (film_id)
INNER JOIN rental USING (inventory_id)
GROUP BY Name
ORDER BY Rental_count DESC;
```

---

#### **Domanda 10: Appassionati di fantascienza**

Trova i clienti che hanno noleggiato film di fantascienza più di due volte.  

```sql
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS Customer_name
FROM category
INNER JOIN film_category USING(CATEGORY_ID)
INNER JOIN FILM USING(FILM_ID)
INNER JOIN inventory USING (film_id)
INNER JOIN RENTAL USING(INVENTORY_ID)
INNER JOIN CUSTOMER USING(CUSTOMER_ID)
WHERE Name = "sci-fi"
GROUP BY Customer_name
HAVING COUNT(RENTAL_ID) > 2
ORDER BY Customer_name;
```

---

#### **Conclusione**

SQL è una competenza fondamentale per chi lavora con i database. Queste domande offrono esempi pratici, dal livello base a quello avanzato, utilizzando il database Sakila. La pratica costante è essenziale per padroneggiare SQL.
