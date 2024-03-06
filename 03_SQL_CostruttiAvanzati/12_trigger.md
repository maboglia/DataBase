---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Trigger

---

Parliamo ora dei "Trigger" nei database relazionali. Un trigger è un tipo di procedura memorizzata che viene eseguita automaticamente in risposta a determinati eventi sulle tabelle o le viste del database.

---

### Definizione di Trigger

1. **Definizione di Trigger
   - Un trigger è un insieme di istruzioni SQL che viene attivato automaticamente ("triggered") in risposta a specifici eventi del database, come l'inserimento, l'aggiornamento o la cancellazione di dati in una tabella.

---

### Eventi che Attivano

2. **Eventi che Attivano Trigger
   - I trigger possono essere attivati da diversi eventi, tra cui:
      - **BEFORE INSERT:** Prima dell'inserimento di un nuovo record.
      - **AFTER INSERT:** Dopo l'inserimento di un nuovo record.
      - **BEFORE UPDATE:** Prima dell'aggiornamento di un record esistente.
      - **AFTER UPDATE:** Dopo l'aggiornamento di un record esistente.
      - **BEFORE DELETE:** Prima della cancellazione di un record.
      - **AFTER DELETE:** Dopo la cancellazione di un record.

---

### Scopi dei Trigger

3. **Scopi dei Trigger
   - **Validazione dei Dati:** I trigger possono essere utilizzati per applicare regole di validazione ai dati prima che vengano inseriti o aggiornati.
   - **Audit e Registro:** I trigger possono essere utilizzati per registrare le modifiche apportate alle tabelle, fornendo un registro di audit.
   - **Risposta a Eventi Specifici:** I trigger consentono di eseguire azioni specifiche in risposta a eventi definiti, come l'aggiornamento di un campo correlato in un'altra tabella.
   - **Mantenimento della Coerenza:** I trigger possono essere utilizzati per garantire la coerenza dei dati tra tabelle correlate.

---

### Creazione di Trigger

4. **Creazione di Trigger
   - Ecco un esempio di creazione di un trigger in SQL Server che registra le modifiche apportate a una tabella degli ordini:

   ```sql
   CREATE TRIGGER Trig_AuditOrdini
   ON Ordini
   AFTER INSERT, UPDATE, DELETE
   AS
   BEGIN
       INSERT INTO LogOrdini (Evento, DataEvento)
       VALUES ('Modifica agli ordini', GETDATE());
   END;
   ```

   Questo trigger registra un evento di inserimento, aggiornamento o cancellazione nella tabella degli ordini.

---

### Accesso ai Dati

5. **Accesso ai Dati Trigger
   - I trigger possono accedere ai dati interessati attraverso i riferimenti `INSERTED` e `DELETED`, che contengono le nuove e vecchie versioni delle righe coinvolte.

   ```sql
   CREATE TRIGGER Trig_AuditStudenti
   ON Studenti
   AFTER UPDATE
   AS
   BEGIN
       DECLARE @NomeVecchio VARCHAR(50), @NomeNuovo VARCHAR(50);

       SELECT @NomeVecchio = Nome FROM DELETED;
       SELECT @NomeNuovo = Nome FROM INSERTED;

       INSERT INTO LogModificheStudenti (NomeVecchio, NomeNuovo, DataModifica)
       VALUES (@NomeVecchio, @NomeNuovo, GETDATE());
   END;
   ```

   Questo trigger registra le modifiche al nome degli studenti nella tabella LogModificheStudenti.

---

### Gestione degli Errori

6. **Gestione degli Errori nei Trigger
   - È importante gestire gli errori nei trigger per evitare comportamenti indesiderati nel database. Questo può essere fatto utilizzando blocchi TRY...CATCH o altre tecniche specifiche del DBMS.

---

### Disabilitazione e Eliminazione

7. **Disabilitazione e Eliminazione dei Trigger
   - I trigger possono essere temporaneamente disabilitati o eliminati se necessario. La disabilitazione può essere utile durante l'importazione di grandi quantità di dati o durante operazioni di manutenzione.

   ```sql
   -- Disabilita un trigger
   DISABLE TRIGGER Trig_AuditOrdini ON Ordini;

   -- Abilita un trigger
   ENABLE TRIGGER Trig_AuditOrdini ON Ordini;

   -- Elimina un trigger
   DROP TRIGGER IF EXISTS Trig_AuditOrdini;
   ```

I trigger sono potenti strumenti che consentono di automatizzare azioni specifiche in risposta a eventi nel database. La loro corretta progettazione e gestione sono fondamentali per garantire la coerenza e l'integrità dei dati.
