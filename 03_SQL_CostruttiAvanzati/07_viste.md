# le "Viste" in un database relazionale

Una **vista** è un'istanza virtualizzata di una tabella, ottenuta attraverso una query SQL, che può essere utilizzata come se fosse una tabella fisica. Le viste forniscono un modo per **astrarre e semplificare la complessità delle query**, migliorando la gestione e la sicurezza dei dati.

---

### Definizione di Vista

1. **Definizione di Vista
   - Una vista è una tabella virtuale basata sui risultati di una query SQL. Non contiene fisicamente i dati, ma fornisce una visione organizzata e filtrata delle informazioni presenti nelle tabelle sottostanti.

---

### Creazione di Viste

2. **Creazione di Viste
   - Le viste possono essere create utilizzando il comando CREATE VIEW. La definizione della vista è una query SQL che specifica quali colonne e righe includere nella vista.

   ```sql
   CREATE VIEW VistaStudenti AS
   SELECT StudenteID, Nome, CorsoDiStudi
   FROM Studenti
   WHERE AnnoIscrizione = 2022;
   ```

   Questa vista seleziona solo gli studenti iscritti nell'anno 2022.

---

### Utilizzo di Viste

3. **Utilizzo di Viste
   - Una volta creata, una vista può essere utilizzata nelle query esattamente come una tabella fisica.

   ```sql
   SELECT * FROM VistaStudenti;
   ```

   Questa query restituisce tutti gli studenti iscritti nell'anno 2022 utilizzando la vista precedentemente creata.

---

### Aggiornamento di Viste

4. **Aggiornamento di Viste
   - Le viste possono essere aggiornate attraverso la modifica della query SQL alla base della vista. Le modifiche si rifletteranno automaticamente nelle query che utilizzano la vista.

   ```sql
   CREATE OR REPLACE VIEW VistaStudenti AS
   SELECT StudenteID, Nome, CorsoDiStudi
   FROM Studenti
   WHERE AnnoIscrizione = 2023;
   ```

   Questa modifica della vista cambia la condizione dell'anno di iscrizione da 2022 a 2023.

---

### Viste Aggregate

5. **Viste Aggregate
   - Le viste possono includere operazioni aggregate per semplificare ulteriormente le query complesse.

   ```sql
   CREATE VIEW VistaMediaVoti AS
   SELECT CorsoDiStudi, AVG(Voto) AS MediaVoti
   FROM Esami
   GROUP BY CorsoDiStudi;
   ```

   Questa vista calcola la media dei voti per ciascun corso di studi.

---

### Viste Join

6. **Viste Join
   - Le viste possono essere utilizzate per semplificare le operazioni di join, consentendo di combinare dati da più tabelle in una vista unificata.

   ```sql
   CREATE VIEW VistaStudentiCorsi AS
   SELECT Studenti.Nome, Corsi.Nome AS Corso
   FROM Studenti
   INNER JOIN Corsi ON Studenti.CorsoID = Corsi.CorsoID;
   ```

   Questa vista combina informazioni sugli studenti e i corsi attraverso una join.

---

### Sicurezza e Controllo

7. **Sicurezza e Controllo di Accesso
   - Le viste possono essere utilizzate per limitare l'accesso a determinate colonne o righe delle tabelle sottostanti, contribuendo così a una migliore sicurezza dei dati.

   ```sql
   CREATE VIEW VistaDatiSensibili AS
   SELECT Nome, Cognome, DataDiNascita
   FROM UtentiSensibili;
   ```

   Questa vista mostra solo colonne specifiche della tabella UtentiSensibili.

Le viste sono uno strumento potente per semplificare e organizzare l'accesso ai dati in un database relazionale. La loro corretta progettazione e utilizzo migliorano la manutenibilità e la sicurezza del sistema.

---

## Viste nei Database Relazionali

Parliamo ora delle "Viste nei Database Relazionali". Una vista è un insieme di risultati di query che viene trattato come una tabella virtuale all'interno di un database. Le viste consentono di semplificare e astrarre la complessità delle query, fornendo una visione strutturata dei dati.

---

### Definizione di Vista

1. **Definizione di Vista
   - Una vista è una rappresentazione virtuale di una tabella o di una combinazione di tabelle in un database. Non contiene fisicamente i dati, ma fornisce un modo per accedervi attraverso una query.

---

### Creazione di Viste

2. **Creazione di Viste
   - Le viste vengono create attraverso il linguaggio SQL, definendo una query che determina i dati visualizzati dalla vista.

   ```sql
   CREATE VIEW VistaStudenti AS
   SELECT StudenteID, Nome, Corso
   FROM Studenti
   WHERE Voto > 70;
   ```

   Questa query crea una vista chiamata "VistaStudenti" che mostra gli studenti con un voto superiore a 70.

---

### Utilizzo delle Viste

3. **Utilizzo delle Viste
   - Una volta creata una vista, può essere utilizzata nelle query esattamente come una tabella fisica.

   ```sql
   SELECT * FROM VistaStudenti;
   ```

   Questa query restituirà gli stessi risultati della vista "VistaStudenti" come se stessimo selezionando direttamente dalla tabella "Studenti".

---

### Aggiornamento delle Viste

