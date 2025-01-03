# Query Language - interrogazione dei dati

Il linguaggio SQL (Structured Query Language) è uno dei linguaggi di accesso ai dati più ampiamente utilizzati ed è spesso utilizzato sia per DDL che per DML in sistemi di gestione delle basi di dati relazionali. SQL fornisce una sintassi standardizzata e potente per definire, manipolare e interrogare dati nei database.

---

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
