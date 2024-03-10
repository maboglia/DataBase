---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

I linguaggi di accesso ai dati sono strumenti e metodi che consentono agli utenti di interagire con i database e di eseguire operazioni come l'interrogazione, l'aggiornamento, l'inserimento e la cancellazione di dati. Questi linguaggi forniscono un'interfaccia tra gli utenti o le applicazioni e il sistema di gestione del database (DBMS). Ci sono due categorie principali di linguaggi di accesso ai dati:

1. **Linguaggi di Definizione dei Dati (DDL - Data Definition Language):**
   - I linguaggi DDL sono utilizzati per definire e gestire lo schema del database. Consentono di creare, modificare e eliminare gli oggetti del database, come tabelle, viste, indici e vincoli. Alcuni esempi di comandi DDL includono:
     - `CREATE TABLE`: Per creare una nuova tabella.
     - `ALTER TABLE`: Per modificare la struttura di una tabella esistente.
     - `DROP TABLE`: Per eliminare una tabella.
     - `CREATE INDEX`: Per creare un nuovo indice.

2. **Linguaggi di Manipolazione dei Dati (DML - Data Manipulation Language):**
   - I linguaggi DML sono utilizzati per manipolare i dati all'interno delle tabelle del database. Consentono di eseguire operazioni come l'interrogazione, l'inserimento, l'aggiornamento e la cancellazione dei dati. Alcuni esempi di comandi DML includono:
     - `SELECT`: Per interrogare i dati.
     - `INSERT`: Per inserire nuovi dati.
     - `UPDATE`: Per aggiornare dati esistenti.
     - `DELETE`: Per eliminare dati.

Il linguaggio SQL (Structured Query Language) è uno dei linguaggi di accesso ai dati più ampiamente utilizzati ed è spesso utilizzato sia per DDL che per DML in sistemi di gestione delle basi di dati relazionali. SQL fornisce una sintassi standardizzata e potente per definire, manipolare e interrogare dati nei database.

Gli utenti e gli sviluppatori interagiscono con il database utilizzando questi linguaggi, sia attraverso interfacce utente grafiche che attraverso chiamate di programmazione in applicazioni software. La conoscenza di questi linguaggi è essenziale per gestire e sfruttare appieno le potenzialità di un sistema di gestione delle basi di dati.


---

## DDL

Le istruzioni DDL (Data Definition Language) in SQL sono utilizzate per definire, modificare e cancellare strutture di database e oggetti ad alto livello come tabelle, indici, viste, e altro. Le principali istruzioni DDL includono `CREATE`, `ALTER`, e `DROP`. Ecco una descrizione di ciascuna:

1. **CREATE:** L'istruzione `CREATE` è utilizzata per creare nuovi oggetti nel database, come tabelle, viste, indici, procedure, e così via.

   Esempio:

   ```sql
   CREATE TABLE Nomi (
       ID INT PRIMARY KEY,
       Nome VARCHAR(50),
       Cognome VARCHAR(50)
   );
   ```

   Questa query crea una nuova tabella chiamata "Nomi" con tre colonne: "ID", "Nome", e "Cognome".

2. **ALTER:** L'istruzione `ALTER` è utilizzata per modificare la struttura degli oggetti esistenti nel database, come aggiungere o eliminare colonne da una tabella, modificare il tipo di dati di una colonna, o aggiungere vincoli.

   Esempio:

   ```sql
   ALTER TABLE Nomi
   ADD Età INT;
   ```

   Questa query modifica la tabella "Nomi" aggiungendo una nuova colonna chiamata "Età".

3. **DROP:** L'istruzione `DROP` è utilizzata per eliminare oggetti dal database, come tabelle, viste o indici. L'eliminazione di un oggetto comporta la perdita permanente di tutti i dati associati a quell'oggetto.

   Esempio:

   ```sql
   DROP TABLE Nomi;
   ```

   Questa query elimina completamente la tabella "Nomi" dal database.

Le istruzioni DDL sono fondamentali per la progettazione e la gestione della struttura di un database. Possono essere utilizzate per creare, modificare o eliminare oggetti in modo da adattarsi alle esigenze del sistema o dell'applicazione.

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

## DCL

Le istruzioni DCL (Data Control Language) in SQL sono utilizzate per gestire i permessi di accesso e di controllo dei dati in un database. Le principali istruzioni DCL includono `GRANT` e `REVOKE`. Ecco una descrizione di entrambe:

1. **GRANT:** L'istruzione `GRANT` è utilizzata per concedere privilegi o permessi specifici agli utenti o ai ruoli. I privilegi possono includere il diritto di eseguire determinate operazioni, come SELECT, INSERT, UPDATE, DELETE, o altri privilegi specifici del sistema.

   Esempio:

   ```sql
   GRANT SELECT, INSERT ON Tabella1 TO Utente1;
   ```

   Questa query concede a "Utente1" il permesso di eseguire le operazioni di SELECT e INSERT sulla tabella "Tabella1".

2. **REVOKE:** L'istruzione `REVOKE` è utilizzata per revocare o rimuovere i privilegi precedentemente concessi agli utenti o ai ruoli.

   Esempio:

   ```sql
   REVOKE INSERT ON Tabella1 FROM Utente1;
   ```

   Questa query revoca il permesso di eseguire l'operazione di INSERT sulla tabella "Tabella1" da parte di "Utente1".

Le istruzioni DCL sono fondamentali per garantire la sicurezza e il controllo degli accessi nei database. È importante gestire attentamente i privilegi per evitare accessi non autorizzati o modifiche indesiderate ai dati. I permessi possono essere concessi o revocati a livello di tabella, vista o database, e possono essere specifici per determinate operazioni o per l'intero set di dati.


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

2. **INSERT:** L'istruzione `INSERT` è utilizzata per inserire nuovi dati in una tabella esistente. Si possono specificare i valori per ogni colonna o inserire valori provenienti da un'altra query.

   Esempio:

   ```sql
   INSERT INTO Nomi (Nome, Cognome, Età)
   VALUES ('Marco', 'Rossi', 25);
   ```

   Questa query inserisce una nuova riga nella tabella "Nomi" con i valori specificati.

3. **UPDATE:** L'istruzione `UPDATE` è utilizzata per modificare i dati esistenti in una tabella. Si possono specificare i valori da modificare e le condizioni per identificare le righe da aggiornare.

   Esempio:

   ```sql
   UPDATE Nomi
   SET Età = 26
   WHERE Nome = 'Marco' AND Cognome = 'Rossi';
   ```

   Questa query aggiorna l'età di Marco Rossi nella tabella "Nomi" a 26 anni.

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
