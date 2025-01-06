
### **1-5: Selezioni base**

1. **Trova tutti gli album nella tabella `Album`.**
   ```sql
   SELECT * FROM Album;
   ```

2. **Trova il nome degli artisti nella tabella `Artist`.**
   ```sql
   SELECT Name FROM Artist;
   ```

3. **Trova i dettagli dei clienti che vivono negli Stati Uniti.**
   ```sql
   SELECT * FROM Customer WHERE Country = 'United States';
   ```

4. **Trova i dipendenti con il titolo "Sales Manager".**
   ```sql
   SELECT * FROM Employee WHERE Title = 'Sales Manager';
   ```

5. **Trova i generi musicali elencati nella tabella `Genre`.**
   ```sql
   SELECT * FROM Genre;
   ```

---

### **6-10: Filtri e ordinamenti**

6. **Trova i clienti la cui città inizia con "San".**
   ```sql
   SELECT * FROM Customer WHERE City LIKE 'San%';
   ```

7. **Trova i brani con una durata superiore a 5 minuti (300000 millisecondi).**
   ```sql
   SELECT * FROM Track WHERE Milliseconds > 300000;
   ```

8. **Ordina gli artisti in ordine alfabetico.**
   ```sql
   SELECT * FROM Artist ORDER BY Name ASC;
   ```

9. **Trova gli album associati all'artista con `ArtistId` 5.**
   ```sql
   SELECT * FROM Album WHERE ArtistId = 5;
   ```

10. **Trova le fatture con un totale superiore a $50, ordinate per data.**
    ```sql
    SELECT * FROM Invoice WHERE Total > 50 ORDER BY InvoiceDate;
    ```

---

### **11-15: Funzioni aggregate**

11. **Conta il numero totale di clienti.**
    ```sql
    SELECT COUNT(*) AS TotalCustomers FROM Customer;
    ```

12. **Calcola il totale delle vendite registrate nella tabella `Invoice`.**
    ```sql
    SELECT SUM(Total) AS TotalSales FROM Invoice;
    ```

13. **Trova il prezzo massimo tra i brani nella tabella `Track`.**
    ```sql
    SELECT MAX(UnitPrice) AS MaxPrice FROM Track;
    ```

14. **Trova il numero di dipendenti per ogni città.**
    ```sql
    SELECT City, COUNT(*) AS EmployeeCount FROM Employee GROUP BY City;
    ```

15. **Trova il prezzo medio per unità dei brani.**
    ```sql
    SELECT AVG(UnitPrice) AS AvgPrice FROM Track;
    ```

---

### **16-20: Join semplici**

16. **Trova i dettagli degli album e degli artisti associati.**
    ```sql
    SELECT Album.Title, Artist.Name 
    FROM Album 
    JOIN Artist ON Album.ArtistId = Artist.ArtistId;
    ```

17. **Trova i brani e i loro generi.**
    ```sql
    SELECT Track.Name, Genre.Name AS Genre 
    FROM Track 
    JOIN Genre ON Track.GenreId = Genre.GenreId;
    ```

18. **Trova i dettagli delle fatture e dei clienti.**
    ```sql
    SELECT Invoice.InvoiceId, Customer.FirstName, Customer.LastName, Invoice.Total 
    FROM Invoice 
    JOIN Customer ON Invoice.CustomerId = Customer.CustomerId;
    ```

19. **Trova le playlist e i brani associati.**
    ```sql
    SELECT Playlist.Name AS PlaylistName, Track.Name AS TrackName 
    FROM Playlist 
    JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId 
    JOIN Track ON PlaylistTrack.TrackId = Track.TrackId;
    ```

20. **Trova i brani con il rispettivo tipo di supporto.**
    ```sql
    SELECT Track.Name AS TrackName, MediaType.Name AS MediaType 
    FROM Track 
    JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId;
    ```

---

### **21-25: Filtri avanzati e subquery**

21. **Trova i brani più lunghi (durata superiore alla media).**
    ```sql
    SELECT * 
    FROM Track 
    WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM Track);
    ```

22. **Trova i dipendenti che non riportano a nessuno.**
    ```sql
    SELECT * FROM Employee WHERE ReportsTo IS NULL;
    ```

23. **Trova i clienti che non hanno effettuato fatture.**
    ```sql
    SELECT * FROM Customer 
    WHERE CustomerId NOT IN (SELECT CustomerId FROM Invoice);
    ```

24. **Trova le città che hanno più di 2 dipendenti.**
    ```sql
    SELECT City, COUNT(*) AS EmployeeCount 
    FROM Employee 
    GROUP BY City 
    HAVING COUNT(*) > 2;
    ```

25. **Trova i brani appartenenti a generi diversi da "Rock".**
    ```sql
    SELECT Track.Name 
    FROM Track 
    JOIN Genre ON Track.GenreId = Genre.GenreId 
    WHERE Genre.Name != 'Rock';
    ```

---

### **26-30: Query avanzate**

26. **Trova i dettagli delle fatture e dei dipendenti di supporto associati.**
    ```sql
    SELECT Invoice.InvoiceId, Employee.FirstName, Employee.LastName 
    FROM Invoice 
    JOIN Customer ON Invoice.CustomerId = Customer.CustomerId 
    JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId;
    ```

27. **Trova i brani presenti in più di una playlist.**
    ```sql
    SELECT TrackId, COUNT(*) AS PlaylistCount 
    FROM PlaylistTrack 
    GROUP BY TrackId 
    HAVING COUNT(*) > 1;
    ```

28. **Conta il numero di album per artista.**
    ```sql
    SELECT Artist.Name, COUNT(Album.AlbumId) AS AlbumCount 
    FROM Artist 
    JOIN Album ON Artist.ArtistId = Album.ArtistId 
    GROUP BY Artist.Name;
    ```

29. **Trova il cliente con la spesa totale più alta.**
    ```sql
    SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSpent 
    FROM Customer 
    JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId 
    GROUP BY Customer.CustomerId 
    ORDER BY TotalSpent DESC 
    LIMIT 1;
    ```

30. **Trova le città in cui vivono sia dipendenti che clienti.**
    ```sql
    SELECT DISTINCT Employee.City 
    FROM Employee 
    JOIN Customer ON Employee.City = Customer.City;
    ```

