---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Trigger

Un trigger è un tipo di procedura memorizzata che viene eseguita automaticamente in risposta a determinati eventi sulle tabelle o le viste del database.

---

```sql
CREATE TABLE test1(a1 INT);
CREATE TABLE test2(a2 INT);
CREATE TABLE test3(a3 INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
CREATE TABLE test4(
  a4 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  b4 INT DEFAULT 0
);

delimiter |

CREATE TRIGGER testref BEFORE INSERT ON test1
  FOR EACH ROW
  BEGIN
    INSERT INTO test2 SET a2 = NEW.a1;
    DELETE FROM test3 WHERE a3 = NEW.a1;
    UPDATE test4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
  END;
|

delimiter ;

INSERT INTO test3 (a3) VALUES
  (NULL), (NULL), (NULL), (NULL), (NULL),
  (NULL), (NULL), (NULL), (NULL), (NULL);

INSERT INTO test4 (a4) VALUES
  (0), (0), (0), (0), (0), (0), (0), (0), (0), (0);
```


```sql
mysql> INSERT INTO test1 VALUES 
       (1), (3), (1), (7), (1), (8), (4), (4);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0  
```

---

## Definizione di Trigger

- Un trigger è un insieme di istruzioni SQL che viene attivato automaticamente ("triggered") in risposta a specifici eventi del database, come l'inserimento, l'aggiornamento o la cancellazione di dati in una tabella.

---

## Eventi che Attivano Trigger

- I trigger possono essere attivati da diversi eventi, tra cui:
   - **BEFORE INSERT:** Prima dell'inserimento di un nuovo record.
   - **AFTER INSERT:** Dopo l'inserimento di un nuovo record.
   - **BEFORE UPDATE:** Prima dell'aggiornamento di un record esistente.
   - **AFTER UPDATE:** Dopo l'aggiornamento di un record esistente.
   - **BEFORE DELETE:** Prima della cancellazione di un record.
   - **AFTER DELETE:** Dopo la cancellazione di un record.

---

## Scopi dei Trigger

- **Validazione dei Dati:** I trigger possono essere utilizzati per applicare regole di validazione ai dati prima che vengano inseriti o aggiornati.
- **Audit e Registro:** I trigger possono essere utilizzati per registrare le modifiche apportate alle tabelle, fornendo un registro di audit.
- **Risposta a Eventi Specifici:** I trigger consentono di eseguire azioni specifiche in risposta a eventi definiti, come l'aggiornamento di un campo correlato in un'altra tabella.
- **Mantenimento della Coerenza:** I trigger possono essere utilizzati per garantire la coerenza dei dati tra tabelle correlate.

---

## Creazione di Trigger

- Ecco un esempio di creazione di un trigger in **SQL Server** che registra le modifiche apportate a una tabella degli ordini:

   ```sql
   CREATE TRIGGER Trig_AuditOrdini
   AFTER INSERT -- , UPDATE, DELETE
   ON Ordini FOR EACH ROW
   BEGIN
       INSERT INTO LogOrdini (Evento, DataEvento)
       VALUES ('Modifica agli ordini', GETDATE());
   END;
   ```

   Questo trigger registra un evento di inserimento, aggiornamento o cancellazione nella tabella degli ordini.

---

## Ecco la versione del **trigger `Trig_AuditOrdini` in MySQL**.  

---

### **Versione MySQL**

```sql
DELIMITER $$

CREATE TRIGGER Trig_AuditOrdini
AFTER INSERT OR UPDATE OR DELETE
ON Ordini
FOR EACH ROW
BEGIN
    INSERT INTO LogOrdini (Evento, DataEvento)
    VALUES ('Modifica agli ordini', NOW());
END $$

DELIMITER ;
```

---

### **Spiegazione**

1. **`DELIMITER $$`** → Cambia temporaneamente il delimitatore per gestire correttamente il `BEGIN...END`.
2. **`CREATE TRIGGER Trig_AuditOrdini`** → Definisce il trigger con il nome `Trig_AuditOrdini`.
3. **`AFTER INSERT OR UPDATE OR DELETE`** → Il trigger si attiva dopo un'**inserzione**, una **modifica** o una **cancellazione** sulla tabella `Ordini`.
4. **`ON Ordini`** → Il trigger è associato alla tabella `Ordini`.
5. **`FOR EACH ROW`** → Il trigger viene eseguito per ogni riga interessata dall'operazione.
6. **`INSERT INTO LogOrdini (Evento, DataEvento)`** → Registra l'evento nella tabella di log.
7. **`VALUES ('Modifica agli ordini', NOW());`** → Inserisce il messaggio "Modifica agli ordini" e la data e ora correnti (`NOW()`).
8. **`DELIMITER ;`** → Ripristina il delimitatore standard `;`.

