# I linguaggi di accesso ai dati

I linguaggi di accesso ai dati in ambito SQL si suddividono in diverse categorie principali, ognuna delle quali ha uno scopo specifico. Di seguito una panoramica:

---

### **1. DCL - Data Control Language (Linguaggio di Controllo dei Dati)**  

**Scopo:** Controllare i diritti e le autorizzazioni degli utenti per accedere ai dati.  

- **Caratteristiche:**  
  - Gestisce la sicurezza e i permessi sulle tabelle, viste, procedure, ecc.
  - È utilizzato principalmente dagli amministratori di database per garantire accesso sicuro.  

- **Comandi principali:**  
  - **`GRANT`**: Assegna permessi a un utente o a un ruolo.  

    ```sql
    GRANT SELECT, INSERT ON database.table TO 'utente'@'host';
    ```

  - **`REVOKE`**: Revoca i permessi precedentemente assegnati.  

    ```sql
    REVOKE INSERT ON database.table FROM 'utente'@'host';
    ```

---

### **2. DDL - Data Definition Language (Linguaggio di Definizione dei Dati)**  

**Scopo:** Definire e gestire la struttura degli oggetti del database (es. tabelle, indici, viste).  

- **Caratteristiche:**  
  - Utilizzato per creare, modificare o eliminare la struttura di un database.  
  - Le istruzioni sono eseguite in modo immediato e non possono essere annullate.  

- **Comandi principali:**  
  - **`CREATE`**: Crea nuovi oggetti nel database.  

    ```sql
    CREATE TABLE utenti (
        id INT PRIMARY KEY,
        nome VARCHAR(100)
    );
    ```

  - **`ALTER`**: Modifica la struttura di oggetti esistenti.  

    ```sql
    ALTER TABLE utenti ADD email VARCHAR(100);
    ```

  - **`DROP`**: Elimina oggetti dal database.  

    ```sql
    DROP TABLE utenti;
    ```

---

### **3. DML - Data Manipulation Language (Linguaggio di Manipolazione dei Dati)**  

**Scopo:** Manipolare i dati contenuti negli oggetti definiti dal DDL.  

- **Caratteristiche:**  
  - Gestisce l’inserimento, l’aggiornamento, l’eliminazione e la lettura dei dati.  
  - I comandi DML sono transazionali, il che significa che possono essere annullati con un rollback.  

- **Comandi principali:**  
  - **`INSERT`**: Inserisce nuovi dati.  

    ```sql
    INSERT INTO utenti (id, nome) VALUES (1, 'Luca');
    ```

  - **`UPDATE`**: Modifica i dati esistenti.  

    ```sql
    UPDATE utenti SET nome = 'Marco' WHERE id = 1;
    ```

  - **`DELETE`**: Elimina i dati esistenti.  

    ```sql
    DELETE FROM utenti WHERE id = 1;
    ```

---

### **4. Query Language (Linguaggio di Interrogazione dei Dati)**  

**Scopo:** Interrogare il database per recuperare informazioni.  

- **Caratteristiche:**  
  - I comandi di query fanno parte del DML ma si distinguono per essere focalizzati solo sulla lettura dei dati.  
  - Il linguaggio di interrogazione SQL è particolarmente orientato alla selezione e al filtraggio dei dati.  

- **Comando principale:**  
  - **`SELECT`**: Recupera dati da una o più tabelle.  

    ```sql
    SELECT nome, email FROM utenti WHERE id = 1;
    ```

  - Può essere arricchito con:
    - **Clausole**: `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`.  
    - **Operazioni**: Join, funzioni aggregate (`SUM`, `AVG`, `COUNT`), sottoquery.  

---

### **Riepilogo**

| **Categoria** | **Scopo**                       | **Comandi principali**                            |
|---------------|----------------------------------|--------------------------------------------------|
| **DCL**       | Controllo dell'accesso ai dati  | `GRANT`, `REVOKE`                                |
| **DDL**       | Definizione della struttura     | `CREATE`, `ALTER`, `DROP`                        |
| **DML**       | Manipolazione dei dati          | `INSERT`, `UPDATE`, `DELETE`                     |
| **Query**     | Recupero dei dati               | `SELECT` (con `WHERE`, `JOIN`, `GROUP BY`, ecc.) |

