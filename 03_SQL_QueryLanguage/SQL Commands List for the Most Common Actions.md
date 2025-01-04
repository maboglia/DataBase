---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
theme: Gaia
---

# **SQL Common Commands List**

---

#### **Contents**

- [**SQL Commands List for the Most Common Actions**](#sql-commands-list-for-the-most-common-actions)
      - [**Contents**](#contents)
  - [**SQL Commands List**](#sql-commands-list)
    - [**AND|OR**](#andor)
    - [**ALTER TABLE**](#alter-table)
    - [**AS (alias)**](#as-alias)
    - [**BETWEEN**](#between)
    - [**CREATE DATABASE**](#create-database)
    - [**CREATE TABLE**](#create-table)
    - [**CREATE INDEX**](#create-index)

---

- [**SQL Commands List for the Most Common Actions**](#sql-commands-list-for-the-most-common-actions)
      - [**Contents**](#contents)
  - [**SQL Commands List**](#sql-commands-list)
    - [**CREATE VIEW**](#create-view)
    - [**DELETE**](#delete)
    - [**GRANT**](#grant)
    - [**REVOKE**](#revoke)
    - [**COMMIT**](#commit)
    - [**ROLLBACK**](#rollback)
    - [**SAVEPOINT**](#savepoint)
    - [**DROP DATABASE**](#drop-database)

---

- [**SQL Commands List for the Most Common Actions**](#sql-commands-list-for-the-most-common-actions)
      - [**Contents**](#contents)
  - [**SQL Commands List**](#sql-commands-list)
    - [**DROP INDEX**](#drop-index)
      - [**SQL Server**](#sql-server)
      - [**MS Access**](#ms-access)
      - [**DB2/Oracle**](#db2oracle)
      - [**MySQL**](#mysql)
    - [**DROP TABLE**](#drop-table)
    - [**EXISTS**](#exists)
    - [**GROUP BY**](#group-by)
    - [**HAVING**](#having)

---

- [**SQL Commands List for the Most Common Actions**](#sql-commands-list-for-the-most-common-actions)
      - [**Contents**](#contents)
  - [**SQL Commands List**](#sql-commands-list)
    - [**IN**](#in)
    - [**INSERT INTO**](#insert-into)
    - [**INNER JOIN**](#inner-join)
    - [**LEFT JOIN**](#left-join)
    - [**RIGHT JOIN**](#right-join)
    - [**FULL JOIN**](#full-join)
    - [**LIKE**](#like)
    - [**ORDER BY**](#order-by)

---

- [**SQL Commands List for the Most Common Actions**](#sql-commands-list-for-the-most-common-actions)
      - [**Contents**](#contents)
  - [**SQL Commands List**](#sql-commands-list)
    - [**SELECT**](#select)
    - [**SELECT**](#select-1)
    - [**SELECT DISTINCT**](#select-distinct)
    - [**SELECT INTO**](#select-into)
    - [**SELECT TOP**](#select-top)
    - [**TRUNCATE TABLE**](#truncate-table)
    - [**UNION**](#union)
    - [**UNION ALL**](#union-all)
    - [**UPDATE**](#update)
    - [**WHERE**](#where)

---

## **SQL Commands List**

---

### **AND|OR**

**AND** combina due o più condizioni in una singola query. Tutte le condizioni devono essere soddisfatte per mostrare i risultati.  
**OR** restituisce risultati che soddisfano almeno una delle condizioni.

```sql
SELECT * FROM Developers

WHERE Country='France' AND City='Paris';

```


```sql
SELECT * FROM Developers

WHERE City='London' OR City='Paris';

```

---

### **ALTER TABLE**


Permette di aggiungere o rimuovere colonne da una tabella.

```sql
ALTER TABLE Developers
ADD BirthDate date;

```


```sql
ALTER TABLE Developers

DROP COLUMN BirthDate;


```

---

### **AS (alias)**

Permette di rinominare una colonna o una tabella con un alias più conveniente senza modificare i nomi originali nel database. Questo rende più semplici le query.

```sql
SELECT ID as CustomerID, Name AS Customers
FROM Customers;

```



```sql
SELECT o.ID, c.Name  
FROM Customers AS c, Customer_orders AS o

WHERE c.id = 2 AND c.ID = o.customer_id;

```

---

### **BETWEEN**

Filtra i risultati restituendo solo quelli che rientrano in un intervallo specificato (es. date, numeri o testo).

```sql
SELECT * FROM Orders

WHERE Price BETWEEN 10 AND 15;

```

---

### **CREATE DATABASE**

Crea un nuovo database. È necessario avere diritti di amministratore per eseguire questa operazione.

```sql
CREATE DATABASE testingDB;

```

---

### **CREATE TABLE**

Crea una nuova tabella all'interno di un database.

```sql
CREATE TABLE Suppliers (  
    SupplierID int,  
    FirstName varchar(255),  
    LastName varchar(255),  
    City varchar(255),  
    Country varchar(255) 

);
```

---

### **CREATE INDEX**

Crea un indice per una tabella, rendendo più veloce il recupero dei dati. Gli indici non sono visibili agli utenti.

```sql
CREATE INDEX idx_lastname

ON Persons (LastName);
```

---

### **CREATE VIEW**

Crea una vista basata su una query specifica. Una vista è simile a una tabella ma contiene solo i campi rilevanti per uno scopo specifico.

```sql
CREATE VIEW [Present List Products] AS  
SELECT ID, Name  
FROM Products

WHERE Discontinued = No;
```

---

### **DELETE**

Elimina righe specifiche da una tabella.

```sql
DELETE FROM Developers

WHERE Name='Brad Pitt';
```

```sql
DELETE * FROM Developers;
```

---

### **GRANT**

Concede permessi agli utenti per accedere a un database.

```sql
GRANT SELECT, UPDATE ON YOUR_TABLE TO FIRST_USER, SECOND_USER;
```

---

### **REVOKE**

Revoca i permessi precedentemente concessi agli utenti.

```sql
REVOKE SELECT, UPDATE ON YOUR_TABLE FROM FIRST_USER, SECOND_USER;
```

---

### **COMMIT**

Salva ogni transazione nel database.

```sql
DELETE FROM CUSTOMERS    
WHERE AGE = 18;  
```

COMMIT
---

### **ROLLBACK**

Annulla le transazioni non ancora salvate nel database.

```sql
DELETE FROM CUSTOMERS    
WHERE AGE = 18;  

ROLLBACK;
```

---

### **SAVEPOINT**

Crea un punto di riferimento all'interno di una transazione per poter tornare a quel punto senza annullare l'intera transazione.

```sql
SAVEPOINT SAVEPOINT_NAME;
```

---

### **DROP DATABASE**

Elimina un intero database e tutti i suoi dati. Questa operazione deve essere usata con estrema cautela.

```sql
DROP DATABASE db_name
```

---

### **DROP INDEX**

Elimina un indice specifico

---

#### **SQL Server**

```sql
DROP INDEX tbl_name.index_name

```

---

#### **MS Access**

```sql
DROP INDEX index_name ON tbl_name

```

---

#### **DB2/Oracle**

```sql
DROP INDEX index_name

```

---

#### **MySQL**

```sql
ALTER TABLE tbl_name DROP INDEX index_name

```

---

### **DROP TABLE**

Elimina una tabella con tutti i suoi parametri. Se si vogliono eliminare solo i contenuti mantenendo la tabella, si usa il comando **TRUNCATE TABLE**.

```sql
DROP TABLE tbl_name

```

---

### **EXISTS**

Verifica l'esistenza di un record utilizzando una sottoquery.

```sql
SELECT id, name  
FROM customers

WHERE EXISTS (SELECT id FROM customer_orders WHERE customer_orders.customer_id = customers.id AND customers.city = "Rome");
```

---

### **GROUP BY**

Organizza dati identici in gruppi utilizzando una funzione di aggregazione.

```sql
SELECT COUNT(ID), City  
FROM Developers

GROUP BY City;
```

---

### **HAVING**

Filtra i risultati di una query con funzioni di aggregazione. Si usa al posto di **WHERE** per queste funzioni.

```sql
SELECT COUNT(ID), Country  
FROM Pets  
GROUP BY Country

HAVING COUNT(ID) > 2;
```

---

### **IN**

Include più valori nella clausola **WHERE**.

```sql
SELECT * FROM Developers

WHERE Country IN ('USA', 'France', 'India');
```

---

### **INSERT INTO**

Inserisce nuove righe in una tabella.

```sql
INSERT INTO Developers (Name, City, Country)

VALUES ('Luke Christon', 'London', 'UK');
```

---

### **INNER JOIN**

Combina righe provenienti da tabelle diverse.

```sql
SELECT Orders.ID, Developers.Name  
FROM Orders

INNER JOIN Developers ON Orders.ID = Developers.ID;
```

---

### **LEFT JOIN**

Recupera righe dalla tabella di sinistra con corrispondenze nella tabella di destra. Le righe senza corrispondenze contengono valori nulli.

```sql
SELECT Developers.Name, Customer_orders.ID  
FROM Developers  
LEFT JOIN Customer_orders ON Developers.ID = Customer_orders.customer_id

ORDER BY Developers.Name;
```

---

### **RIGHT JOIN**

Recupera righe dalla tabella di destra con corrispondenze nella tabella di sinistra.

```sql
SELECT Customer_orders.ID, Employees.Last_name, Employees.First_name  
FROM Customer_orders  
RIGHT JOIN Employees ON Customer_orders.employee_id = Employees.ID

ORDER BY Customer_orders.ID;
```

---

### **FULL JOIN**

Restituisce tutte le righe che corrispondono, sia nella tabella di sinistra che in quella di destra.

```sql
SELECT Customers.Name, Customer_orders.ID  
FROM Customers  
FULL OUTER JOIN Orders ON Customers.ID=Customer_orders.customer_id

ORDER BY Customers.Name;
```

---

### **LIKE**

Cerca specifici pattern in una colonna.

```sql
SELECT * FROM users WHERE email LIKE '%gmail%';
```

---

### **ORDER BY**

Ordina i risultati della query (ascendente per impostazione predefinita).

```sql
SELECT * FROM users ORDER BY email DESC;
```

---

### **SELECT**

Seleziona dati da un database e restituisce una tabella di risultati.

```sql
SELECT username,email 

FROM users;
```

```sql
SELECT * FROM Customers;
```

---

### **SELECT DISTINCT**

Restituisce solo dati unici, escludendo i duplicati.

```sql
SELECT DISTINCT City FROM Developers;
```

---

### **SELECT INTO**

Copia dati selezionati da una tabella a un’altra.

```sql
SELECT * INTO CustomerBackup2018

FROM Customers;
```

```sql
SELECT Name, Contact INTO CustomerBackup2017

FROM Customers;
```

---

### **SELECT TOP**

Specifica il numero massimo o la percentuale di dati da restituire nei risultati.

```sql
SELECT * FROM Customers

LIMIT 3;
```

```sql
SELECT TOP 50 PERCENT * FROM Customers;
```

---

### **TRUNCATE TABLE**

Elimina i dati di una tabella mantenendo la struttura e i parametri.

```sql
TRUNCATE TABLE tbl_name
```

---

### **UNION**

Combina più set di risultati di query eliminando i duplicati.

```sql
SELECT City FROM Developers  
UNION  
SELECT City FROM Customers

ORDER BY City;
```

---

### **UNION ALL**

Combina più set di risultati mantenendo i duplicati.

```sql
SELECT City FROM Developers  
UNION ALL  
SELECT City FROM Customers

ORDER BY City;
```

---

### **UPDATE**

Aggiorna i dati di una tabella.

```sql
UPDATE Developers  
SET City = 'Paris', Country= 'France'

WHERE Name = 'Brad Pitt';
```

---

### **WHERE**

Filtra i risultati di una query restituendo solo quelli che soddisfano la condizione specificata. Non può essere usata con funzioni di aggregazione; in questo caso, si usa **HAVING**.


```sql
SELECT * FROM Developers

WHERE Country='France';

```
