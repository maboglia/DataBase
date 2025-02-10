# 🔹 Asserzioni, Viste e Trigger in SQL 🔹  

## 🛠️ **Asserzioni**

Le **asserzioni** sono vincoli di integrità che non appartengono a una singola tabella, ma all’intero schema del database. Sono introdotte in **SQL-2** e permettono di esprimere:  
✔️ Vincoli di tupla  
✔️ Vincoli di tabella  
✔️ Vincoli tra più tabelle  
✔️ Vincoli su cardinalità minime  

### 📌 **Sintassi**

```sql
CREATE ASSERTION NomeAsserzione CHECK (condizione);
```

🔹 **Vincoli immediati** → verificati subito dopo ogni modifica della base di dati (es. `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, `FOREIGN KEY`). Se non soddisfatti → **rollback parziale**.  
🔹 **Vincoli differiti** → verificati al termine della transazione. Se non soddisfatti → **rollback totale**.  

```sql
SET CONSTRAINT NomeVincolo IMMEDIATE | DEFERRED;
```

---

## 🏛️ **Esempi di Vincoli**  

### 🔹 **Vincolo a livello di TUPLA**

Richiesta: il personale speciale può essere solo **babysitter, clown, marionette, mimo**.  

```sql
CREATE TABLE personale_speciale (
  CF CHAR(16) PRIMARY KEY,
  nome VARCHAR(20) NOT NULL,
  tipo VARCHAR(11) NOT NULL CHECK (tipo IN ('babysitter', 'clown', 'marionette', 'mimo'))
);
```

### 🔹 **Vincolo a livello di TABELLA**

Richiesta: ogni **dipartimento** può avere al massimo **5 professori associati**.  

```sql
CREATE TABLE dipartimento (
  Codice CHAR(10) PRIMARY KEY,
  nome VARCHAR(20) NOT NULL,
  indirizzo VARCHAR(100) NOT NULL,
  CHECK (5 >= (SELECT COUNT(*) 
               FROM Impiegato I 
               WHERE I.dipartimento = codice AND I.ruolo = 'Prof. associato'))
);
```

### 🔹 **Vincolo a livello di SCHEMA**

Richiesta: la quantità di un ordine non può superare quella disponibile in magazzino.  

```sql
CREATE ASSERTION gestioneQta CHECK (
  NOT EXISTS (SELECT * 
              FROM Prodotto P 
              WHERE qtDisp < (SELECT SUM(qt) FROM Ordine WHERE codProd = P.codProd))
);
```

---

## 👁️ **Viste in SQL**

Le **viste** sono tabelle virtuali che derivano da altre tabelle o viste. Non contengono dati fisici, ma sono definite da query SQL.  
**Utilizzi principali:**  
✔️ Offrire viste diverse degli stessi dati  
✔️ Semplificare interrogazioni complesse  
✔️ Rendere alcune interrogazioni possibili  

### 📌 **Sintassi**

```sql
CREATE VIEW NomeVista [(Lista di Attributi)] AS
SELECT SQL
[WITH [CASCADED | LOCAL] CHECK OPTION];
```

---

## 🔄 **Viste Aggiornabili**

✔️ Se la vista è basata su una sola tabella senza **funzioni aggregate**, può essere modificata.  
✔️ L’opzione `WITH CHECK OPTION` assicura che gli **update** rispettino i vincoli della vista.  
✔️ Se la vista si basa su un’altra vista, si può specificare se il controllo deve essere **locale** o **propagarsi (cascaded)**.  

📌 **Requisiti per una vista aggiornabile**:  
❌ **Niente `DISTINCT` o funzioni aggregate**  
❌ **Niente `GROUP BY`, `HAVING` o subquery nel `WHERE`**  
✅ **Basata su una singola tabella**  

🔹 **Esempio** (Vista senza `WITH CHECK OPTION`):  

```sql
CREATE VIEW Supervisori AS
SELECT * FROM Impiegato WHERE tipo = 'supervisore';
```

🔹 **Effetto di un update**:  

```sql
UPDATE Supervisori SET tipo = 'direttore';
```

👉 La vista si svuota perché la riga non rispetta più la condizione!  

🔹 **Soluzione**: usare `WITH CHECK OPTION`  

```sql
CREATE VIEW Supervisori AS
SELECT * FROM Impiegato WHERE tipo = 'supervisore'
WITH CHECK OPTION;
```

🔹 **Risultato**: L’update fallisce perché la modifica violerebbe il vincolo della vista.

---

## 🗑️ **Cancellazione di Viste e Asserzioni**

```sql
DROP VIEW NomeVista [RESTRICT | CASCADE];
DROP ASSERTION NomeAsserzione [RESTRICT | CASCADE];
```

🔹 `RESTRICT` → elimina solo se non è referenziata.  
🔹 `CASCADE` → elimina anche oggetti dipendenti.  

---

## ⚡ **Trigger in SQL**

Una **base di dati attiva** è in grado di reagire autonomamente agli eventi grazie ai **trigger**, che seguono il modello **ECA (Evento - Condizione - Azione)**.

### 📌 **Sintassi Generale**

```sql
CREATE TRIGGER NomeTrigger
[AFTER | BEFORE] evento {, evento}
ON TabellaTarget
[REFERENCING referenza]
[FOR EACH ROW | FOR EACH STATEMENT]
[WHEN (condizione)]
BEGIN
  StatementSQL;
END;
```

**🔹 Modalità di Attivazione**  
✔️ `AFTER` → si attiva dopo l’evento (**più comune**)  
✔️ `BEFORE` → si attiva prima dell’evento  
✔️ `DEFERRED` → si attiva alla fine della transazione  

---

## 🏢 **Esempi di Trigger**

### 🔹 **Regola Aziendale**  

📌 **Ridurre gli stipendi del 10% se la media supera i 5000€**  

```sql
CREATE TRIGGER ControlloStipendio
AFTER INSERT, DELETE, UPDATE
ON Impiegato
FOR EACH STATEMENT
BEGIN
  UPDATE Impiegato
  SET stipendio = stipendio * 0.9
  WHERE 5000 < (SELECT AVG(stipendio) FROM Impiegato);
END;
```

---

### 🔹 **Integrità Referenziale**  

📌 **Se un dipartimento viene cancellato, gli impiegati non devono rimanere orfani** → impostare `NULL` nel campo `dipartimento`.  

```sql
CREATE TRIGGER CancellaDipart
AFTER DELETE
ON Dipartimento
FOR EACH ROW
WHEN (EXISTS (SELECT * FROM Impiegato WHERE dipartimento = OLD.codDip))
BEGIN
  UPDATE Impiegato
  SET dipartimento = NULL
  WHERE dipartimento = OLD.codDip;
END;
```

---

## 🔥 **Trigger: Granularità**

✔️ `FOR EACH ROW` → Attivato per ogni riga coinvolta  
✔️ `FOR EACH STATEMENT` → Attivato una sola volta per l’intera operazione  

📌 **Accesso ai valori pre/post evento**  
✔️ `NEW` → Nuovo valore della tupla (`INSERT`, `UPDATE`)  
✔️ `OLD` → Vecchio valore della tupla (`DELETE`, `UPDATE`)  

```sql
REFERENCING NEW AS NuovaVar, OLD AS VecchiaVar
```

---

## ✅ **Conclusione**

Le **asserzioni, viste e trigger** sono strumenti essenziali in SQL per:  
🔹 Mantenere l’integrità dei dati  
🔹 Definire regole di business  
🔹 Automatizzare operazioni  

---

## Esempio database

Ecco una tabella con dati fittizi per testare asserzioni, viste e trigger.  

---

### **Creazione delle Tabelle**

```sql
CREATE TABLE Dipartimento (
    codDip CHAR(10) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sede VARCHAR(50) NOT NULL,
    num_dip INT NOT NULL CHECK(num_dip >= 1),
    tel VARCHAR(15) NOT NULL
);

CREATE TABLE Impiegato (
    codice CHAR(10) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    stipendio DECIMAL(10,2) NOT NULL CHECK(stipendio >= 1000),
    dipartimento CHAR(10),
    FOREIGN KEY (dipartimento) REFERENCES Dipartimento(codDip) ON DELETE SET NULL
);
```

---

### **Inserimento Dati Fittizi**

```sql
INSERT INTO Dipartimento VALUES 
('D001', 'Informatica', 'Milano', 3, '024567890'),
('D002', 'Elettronica', 'Roma', 4, '065432109'),
('D003', 'Meccanica', 'Torino', 2, '011876543');

INSERT INTO Impiegato VALUES
('I001', 'Mario', 'Rossi', 4500, 'D001'),
('I002', 'Luigi', 'Verdi', 5200, 'D001'),
('I003', 'Anna', 'Bianchi', 6000, 'D002'),
('I004', 'Carlo', 'Neri', 4700, 'D003'),
('I005', 'Elena', 'Gialli', 3100, 'D002');
```

---

### **Asserzione: Controllo sulla Media degli Stipendi**

L’asserzione verifica che la media degli stipendi non superi i 5000 euro.

```sql
CREATE ASSERTION MediaStipendi
CHECK (
    (SELECT AVG(stipendio) FROM Impiegato) <= 5000
);
```

---

### **Vista: Impiegati con Stipendio Superiore a 4000**

```sql
CREATE VIEW Impiegati_Alti_Stipendi AS
SELECT codice, nome, cognome, stipendio
FROM Impiegato
WHERE stipendio > 4000;
```

---

### **Vista Aggiornabile con CHECK OPTION**

```sql
CREATE VIEW Impiegati_Informatica AS
SELECT codice, nome, cognome, stipendio, dipartimento
FROM Impiegato
WHERE dipartimento = 'D001'
WITH CHECK OPTION;
```

---

### **Trigger: Riduzione Stipendio se la Media Supera 5000**

```sql
CREATE TRIGGER ControlloStipendio
AFTER INSERT OR UPDATE OR DELETE
ON Impiegato
FOR EACH STATEMENT
BEGIN
    UPDATE Impiegato
    SET stipendio = stipendio * 0.9
    WHERE 5000 < (SELECT AVG(stipendio) FROM Impiegato);
END;
```

---

### **Trigger: Gestione Cancellazione Dipartimento**

```sql
CREATE TRIGGER CancellaDipart
AFTER DELETE
ON Dipartimento
FOR EACH ROW
WHEN (EXISTS (SELECT * FROM Impiegato WHERE dipartimento = OLD.codDip))
BEGIN
    UPDATE Impiegato
    SET dipartimento = NULL
    WHERE dipartimento = OLD.codDip;
END;
```

### **Spiegazione del codice SQL**

#### **1. Asserzione: Controllo sulla Media degli Stipendi**

```sql
CREATE ASSERTION MediaStipendi
CHECK (
    (SELECT AVG(stipendio) FROM Impiegato) <= 5000
);
```

✅ **Cosa fa?**  
Questa asserzione (`ASSERTION`) impone un vincolo sull'intera tabella `Impiegato`: la media degli stipendi non deve superare i 5000 euro.

❌ **Problema:**  
Le asserzioni non sono supportate nella maggior parte dei database SQL moderni (inclusi MySQL e PostgreSQL). In alternativa, si possono usare trigger per applicare questo controllo.

---

#### **2. Vista: Impiegati con Stipendio Superiore a 4000**

```sql
CREATE VIEW Impiegati_Alti_Stipendi AS
SELECT codice, nome, cognome, stipendio
FROM Impiegato
WHERE stipendio > 4000;
```

✅ **Cosa fa?**  
Crea una vista (`VIEW`) chiamata `Impiegati_Alti_Stipendi`, che contiene solo gli impiegati con stipendio superiore a 4000. Una vista è una tabella virtuale che consente di interrogare facilmente i dati filtrati senza modificarli nella tabella originale.

---

#### **3. Vista Aggiornabile con CHECK OPTION**

```sql
CREATE VIEW Impiegati_Informatica AS
SELECT codice, nome, cognome, stipendio, dipartimento
FROM Impiegato
WHERE dipartimento = 'D001'
WITH CHECK OPTION;
```

✅ **Cosa fa?**  

- Crea una vista `Impiegati_Informatica` con i soli impiegati del dipartimento `D001` (es. Informatica).
- Il `WITH CHECK OPTION` impedisce di **inserire o aggiornare** dati che non rispettano la condizione `WHERE dipartimento = 'D001'`.  
  🔹 **Esempio:**  
  - ✅ `UPDATE Impiegato SET stipendio = 4500 WHERE dipartimento = 'D001'` → Permesso  
  - ❌ `UPDATE Impiegato SET dipartimento = 'D002' WHERE codice = 10` → Negato, perché violerebbe il filtro della vista.

---

#### **4. Trigger: Riduzione Stipendio se la Media Supera 5000**

```sql
CREATE TRIGGER ControlloStipendio
AFTER INSERT OR UPDATE OR DELETE
ON Impiegato
FOR EACH STATEMENT
BEGIN
    UPDATE Impiegato
    SET stipendio = stipendio * 0.9
    WHERE 5000 < (SELECT AVG(stipendio) FROM Impiegato);
END;
```

✅ **Cosa fa?**  

- Questo trigger si attiva **dopo** ogni inserimento, modifica o cancellazione di un impiegato.  
- Se la **media degli stipendi supera i 5000**, riduce automaticamente tutti gli stipendi del **10%** (`stipendio * 0.9`).

⚠ **Problema:**  

- Questo trigger **può ridurre ripetutamente** gli stipendi finché la media non rientra nel limite, il che potrebbe portare a stipendi eccessivamente bassi.

---

#### **5. Trigger: Gestione Cancellazione Dipartimento**

```sql
CREATE TRIGGER CancellaDipart
AFTER DELETE
ON Dipartimento
FOR EACH ROW
WHEN (EXISTS (SELECT * FROM Impiegato WHERE dipartimento = OLD.codDip))
BEGIN
    UPDATE Impiegato
    SET dipartimento = NULL
    WHERE dipartimento = OLD.codDip;
END;
```

✅ **Cosa fa?**  

- Quando un dipartimento viene cancellato (`DELETE` su `Dipartimento`), il trigger verifica se esistono impiegati associati a quel dipartimento.  
- Se esistono, imposta `NULL` nel campo `dipartimento` degli impiegati, evitando errori di riferimento.

🔹 **Esempio:**  

- Se il dipartimento `D003` viene eliminato, tutti gli impiegati che lavoravano in `D003` avranno `dipartimento = NULL`.

⚠ **Problema:**  

- Se il database ha vincoli di **integrità referenziale (FOREIGN KEY con ON DELETE CASCADE)**, questa logica potrebbe essere superflua.

---

### **Conclusione**

✅ Questo codice SQL copre vari aspetti di gestione dei dati:

- **Vincoli di integrità** (`ASSERTION`, `CHECK OPTION`).
- **Query predefinite** per consultare dati filtrati (`VIEW`).
- **Automazione delle modifiche** con trigger (`AFTER INSERT/UPDATE/DELETE`).

