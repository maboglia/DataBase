# 30 query SQL per esercitarti con il database **Chinook**.  

---

## **10 Query con JOIN**  
Il database Chinook ha tabelle come `customers`, `invoices`, `invoice_items`, `tracks`, `albums`, `artists`, `employees`, ecc.

1. **Trova il nome del cliente e il nome del dipendente che ha gestito il loro ordine**  
   ```sql
   SELECT c.FirstName, c.LastName, e.FirstName AS EmployeeName, e.LastName AS EmployeeLastName
   FROM customers c
   JOIN employees e ON c.SupportRepId = e.EmployeeId;
   ```
   
2. **Mostra il nome del cliente e i dettagli della sua ultima fattura**  
   ```sql
   SELECT c.FirstName, c.LastName, i.InvoiceDate, i.Total
   FROM customers c
   JOIN invoices i ON c.CustomerId = i.CustomerId
   ORDER BY i.InvoiceDate DESC;
   ```

3. **Lista di brani con il loro artista e album**  
   ```sql
   SELECT t.Name AS Track, ar.Name AS Artist, al.Title AS Album
   FROM tracks t
   JOIN albums al ON t.AlbumId = al.AlbumId
   JOIN artists ar ON al.ArtistId = ar.ArtistId;
   ```

4. **Mostra il nome dei clienti e i brani acquistati**  
   ```sql
   SELECT c.FirstName, c.LastName, t.Name AS Track
   FROM customers c
   JOIN invoices i ON c.CustomerId = i.CustomerId
   JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
   JOIN tracks t ON ii.TrackId = t.TrackId;
   ```

5. **Elenca tutti gli album con il numero di tracce in ciascuno**  
   ```sql
   SELECT al.Title, COUNT(t.TrackId) AS NumTracks
   FROM albums al
   JOIN tracks t ON al.AlbumId = t.AlbumId
   GROUP BY al.Title;
   ```

6. **Trova il totale speso da ogni cliente**  
   ```sql
   SELECT c.FirstName, c.LastName, SUM(i.Total) AS TotalSpent
   FROM customers c
   JOIN invoices i ON c.CustomerId = i.CustomerId
   GROUP BY c.CustomerId;
   ```

7. **Mostra gli impiegati e i loro supervisori**  
   ```sql
   SELECT e.FirstName AS Employee, e.LastName, m.FirstName AS Supervisor
   FROM employees e
   LEFT JOIN employees m ON e.ReportsTo = m.EmployeeId;
   ```

8. **Trova le tracce vendute con il nome del genere**  
   ```sql
   SELECT t.Name AS Track, g.Name AS Genre
   FROM invoice_items ii
   JOIN tracks t ON ii.TrackId = t.TrackId
   JOIN genres g ON t.GenreId = g.GenreId;
   ```

9. **Elenca gli artisti che hanno più di un album**  
   ```sql
   SELECT ar.Name, COUNT(al.AlbumId) AS NumAlbums
   FROM artists ar
   JOIN albums al ON ar.ArtistId = al.ArtistId
   GROUP BY ar.ArtistId
   HAVING COUNT(al.AlbumId) > 1;
   ```

10. **Trova i clienti con più di una fattura**  
   ```sql
   SELECT c.FirstName, c.LastName, COUNT(i.InvoiceId) AS NumInvoices
   FROM customers c
   JOIN invoices i ON c.CustomerId = i.CustomerId
   GROUP BY c.CustomerId
   HAVING COUNT(i.InvoiceId) > 1;
   ```

---

## **10 Query con Subquery**  

11. **Trova il brano più costoso venduto**  
   ```sql
   SELECT * FROM tracks
   WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM tracks);
   ```

12. **Trova i clienti che hanno speso più della media**  
   ```sql
   SELECT FirstName, LastName
   FROM customers
   WHERE CustomerId IN (
       SELECT CustomerId FROM invoices
       GROUP BY CustomerId
       HAVING SUM(Total) > (SELECT AVG(Total) FROM invoices)
   );
   ```

13. **Trova il totale venduto per ogni genere**  
   ```sql
   SELECT g.Name, 
       (SELECT SUM(ii.UnitPrice * ii.Quantity) 
        FROM invoice_items ii 
        JOIN tracks t ON ii.TrackId = t.TrackId
        WHERE t.GenreId = g.GenreId) AS TotalSales
   FROM genres g;
   ```

