---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# I principali comandi SQL

[Esempi d'uso](./SQL%20Commands%20List%20for%20the%20Most%20Common%20Actions.md)

---

### **AND|OR**

**AND** combina due o più condizioni in una singola query. Tutte le condizioni devono essere soddisfatte per mostrare i risultati.  
**OR** restituisce risultati che soddisfano almeno una delle condizioni.

---

### **ALTER TABLE**  

Permette di aggiungere o rimuovere colonne da una tabella.

---

### **AS (alias)**  

Permette di rinominare una colonna o una tabella con un alias più conveniente senza modificare i nomi originali nel database. Questo rende più semplici le query.

---

### **BETWEEN**  

Filtra i risultati restituendo solo quelli che rientrano in un intervallo specificato (es. date, numeri o testo).

---

### **CREATE DATABASE**  

Crea un nuovo database. È necessario avere diritti di amministratore per eseguire questa operazione.

---

### **CREATE TABLE**  

Crea una nuova tabella all'interno di un database.

---

### **CREATE INDEX**  

Crea un indice per una tabella, rendendo più veloce il recupero dei dati. Gli indici non sono visibili agli utenti.

---

### **CREATE VIEW**  

Crea una vista basata su una query specifica. Una vista è simile a una tabella ma contiene solo i campi rilevanti per uno scopo specifico.

---

### **DELETE**  

Elimina righe specifiche da una tabella.

---

### **GRANT**  

Concede permessi agli utenti per accedere a un database.

---

### **REVOKE**  

Revoca i permessi precedentemente concessi agli utenti.

---

### **COMMIT**  

Salva ogni transazione nel database.

---

### **ROLLBACK**  

Annulla le transazioni non ancora salvate nel database.

---

### **SAVEPOINT**  

Crea un punto di riferimento all'interno di una transazione per poter tornare a quel punto senza annullare l'intera transazione.

---

### **DROP DATABASE**  

Elimina un intero database e tutti i suoi dati. Questa operazione deve essere usata con estrema cautela.

---

### **DROP INDEX**  

Elimina un indice specifico.

---

### **DROP TABLE**  

Elimina una tabella con tutti i suoi parametri. Se si vogliono eliminare solo i contenuti mantenendo la tabella, si usa il comando **TRUNCATE TABLE**.

---

### **EXISTS**  

Verifica l'esistenza di un record utilizzando una sottoquery.

---

### **GROUP BY**  

Organizza dati identici in gruppi utilizzando una funzione di aggregazione.

---

### **HAVING**  

Filtra i risultati di una query con funzioni di aggregazione. Si usa al posto di **WHERE** per queste funzioni.

---

### **IN**  

Include più valori nella clausola **WHERE**.

---

### **INSERT INTO**  

Inserisce nuove righe in una tabella.

---

### **INNER JOIN**  

Combina righe provenienti da tabelle diverse.

---

### **LEFT JOIN**  

Recupera righe dalla tabella di sinistra con corrispondenze nella tabella di destra. Le righe senza corrispondenze contengono valori nulli.

---

### **RIGHT JOIN**  

Recupera righe dalla tabella di destra con corrispondenze nella tabella di sinistra.

---

### **FULL JOIN**  

Restituisce tutte le righe che corrispondono, sia nella tabella di sinistra che in quella di destra.

---

### **LIKE**  

Cerca specifici pattern in una colonna.

---

### **ORDER BY**  

Ordina i risultati della query (ascendente per impostazione predefinita).

---

### **SELECT**  

Seleziona dati da un database e restituisce una tabella di risultati.

---

### **SELECT DISTINCT**  

Restituisce solo dati unici, escludendo i duplicati.

---

### **SELECT INTO**  

Copia dati selezionati da una tabella a un’altra.

---

### **SELECT TOP**  

Specifica il numero massimo o la percentuale di dati da restituire nei risultati.

---

### **TRUNCATE TABLE**  

Elimina i dati di una tabella mantenendo la struttura e i parametri.

---

### **UNION**  

Combina più set di risultati di query eliminando i duplicati.

---

### **UNION ALL**  

Combina più set di risultati mantenendo i duplicati.

---

### **UPDATE**  

Aggiorna i dati di una tabella.

---

### **WHERE**  

Filtra i risultati di una query restituendo solo quelli che soddisfano la condizione specificata. Non può essere usata con funzioni di aggregazione; in questo caso, si usa **HAVING**.
