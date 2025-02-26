# SQL Daily routine

Ecco una routine completa per esercitarsi e consolidare le conoscenze SQL. Questa routine copre:  

✅ Creazione di un database e un utente con permessi  
✅ Creazione di tabelle (prodotti, clienti, ordini) con chiavi primarie ed esterne  
✅ Esecuzione di operazioni **DML** (INSERT, UPDATE, DELETE)  
✅ Test di vincoli di **integrità referenziale**  
✅ Query avanzate (JOIN, GROUP BY, HAVING, subquery)  
✅ Eliminazione record, tabelle, utente e database  

---

### **1️⃣ Creazione Database e Utente**

```sql
-- Crea un nuovo database
CREATE DATABASE EsercizioSQL;

-- Seleziona il database
USE EsercizioSQL;

-- Crea un nuovo utente con password
CREATE USER 'esercizio_user'@'localhost' IDENTIFIED BY 'password123';

-- Assegna permessi all'utente sul database
GRANT ALL PRIVILEGES ON EsercizioSQL.* TO 'esercizio_user'@'localhost';

-- Ricarica i permessi
FLUSH PRIVILEGES;
```

---

### **2️⃣ Creazione Tabelle**

```sql
-- Creazione tabella Clienti
CREATE TABLE Clienti (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Creazione tabella Prodotti
CREATE TABLE Prodotti (
    id_prodotto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    prezzo DECIMAL(10,2) NOT NULL CHECK (prezzo > 0)
);

-- Creazione tabella Ordini con chiave esterna
CREATE TABLE Ordini (
    id_ordine INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_prodotto INT,
    quantita INT NOT NULL CHECK (quantita > 0),
    data_ordine DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clienti(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_prodotto) REFERENCES Prodotti(id_prodotto) ON DELETE CASCADE
);
```

---

### **3️⃣ Inserimento Dati (DML - INSERT)**

```sql
-- Inserimento clienti
INSERT INTO Clienti (nome, email) VALUES 
('Mario Rossi', 'mario.rossi@email.com'),
('Luca Bianchi', 'luca.bianchi@email.com');

-- Inserimento prodotti
INSERT INTO Prodotti (nome, prezzo) VALUES 
('Laptop', 1200.00),
('Smartphone', 800.00);

-- Inserimento ordini
INSERT INTO Ordini (id_cliente, id_prodotto, quantita) VALUES 
(1, 1, 2),  -- Mario compra 2 Laptop
(2, 2, 1);  -- Luca compra 1 Smartphone
```

---

### **4️⃣ Query di Lettura (SELECT Avanzate)**

```sql
-- 4a. Elenca tutti gli ordini con i dettagli dei clienti e dei prodotti
SELECT Ordini.id_ordine, Clienti.nome AS Cliente, Prodotti.nome AS Prodotto, 
       Ordini.quantita, Prodotti.prezzo, (Ordini.quantita * Prodotti.prezzo) AS Totale
FROM Ordini
INNER JOIN Clienti USING(id_cliente)
INNER JOIN Prodotti USING(id_prodotto);

-- 4b. Conta quanti ordini ha fatto ogni cliente
SELECT Clienti.nome, COUNT(Ordini.id_ordine) AS NumeroOrdini
FROM Clienti
LEFT JOIN Ordini USING(id_cliente)
GROUP BY Clienti.nome;

-- 4c. Mostra solo i clienti che hanno fatto più di un ordine
SELECT Clienti.nome, COUNT(Ordini.id_ordine) AS NumeroOrdini
FROM Clienti
JOIN Ordini USING(id_cliente)
GROUP BY Clienti.nome
HAVING COUNT(Ordini.id_ordine) > 1;

-- 4d. Mostra il totale speso da ogni cliente
SELECT Clienti.nome, SUM(Prodotti.prezzo * Ordini.quantita) AS TotaleSpeso
FROM Ordini
JOIN Clienti USING(id_cliente)
JOIN Prodotti USING(id_prodotto)
GROUP BY Clienti.nome;
```

---

### **5️⃣ Update e Delete con Vincoli**

```sql
-- Aggiorna il prezzo di un prodotto
UPDATE Prodotti 
SET prezzo = 1300.00 
WHERE nome = 'Laptop';

-- Prova a eliminare un cliente con ordini -> Fallirà senza ON DELETE CASCADE
DELETE FROM Clienti WHERE id_cliente = 1;

-- Eliminazione di un ordine specifico
DELETE FROM Ordini WHERE id_ordine = 2;
```

---

### **6️⃣ Test dei Vincoli (FOREIGN KEY, CHECK)**

```sql
-- Tentativo di inserire un ordine con quantità negativa (fallirà per il CHECK)
INSERT INTO Ordini (id_cliente, id_prodotto, quantita) VALUES (1, 1, -1);
```

---

### **7️⃣ Eliminazione Dati, Tabelle e Database**

```sql
-- Elimina tutti gli ordini
DELETE FROM Ordini;

-- Elimina la tabella Ordini
DROP TABLE Ordini;

-- Elimina la tabella Clienti e Prodotti
DROP TABLE Clienti;
DROP TABLE Prodotti;

-- Rimuove l'utente
DROP USER 'esercizio_user'@'localhost';

-- Elimina il database
DROP DATABASE EsercizioSQL;
```

---

### **💡 Conclusione**

Questa routine aiuta a:
✔ Creare e gestire database e utenti  
✔ Definire tabelle con chiavi primarie ed esterne  
✔ Inserire, aggiornare e eliminare dati con vincoli  
✔ Eseguire query avanzate con JOIN e GROUP BY  
✔ Testare vincoli di integrità referenziale  

