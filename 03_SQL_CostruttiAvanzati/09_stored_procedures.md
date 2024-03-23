# Procedure Memorizzate

Parliamo ora delle "Procedure Memorizzate" in un database. Le procedure memorizzate sono un tipo di oggetto di database che contengono una o più istruzioni SQL e possono essere eseguite da un'applicazione o da altri oggetti del database.

---

### Definizione di Procedure

1. **Definizione di Procedure Memorizzate
   - Una procedura memorizzata è una raccolta di istruzioni SQL predefinite e precompilate che possono essere eseguite su richiesta.
   - Le procedure memorizzate vengono create e memorizzate nel database, rendendo più efficiente l'esecuzione di operazioni complesse o frequenti.

---

### Vantaggi delle Procedure

2. **Vantaggi delle Procedure Memorizzate
   - **Riutilizzo del Codice:** Le procedure memorizzate consentono di riutilizzare il codice SQL, evitando la duplicazione delle istruzioni in più parti dell'applicazione.
   - **Miglioramento delle Prestazioni:** Poiché le procedure sono precompilate, possono migliorare le prestazioni rispetto all'esecuzione di singole istruzioni SQL.
   - **Sicurezza:** L'accesso alle procedure memorizzate può essere controllato attraverso autorizzazioni, fornendo un livello di sicurezza.
   - **Manutenibilità:** Le procedure memorizzate possono essere modificate centralmente nel database, semplificando la manutenzione del codice.

---

### Creazione di Procedure

3. **Creazione di Procedure Memorizzate
   - Le procedure memorizzate vengono create attraverso il linguaggio SQL. Un esempio di creazione di una procedura memorizzata in MySQL potrebbe apparire così:

   ```sql
   DELIMITER //

   CREATE PROCEDURE GetStudentInfo(IN student_id INT)
   BEGIN
       SELECT * FROM Students WHERE StudentID = student_id;
   END //

   DELIMITER ;
   ```

   Questa procedura memorizzata restituisce le informazioni di uno studente dato il suo ID come parametro.

---

### Parametri delle Procedure

4. **Parametri delle Procedure
   - Le procedure memorizzate possono accettare parametri che fungono da input o output durante l'esecuzione.
   - I parametri consentono alle procedure di essere flessibili e di lavorare con dati dinamici.

   ```sql
   CREATE PROCEDURE UpdateStudentGrade(IN student_id INT, IN new_grade INT)
   BEGIN
       UPDATE Students SET Grade = new_grade WHERE StudentID = student_id;
   END;
   ```

   Questa procedura memorizzata accetta l'ID dello studente e una nuova valutazione come parametri e aggiorna il record corrispondente nella tabella degli studenti.

---

### Esecuzione di Procedure

5. **Esecuzione di Procedure Memorizzate
   - Le procedure memorizzate possono essere eseguite attraverso un'applicazione o attraverso strumenti di gestione del database. L'esecuzione di una procedura può restituire risultati o modificare i dati nel database.

   ```sql
   CALL GetStudentInfo(1);
   ```

   Questa chiamata eseguirà la procedura `GetStudentInfo` per ottenere le informazioni dello studente con ID 1.

---

### Drop di Procedure

6. **Drop di Procedure Memorizzate
   - Le procedure memorizzate possono essere eliminate dal database quando non sono più necessarie. L'eliminazione può essere eseguita con il comando `DROP PROCEDURE`.

   ```sql
   DROP PROCEDURE IF EXISTS GetStudentInfo;
   ```

   Questo comando elimina la procedura `GetStudentInfo` se esiste.

Le procedure memorizzate sono uno strumento potente per la gestione e l'esecuzione di operazioni complesse all'interno di un database. La loro creazione e gestione richiedono una buona comprensione del linguaggio SQL e delle esigenze specifiche dell'applicazione.

---
---

## Stored Procedures

---

Parliamo ora degli "Stored Procedures di Sistema". Le Stored Procedures di Sistema sono procedure predefinite fornite dal sistema di gestione del database (DBMS) che eseguono funzioni specifiche o forniscono informazioni sullo stato del database.

---

### Definizione di Stored

1. **Definizione di Stored Procedures di Sistema
   - Le Stored Procedures di Sistema sono un insieme di procedure predefinite fornite dal DBMS per eseguire operazioni specifiche o fornire informazioni sul sistema.

---

### Scopi delle Stored

2. **Scopi delle Stored Procedures di Sistema
   - **Gestione del Sistema:** Le Stored Procedures di Sistema possono essere utilizzate per gestire aspetti specifici del sistema di database, come la creazione o la modifica di tabelle, gli indici, gli utenti, ecc.
   - **Monitoraggio del Database:** Alcune Stored Procedures di Sistema possono fornire informazioni dettagliate sullo stato del database, come statistiche di utilizzo, spazio su disco, prestazioni, ecc.
   - **Manutenzione:** Le Stored Procedures di Sistema possono eseguire operazioni di manutenzione periodiche, come la ricompilazione degli indici o la pulizia dei log.

---

### Esempi di Stored

3. **Esempi di Stored Procedures di Sistema
   - Gli esempi di Stored Procedures di Sistema possono variare a seconda del DBMS utilizzato. Di seguito, alcuni esempi generici:

   ```sql
   -- Esempio: Creazione di una Stored Procedure di Sistema (SQL Server)
   EXEC sp_helpdb; -- Restituisce informazioni dettagliate sul database

   -- Esempio: Ricompilazione degli indici (PostgreSQL)
   CALL pgstatindex('my_table');

   -- Esempio: Creazione di una nuova tabella (MySQL)
   CALL mysql.create_table('new_table', 'id INT, name VARCHAR(50)');
   ```

---

### Accesso alle Stored

4. **Accesso alle Stored Procedures di Sistema
   - Le Stored Procedures di Sistema sono di solito accessibili agli amministratori del database o agli utenti con privilegi speciali. L'accesso può variare a seconda del DBMS specifico.

---

### Personalizzazione delle Stored

5. **Personalizzazione delle Stored Procedures di Sistema
   - In alcuni casi, le Stored Procedures di Sistema possono essere personalizzate o estese per adattarsi alle esigenze specifiche dell'ambiente di database. Questo può essere fatto in DBMS che supportano la personalizzazione delle Stored Procedures di Sistema.

---

### Monitoraggio e Diagnostica

6. **Monitoraggio e Diagnostica
   - Le Stored Procedures di Sistema spesso forniscono strumenti per monitorare le prestazioni del database e diagnosticare eventuali problemi. Possono essere utilizzate per raccogliere informazioni su query lente, blocchi, errori di sistema, ecc.

---

### Esempio di Stored

7. **Esempio di Stored Procedure di Monitoraggio (SQL Server)

   ```sql
   -- Esempio di esecuzione di una Stored Procedure di Monitoraggio
   EXEC sp_who; -- Restituisce informazioni sugli utenti connessi al database
   ```

---

### Documentazione delle Stored

8. **Documentazione delle Stored Procedures di Sistema
   - La documentazione del DBMS fornirà dettagli su tutte le Stored Procedures di Sistema disponibili, le loro funzioni e come utilizzarle. È importante fare riferimento alla documentazione specifica del DBMS utilizzato.

Le Stored Procedures di Sistema sono un componente fondamentale del sistema di gestione del database, offrendo funzionalità predefinite e informazioni utili per la gestione, il monitoraggio e la manutenzione del database. La loro conoscenza è essenziale per gli amministratori del database e gli sviluppatori che lavorano con un sistema di gestione del database.