Ognuna di queste categorie copre aspetti fondamentali per il funzionamento e la gestione di un database relazionale.

---

Il linguaggio SQL (Structured Query Language) è uno dei linguaggi di accesso ai dati più ampiamente utilizzati ed è spesso utilizzato sia per DDL che per DML in sistemi di gestione delle basi di dati relazionali. SQL fornisce una sintassi standardizzata e potente per definire, manipolare e interrogare dati nei database.

Gli utenti e gli sviluppatori interagiscono con il database utilizzando questi linguaggi, sia attraverso interfacce utente grafiche che attraverso chiamate di programmazione in applicazioni software. La conoscenza di questi linguaggi è essenziale per gestire e sfruttare appieno le potenzialità di un sistema di gestione delle basi di dati.

---

## Le query

Le query rappresentano un aspetto fondamentale nell'interazione con un database, consentendo agli utenti di recuperare dati specifici, eseguire aggiornamenti, inserire nuovi dati e altro ancora. Il linguaggio di query più comune utilizzato per interagire con i database relazionali è il SQL (Structured Query Language).

---

### Linguaggio SQL

1. **Linguaggio SQL:** SQL fornisce un insieme di istruzioni standardizzate per comunicare con i database. Le principali operazioni che possono essere eseguite attraverso SQL includono SELECT (per recuperare dati), INSERT (per inserire nuovi dati), UPDATE (per modificare dati esistenti) e DELETE (per cancellare dati).

---

### Operazione SELECT

2. **Operazione SELECT:** L'operazione SELECT è fondamentale per recuperare dati da una o più tabelle. Una query SELECT può essere personalizzata per specificare le colonne desiderate, condizioni di filtro, ordinamenti e altro ancora.

   Esempio di query SELECT:

   ```sql
   SELECT Nome, Cognome FROM Studenti WHERE CorsoDiStudi = 'Informatica';
   ```

   Questa query restituirebbe i nomi e i cognomi degli studenti iscritti al corso di Informatica.

---

### Operazioni JOIN

3. **Operazioni JOIN:** Le operazioni di JOIN sono utilizzate per combinare dati provenienti da più tabelle in base alle relazioni definite dalle chiavi. Ad esempio, un INNER JOIN può essere utilizzato per recuperare solo i record che hanno corrispondenze in entrambe le tabelle coinvolte.

   Esempio di query JOIN:

   ```sql
   SELECT Studenti.Nome, Corsi.NomeCorso
   FROM Studenti
   INNER JOIN Iscrizioni ON Studenti.StudenteID = Iscrizioni.StudenteID
   INNER JOIN Corsi ON Iscrizioni.CorsoID = Corsi.CorsoID;
   ```

   Questa query restituirebbe i nomi degli studenti e dei corsi a cui sono iscritti.

---

### Operazioni di Filtraggio

4. **Operazioni di Filtraggio e Ordinamento:** Le query possono includere clausole WHERE per filtrare i dati in base a condizioni specifiche e ORDER BY per ordinare i risultati in modo specifico.

---

#### Esempio di query con condizione di filtro e ordinamento:

   ```sql
   SELECT Nome, Voto
   FROM Esami
   WHERE Voto >= 18
   ORDER BY Voto DESC;
   ```

Questa query restituirebbe i nomi degli studenti e i loro voti negli esami con un voto maggiore o uguale a 18, ordinati in modo decrescente per voto.

---

### interagire con i dati

Le query SQL forniscono un potente strumento per interagire con i dati all'interno di un database, consentendo agli utenti di ottenere informazioni specifiche in modo flessibile e efficiente. Comprendere come costruire query efficaci è essenziale per sfruttare appieno le potenzialità di un sistema di gestione di database.

---