---

### **Esempio di Tabella di Log**

Se la tabella **LogOrdini** non esiste, puoi crearla con:

```sql
CREATE TABLE LogOrdini (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Evento VARCHAR(255),
    DataEvento DATETIME
);
```

---

### **Test del Trigger**

Dopo aver creato il trigger, prova ad eseguire una delle seguenti operazioni per vedere l'effetto sul log:

```sql
INSERT INTO Ordini (id, cliente, totale) VALUES (1, 'Mario Rossi', 100.50);
UPDATE Ordini SET totale = 120.00 WHERE id = 1;
DELETE FROM Ordini WHERE id = 1;
```

Poi verifica il log:

```sql
SELECT * FROM LogOrdini;
```

🔹 *Ogni modifica agli ordini verrà registrata automaticamente in `LogOrdini`!* 

---

## Accesso ai Dati

- I trigger possono accedere ai dati interessati attraverso i riferimenti `INSERTED` e `DELETED`, che contengono le nuove e vecchie versioni delle righe coinvolte.

   ```sql
   CREATE TRIGGER Trig_AuditStudenti
   AFTER UPDATE
   ON Studenti
   BEGIN
       DECLARE 
         @NomeVecchio VARCHAR(50), 
         @NomeNuovo VARCHAR(50);

       SELECT @NomeVecchio = Nome FROM DELETED;
       SELECT @NomeNuovo = Nome FROM INSERTED;

       INSERT INTO LogModificheStudenti (NomeVecchio, NomeNuovo, DataModifica)
       VALUES (@NomeVecchio, @NomeNuovo, GETDATE());
   END;
   ```

   Questo trigger registra le modifiche al nome degli studenti nella tabella LogModificheStudenti.

---

## Ecco la versione corretta del **trigger `Trig_AuditStudenti` in MySQL**:

---

### **Versione MySQL**

```sql
DELIMITER $$

CREATE TRIGGER Trig_AuditStudenti
AFTER UPDATE
ON Studenti
FOR EACH ROW
BEGIN
    INSERT INTO LogModificheStudenti (NomeVecchio, NomeNuovo, DataModifica)
    VALUES (OLD.Nome, NEW.Nome, NOW());
END $$

DELIMITER ;
```

---

### **Spiegazione**

1. **`DELIMITER $$`** → Modifica temporaneamente il delimitatore per consentire `BEGIN...END`.
2. **`CREATE TRIGGER Trig_AuditStudenti`** → Crea un trigger chiamato `Trig_AuditStudenti`.
3. **`AFTER UPDATE`** → Il trigger si attiva **dopo** un'operazione di **UPDATE** sulla tabella `Studenti`.
4. **`ON Studenti`** → Il trigger è associato alla tabella `Studenti`.
5. **`FOR EACH ROW`** → Si attiva per **ogni riga** modificata.
6. **`INSERT INTO LogModificheStudenti (NomeVecchio, NomeNuovo, DataModifica)`** → Inserisce nel log il vecchio e il nuovo nome dello studente.
7. **`VALUES (OLD.Nome, NEW.Nome, NOW());`**  
   - `OLD.Nome`: il valore **prima** della modifica.  
   - `NEW.Nome`: il valore **dopo** la modifica.  
   - `NOW()`: registra la data e l'ora della modifica.
8. **`DELIMITER ;`** → Ripristina il delimitatore standard `;`.

---

### **Tabella di Log**

Se la tabella **LogModificheStudenti** non esiste, puoi crearla con:

```sql
CREATE TABLE LogModificheStudenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    NomeVecchio VARCHAR(50),
    NomeNuovo VARCHAR(50),
    DataModifica DATETIME
);
```

---

### **Test del Trigger**

1. **Inseriamo uno studente di prova:**

   ```sql
   INSERT INTO Studenti (id, Nome) VALUES (1, 'Marco');
   ```

2. **Aggiorniamo il nome dello studente:**

   ```sql
   UPDATE Studenti SET Nome = 'Luca' WHERE id = 1;
   ```

3. **Verifichiamo il log:**

   ```sql
   SELECT * FROM LogModificheStudenti;
   ```

🔹 *Ora ogni modifica al nome degli studenti sarà registrata automaticamente nel log!*

---

## Gestione degli Errori nei Trigger

- È importante gestire gli errori nei trigger per evitare comportamenti indesiderati nel database. Questo può essere fatto utilizzando blocchi TRY...CATCH o altre tecniche specifiche del DBMS.

---

## Disabilitazione e Eliminazione dei Trigger

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