4. **Aggiornamento delle Viste
   - In molte implementazioni di database, le viste possono essere utilizzate anche per eseguire operazioni di inserimento, aggiornamento o cancellazione di dati, a seconda delle regole definite per la vista.

   ```sql
   UPDATE VistaStudenti SET Corso = 'Ingegneria' WHERE StudenteID = 1;
   ```

   Questa query può aggiornare la colonna "Corso" nella vista "VistaStudenti" come se stessimo aggiornando la tabella sottostante "Studenti".

---

### Viste Complesse

5. **Viste Complesse
   - Le viste possono coinvolgere più tabelle e possono includere operazioni di unione, filtraggio, raggruppamento e altre complesse operazioni di query.

   ```sql
   CREATE VIEW VistaOrdiniCompleti AS
   SELECT O.OrdineID, O.Data, C.NomeCliente
   FROM Ordini O
   JOIN Clienti C ON O.ClienteID = C.ClienteID;
   ```

   Questa vista combina informazioni da due tabelle, Ordini e Clienti, mostrando l'ID dell'ordine, la data e il nome del cliente.

---

### Viste Materializzate

6. **Viste Materializzate
   - Alcune implementazioni di database supportano le viste materializzate, che sono viste fisiche che memorizzano i dati in modo permanente. Questo può migliorare le prestazioni, ma richiede una gestione aggiuntiva per mantenere la coerenza dei dati.

---

### Sicurezza e Autorizzazioni

7. **Sicurezza e Autorizzazioni
   - Le viste possono essere utilizzate per controllare l'accesso ai dati, consentendo agli utenti di vedere solo le informazioni rilevanti per le loro necessità. Le autorizzazioni sulla vista sono gestite come quelle su una tabella.

Le viste forniscono un meccanismo di astrazione dei dati che semplifica le query complesse e facilita la gestione dell'accesso ai dati. La corretta progettazione e utilizzo delle viste contribuiscono a una migliore organizzazione e comprensibilità del sistema di gestione di database.

---

Parliamo ora delle "Viste (Views)" nei database relazionali. Le viste sono una rappresentazione virtualmente organizzata dei dati presenti in una o più tabelle, che può essere utilizzata come una tabella regolare in una query.

---

### Definizione di Viste

1. **Definizione di Viste
   - Una vista è una tabella virtuale che non contiene effettivamente dati, ma fornisce una visione strutturata e organizzata dei dati presenti in una o più tabelle.
   - Le viste sono create attraverso query SQL e possono includere selezioni, join, e condizioni.

---

### Scopi delle Viste

2. **Scopi delle Viste
   - **Semplificazione delle Query:** Le viste consentono di semplificare le query complesse o frequenti, fornendo una visione strutturata dei dati.
   - **Controllo degli Accessi:** Le viste possono limitare l'accesso ai dati, mostrando solo le colonne o le righe specifiche necessarie per una particolare operazione.
   - **Astrazione dei Dati:** Le viste forniscono un'astrazione dei dati sottostanti, consentendo alle applicazioni di accedere ai dati senza dover conoscere la struttura interna delle tabelle.

---

### Creazione di Viste

3. **Creazione di Viste
   - Le viste sono create attraverso una query SQL, specificando le tabelle di base e le condizioni di selezione. Ecco un esempio:

   ```sql
   CREATE VIEW VistaStudenti AS
   SELECT StudentID, Nome, CorsoDiStudi
   FROM Studenti
   WHERE AnnoCorso = 2;
   ```

   Questa vista seleziona solo gli studenti del secondo anno dalla tabella Studenti.

---

### Utilizzo di Viste

4. **Utilizzo di Viste
   - Una volta creata una vista, può essere utilizzata nelle query come se fosse una tabella regolare. Ad esempio:

   ```sql
   SELECT * FROM VistaStudenti;
   ```

   Questa query restituirà tutti gli studenti del secondo anno come definito nella vista.

---

### Aggiornamento delle Viste

5. **Aggiornamento delle Viste
   - In molte implementazioni, le viste possono essere aggiornate attraverso query di inserimento, aggiornamento o cancellazione, purché rispettino le regole di aggiornabilità della vista.
   - Non tutte le viste sono aggiornabili, specialmente se coinvolgono operazioni complesse o aggregazioni.

---

### Viste Join

6. **Viste Join
   - Le viste possono coinvolgere più tabelle attraverso operazioni di join, consentendo la creazione di viste complesse.

   ```sql
   CREATE VIEW VistaOrdiniDettaglio AS
   SELECT Ordini.IDOrdine, DettaglioOrdine.Prodotto, DettaglioOrdine.Quantita
   FROM Ordini
   JOIN DettaglioOrdine ON Ordini.IDOrdine = DettaglioOrdine.IDOrdine;
   ```

   Questa vista unisce le informazioni sugli ordini e il dettaglio degli ordini in una singola vista.

---

### Viste Materializzate

7. **Viste Materializzate
   - Alcuni database supportano le "viste materializzate", che sono viste fisicamente memorizzate con i dati, consentendo prestazioni migliori ma richiedendo la gestione della sincronizzazione con le tabelle di base.

   ```sql
   CREATE MATERIALIZED VIEW MaterializedVistaStudenti AS
   SELECT * FROM Studenti WHERE AnnoCorso = 2;
   ```

   Questa vista materializzata contiene fisicamente i dati degli studenti del secondo anno.

Le viste offrono una flessibilità e una sicurezza notevoli nella manipolazione dei dati all'interno di un database relazionale. La loro corretta progettazione e utilizzo possono semplificare le query e migliorare la gestione dei dati.

---