14. **Trova il nome degli artisti che hanno album**  
   ```sql
   SELECT Name FROM artists
   WHERE ArtistId IN (SELECT ArtistId FROM albums);
   ```

15. **Trova gli artisti senza album**  
   ```sql
   SELECT Name FROM artists
   WHERE ArtistId NOT IN (SELECT ArtistId FROM albums);
   ```

16. **Trova i clienti che hanno fatto almeno una fattura sopra i 10€**  
   ```sql
   SELECT FirstName, LastName FROM customers
   WHERE CustomerId IN (SELECT CustomerId FROM invoices WHERE Total > 10);
   ```

17. **Trova la durata media delle tracce per album**  
   ```sql
   SELECT Title, (SELECT AVG(Milliseconds) FROM tracks WHERE AlbumId = al.AlbumId) AS AvgDuration
   FROM albums al;
   ```

18. **Trova gli impiegati che hanno dipendenti sotto di loro**  
   ```sql
   SELECT FirstName, LastName FROM employees
   WHERE EmployeeId IN (SELECT DISTINCT ReportsTo FROM employees WHERE ReportsTo IS NOT NULL);
   ```

19. **Trova il numero di fatture per ogni cliente e ordinalo per numero decrescente**  
   ```sql
   SELECT FirstName, LastName, 
      (SELECT COUNT(*) FROM invoices WHERE customers.CustomerId = invoices.CustomerId) AS NumInvoices
   FROM customers
   ORDER BY NumInvoices DESC;
   ```

20. **Trova gli artisti che hanno più di un album (con subquery invece di JOIN)**  
   ```sql
   SELECT Name FROM artists
   WHERE ArtistId IN (
       SELECT ArtistId FROM albums GROUP BY ArtistId HAVING COUNT(*) > 1
   );
   ```

---

## **10 Query con Filtraggio Avanzato**  

21. **Trova le tracce con una durata superiore alla media**  
   ```sql
   SELECT Name, Milliseconds FROM tracks
   WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM tracks);
   ```

22. **Trova le fatture superiori a 20€**  
   ```sql
   SELECT * FROM invoices WHERE Total > 20;
   ```

23. **Trova i clienti in Brasile**  
   ```sql
   SELECT * FROM customers WHERE Country = 'Brazil';
   ```

24. **Trova i 5 album con il maggior numero di tracce**  
   ```sql
   SELECT al.Title, COUNT(t.TrackId) AS NumTracks
   FROM albums al
   JOIN tracks t ON al.AlbumId = t.AlbumId
   GROUP BY al.AlbumId
   ORDER BY NumTracks DESC
   LIMIT 5;
   ```

25. **Trova le tracce con il prezzo più alto**  
   ```sql
   SELECT * FROM tracks WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM tracks);
   ```

26. **Trova gli artisti il cui nome inizia con 'A'**  
   ```sql
   SELECT * FROM artists WHERE Name LIKE 'A%';
   ```

27. **Trova le tracce vendute più di 3 volte**  
   ```sql
   SELECT t.Name, COUNT(ii.TrackId) AS Sold
   FROM invoice_items ii
   JOIN tracks t ON ii.TrackId = t.TrackId
   GROUP BY ii.TrackId
   HAVING Sold > 3;
   ```

28. **Trova i clienti con email che terminano in '.com'**  
   ```sql
   SELECT * FROM customers WHERE Email LIKE '%.com';
   ```

29. **Trova i clienti che hanno fatto almeno 5 acquisti**  
   ```sql
   SELECT FirstName, LastName FROM customers
   WHERE CustomerId IN (SELECT CustomerId FROM invoices GROUP BY CustomerId HAVING COUNT(*) >= 5);
   ```

30. **Trova gli artisti più popolari in base alle vendite**  
   ```sql
   SELECT ar.Name, SUM(ii.UnitPrice * ii.Quantity) AS Revenue
   FROM invoice_items ii
   JOIN tracks t ON ii.TrackId = t.TrackId
   JOIN albums al ON t.AlbumId = al.AlbumId
   JOIN artists ar ON al.ArtistId = ar.ArtistId
   GROUP BY ar.ArtistId
   ORDER BY Revenue DESC;
   ```