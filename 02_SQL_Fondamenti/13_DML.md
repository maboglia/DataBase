# DML - Data Manipulation

1. **Linguaggi di Manipolazione dei Dati (DML - Data Manipulation Language):**
   - I linguaggi DML sono utilizzati per manipolare i dati all'interno delle tabelle del database. Consentono di eseguire operazioni come l'interrogazione, l'inserimento, l'aggiornamento e la cancellazione dei dati. Alcuni esempi di comandi DML includono:
     - `SELECT`: Per interrogare i dati.
     - `INSERT`: Per inserire nuovi dati.
     - `UPDATE`: Per aggiornare dati esistenti.
     - `DELETE`: Per eliminare dati.

---

Il linguaggio SQL (Structured Query Language) è uno dei linguaggi di accesso ai dati più ampiamente utilizzati ed è spesso utilizzato sia per DDL che per DML in sistemi di gestione delle basi di dati relazionali. SQL fornisce una sintassi standardizzata e potente per definire, manipolare e interrogare dati nei database.

Gli utenti e gli sviluppatori interagiscono con il database utilizzando questi linguaggi, sia attraverso interfacce utente grafiche che attraverso chiamate di programmazione in applicazioni software. La conoscenza di questi linguaggi è essenziale per gestire e sfruttare appieno le potenzialità di un sistema di gestione delle basi di dati.

---

## DML

Le istruzioni DML (Data Manipulation Language) in SQL sono utilizzate per manipolare i dati all'interno delle tabelle di un database. Le principali istruzioni DML includono `SELECT`, `INSERT`, `UPDATE` e `DELETE`. Ecco una descrizione di ciascuna:

1. **SELECT:** L'istruzione `SELECT` è utilizzata per recuperare dati da una o più tabelle nel database. Consente di specificare le colonne desiderate, condizioni di ricerca e join tra tabelle.

   Esempio:

   ```sql
   SELECT Nome, Cognome
   FROM Nomi
   WHERE Età > 18;
   ```

   Questa query restituisce i nomi e i cognomi delle persone con un'età superiore a 18 anni dalla tabella "Nomi".

---

2. **INSERT:** L'istruzione `INSERT` è utilizzata per inserire nuovi dati in una tabella esistente. Si possono specificare i valori per ogni colonna o inserire valori provenienti da un'altra query.

   Esempio:

   ```sql
   INSERT INTO Nomi (Nome, Cognome, Età)
   VALUES ('Marco', 'Rossi', 25);
   ```

   Questa query inserisce una nuova riga nella tabella "Nomi" con i valori specificati.

---

3. **UPDATE:** L'istruzione `UPDATE` è utilizzata per modificare i dati esistenti in una tabella. Si possono specificare i valori da modificare e le condizioni per identificare le righe da aggiornare.

   Esempio:

   ```sql
   UPDATE Nomi
   SET Età = 26
   WHERE Nome = 'Marco' AND Cognome = 'Rossi';
   ```

   Questa query aggiorna l'età di Marco Rossi nella tabella "Nomi" a 26 anni.

---

4. **DELETE:** L'istruzione `DELETE` è utilizzata per eliminare dati da una tabella. Si possono specificare le condizioni per identificare le righe da eliminare.

   Esempio:

   ```sql
   DELETE FROM Nomi
   WHERE Età < 18;
   ```

   Questa query elimina tutte le righe dalla tabella "Nomi" dove l'età è inferiore a 18 anni.

Le istruzioni DML sono fondamentali per manipolare e gestire i dati all'interno di un database, consentendo operazioni come l'inserimento, l'aggiornamento e l'eliminazione di informazioni

---

## DML (Data Manipulation Language)

DML è utilizzato per manipolare i dati all'interno delle tabelle del database.

---

## SELECT

1. **SELECT
   - `SELECT`: Recupera dati da una o più tabelle.

---

## INSERT

2. **INSERT
   - `INSERT INTO`: Aggiunge nuove righe di dati a una tabella.

---

## UPDATE

3. **UPDATE
   - `UPDATE`: Modifica i dati esistenti in una tabella.

---

## DELETE

4. **DELETE
   - `DELETE FROM`: Elimina righe da una tabella.

---

## MERGE

5. **MERGE
   - `MERGE`: Esegue una combinazione di operazioni di INSERT, UPDATE e DELETE in base a una condizione di corrispondenza.

---

## CALL

6. **CALL
   - `CALL`: Esegue una procedura o funzione memorizzata.

---

## EXPLAIN

7. **EXPLAIN
   - `EXPLAIN`: Visualizza il piano di esecuzione di una query.

---

## LOCK

8. **LOCK
   - `LOCK TABLE`: Blocca una o più tabelle per l'accesso da parte di altri utenti durante l'esecuzione di una transazione.

---

## SAVEPOINT

9. **SAVEPOINT
   - `SAVEPOINT`: Definisce un punto all'interno di una transazione in cui è possibile effettuare il rollback.

---

## SET TRANSACTION

10. **SET TRANSACTION
    - `SET TRANSACTION`: Imposta le caratteristiche di una transazione, come l'isolamento e la consistenza.

Utilizzando DDL e DML in combinazione, è possibile definire la struttura di un database, creare, modificare o eliminare tabelle e indici, e manipolare i dati all'interno del database.
