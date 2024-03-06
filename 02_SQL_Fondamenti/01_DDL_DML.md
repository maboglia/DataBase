---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

## DDL (Data Definition Language) e DML (Data Manipulation Language)

---

DDL (Data Definition Language) e DML (Data Manipulation Language) sono due categorie principali di comandi utilizzati in SQL per definire e manipolare dati in un database relazionale.

---

## DDL (Data Definition Language)

DDL è utilizzato per definire la struttura del database, creare oggetti del database e definire vincoli.

---

### CREATE

1. **CREATE
   - `CREATE DATABASE`: Crea un nuovo database.
   - `CREATE TABLE`: Definisce una nuova tabella con le relative colonne e tipi di dati.
   - `CREATE INDEX`: Crea un indice su una o più colonne di una tabella per migliorare le prestazioni delle query.

---

### ALTER

2. **ALTER
   - `ALTER TABLE`: Modifica la struttura di una tabella esistente, aggiungendo o rimuovendo colonne, modificando tipi di dati o vincoli.

---

### DROP

3. **DROP
   - `DROP DATABASE`: Elimina un database esistente.
   - `DROP TABLE`: Elimina una tabella esistente e tutti i dati associati.
   - `DROP INDEX`: Elimina un indice esistente.

---

### TRUNCATE

4. **TRUNCATE
   - `TRUNCATE TABLE`: Rimuove tutti i dati da una tabella, ma mantiene la struttura della tabella per un rapido reset dei dati.

---

### COMMENT

5. **COMMENT
   - `COMMENT ON`: Aggiunge commenti descrittivi a database, tabelle, colonne, ecc.

---

### GRANT e REVOKE

6. **GRANT e REVOKE
   - `GRANT`: Concede privilegi agli utenti su oggetti del database.
   - `REVOKE`: Revoca privilegi precedentemente concessi.

---

## DML (Data Manipulation Language)

DML è utilizzato per manipolare i dati all'interno delle tabelle del database.

---

### SELECT

1. **SELECT
   - `SELECT`: Recupera dati da una o più tabelle.

---

### INSERT

2. **INSERT
   - `INSERT INTO`: Aggiunge nuove righe di dati a una tabella.

---

### UPDATE

3. **UPDATE
   - `UPDATE`: Modifica i dati esistenti in una tabella.

---

### DELETE

4. **DELETE
   - `DELETE FROM`: Elimina righe da una tabella.

---

### MERGE

5. **MERGE
   - `MERGE`: Esegue una combinazione di operazioni di INSERT, UPDATE e DELETE in base a una condizione di corrispondenza.

---

### CALL

6. **CALL
   - `CALL`: Esegue una procedura o funzione memorizzata.

---

### EXPLAIN

7. **EXPLAIN
   - `EXPLAIN`: Visualizza il piano di esecuzione di una query.

---

### LOCK

8. **LOCK
   - `LOCK TABLE`: Blocca una o più tabelle per l'accesso da parte di altri utenti durante l'esecuzione di una transazione.

---

### SAVEPOINT

9. **SAVEPOINT
   - `SAVEPOINT`: Definisce un punto all'interno di una transazione in cui è possibile effettuare il rollback.

---

### SET TRANSACTION

10. **SET TRANSACTION
    - `SET TRANSACTION`: Imposta le caratteristiche di una transazione, come l'isolamento e la consistenza.

Utilizzando DDL e DML in combinazione, è possibile definire la struttura di un database, creare, modificare o eliminare tabelle e indici, e manipolare i dati all'interno del database.

---
