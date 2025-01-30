# Esercitazione Database Liceo

---

1. **Creare il database `liceo`.**

2. **Assegnare i privilegi all'utente `username` per questo nuovo database.**

3. **Nel database `liceo` creare 2 tabelle: `aule` e `alunni`:**
   - La tabella `aule` deve avere i seguenti attributi:
     - `nome`: nome dell’aula (obbligatorio).
     - `capienza`: numero massimo di studenti (obbligatorio).
     - `piano`: piano in cui si trova l’aula (obbligatorio).

   - La tabella `alunni` deve avere i seguenti attributi:
     - `cognome`: cognome dell’alunno (obbligatorio).
     - `nome`: nome dell’alunno (obbligatorio).
     - `genere`: genere dell’alunno.
     - `eta`: età dell’alunno.
     - `aula_id`: riferimento all’aula (chiave esterna).

4. **Inserire i record nella tabella `aule`:**
   - Le aule disponibili sono: 1A, 2A, 3A, 4A, 5A, 1B, 2B, 3B, 4B, 5B.
   - Ogni aula ha una capienza di 10 studenti.
   - I piani disponibili sono: 1° piano, 2° piano, seminterrato.

5. **Popolare la tabella `alunni` con 50 record:**
   - Copiare i dati dalla tabella `studenti` utilizzando l’istruzione `INSERT INTO ... SELECT`.
   - Aggiornare il campo `eta` con i seguenti valori:
     - 14 anni per i record con `id` da 1 a 10.
     - 15 anni per i record con `id` da 11 a 20.
     - 16 anni per i record con `id` da 21 a 30.
     - 17 anni per i record con `id` da 31 a 40.
     - 18 anni per i record con `id` da 41 a 50.

6. **Assegnare le aule agli alunni:**
   - Ogni aula deve avere 5 studenti della stessa età:
     - 5 studenti di 14 anni assegnati alla classe 1A.
     - 5 studenti di 15 anni assegnati alla classe 2A.
     - 5 studenti di 16 anni assegnati alla classe 3A.
     - 5 studenti di 17 anni assegnati alla classe 4A.
     - 5 studenti di 18 anni assegnati alla classe 5A.

7. **Dopo aver creato le tabelle e inserito i record, scrivere le query per:**
   - Selezionare il cognome, il nome, il genere e il piano aula di tutti gli studenti.
   - Selezionare il cognome, il nome, il genere e il piano aula degli studenti assegnati alle seguenti classi:
     - 1A
     - 2A
     - 3A
     - 4A
     - 5A

---

*Nota: Scrivere nel file SQL tutte le istruzioni necessarie per la creazione delle tabelle, l’inserimento dei record e le query di selezione.*

---

Ecco come riscrivere e strutturare l'esercitazione in SQL:

---

### **Creazione del database**

```sql
CREATE DATABASE liceo;
```

### **Assegnazione dei privilegi**

```sql
GRANT ALL PRIVILEGES ON liceo.* TO 'username'@'localhost';
```

---

### **Creazione delle tabelle**

#### **Tabella `aule`**

```sql
CREATE TABLE aule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(3) NOT NULL,
    capienza INT NOT NULL,
    piano VARCHAR(20) NOT NULL
);
```

#### **Tabella `alunni`**

```sql
CREATE TABLE alunni (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cognome VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    genere CHAR(1),
    eta INT,
    aula_id INT,
    FOREIGN KEY (aula_id) REFERENCES aule(id)
);
```

---

### **Inserimento dei record**

#### **Popolamento della tabella `aule`**

```sql
INSERT INTO aule (nome, capienza, piano)
VALUES
('1A', 10, '1° piano'),
('2A', 10, '2° piano'),
('3A', 10, 'seminterrato'),
('4A', 10, '1° piano'),
('5A', 10, '2° piano'),
('1B', 10, '1° piano'),
('2B', 10, '2° piano'),
('3B', 10, 'seminterrato'),
('4B', 10, '1° piano'),
('5B', 10, '2° piano');
```

#### **Popolamento della tabella `alunni`**

Supponiamo che esista una tabella chiamata `studenti` con i dati da copiare:

```sql
INSERT INTO alunni (cognome, nome, genere)
SELECT cognome, nome, genere FROM studenti LIMIT 50;
```

---

### **Aggiornamento delle età**

```sql
UPDATE alunni SET eta = 14 WHERE id BETWEEN 1 AND 10;
UPDATE alunni SET eta = 15 WHERE id BETWEEN 11 AND 20;
UPDATE alunni SET eta = 16 WHERE id BETWEEN 21 AND 30;
UPDATE alunni SET eta = 17 WHERE id BETWEEN 31 AND 40;
UPDATE alunni SET eta = 18 WHERE id BETWEEN 41 AND 50;
```

---

### **Assegnazione delle aule**

```sql
UPDATE alunni SET aula_id = (SELECT id FROM aule WHERE nome = '1A') WHERE eta = 14 LIMIT 5;
UPDATE alunni SET aula_id = (SELECT id FROM aule WHERE nome = '2A') WHERE eta = 15 LIMIT 5;
UPDATE alunni SET aula_id = (SELECT id FROM aule WHERE nome = '3A') WHERE eta = 16 LIMIT 5;
UPDATE alunni SET aula_id = (SELECT id FROM aule WHERE nome = '4A') WHERE eta = 17 LIMIT 5;
UPDATE alunni SET aula_id = (SELECT id FROM aule WHERE nome = '5A') WHERE eta = 18 LIMIT 5;
```

---

### **Query di selezione**

1. **Tutti gli studenti con il piano dell’aula:**

   ```sql
   SELECT alunni.cognome, alunni.nome, alunni.genere, aule.piano
   FROM alunni
   JOIN aule ON alunni.aula_id = aule.id;
   ```

2. **Studenti assegnati alla 1A:**

   ```sql
   SELECT alunni.cognome, alunni.nome, alunni.genere, aule.piano
   FROM alunni
   JOIN aule ON alunni.aula_id = aule.id
   WHERE aule.nome = '1A';
   ```

3. **Studenti assegnati alla 2A:**

   ```sql
   SELECT alunni.cognome, alunni.nome, alunni.genere, aule.piano
   FROM alunni
   JOIN aule ON alunni.aula_id = aule.id
   WHERE aule.nome = '2A';
   ```

4. **Studenti assegnati alla 3A:**

   ```sql
   SELECT alunni.cognome, alunni.nome, alunni.genere, aule.piano
   FROM alunni
   JOIN aule ON alunni.aula_id = aule.id
   WHERE aule.nome = '3A';
   ```

5. **Studenti assegnati alla 4A:**

   ```sql
   SELECT alunni.cognome, alunni.nome, alunni.genere, aule.piano
   FROM alunni
   JOIN aule ON alunni.aula_id = aule.id
   WHERE aule.nome = '4A';
   ```

6. **Studenti assegnati alla 5A:**

   ```sql
   SELECT alunni.cognome, alunni.nome, alunni.genere, aule.piano
   FROM alunni
   JOIN aule ON alunni.aula_id = aule.id
   WHERE aule.nome = '5A';
   ```

---

