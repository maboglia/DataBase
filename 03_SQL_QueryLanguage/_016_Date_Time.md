# DATE, TIME, DATETIME

---

In SQL, i tipi di dati **`DATE`**, **`TIME`** e **`DATETIME`** sono utilizzati per rappresentare informazioni relative al tempo. Ecco una spiegazione dettagliata con esempi per ciascun tipo:

---

### **1. DATE**

- Rappresenta solo una data senza il tempo.
- Formato: **`YYYY-MM-DD`** (Anno-Mese-Giorno).

#### **Esempio:**

```sql
-- Creazione di una tabella con una colonna di tipo DATE
CREATE TABLE eventi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_evento VARCHAR(50),
    data_evento DATE
);

-- Inserimento di una data
INSERT INTO eventi (nome_evento, data_evento)
VALUES ('Conferenza Tecnologica', '2025-02-15');

-- Recupero dei dati
SELECT * FROM eventi;
```

**Output:**

| id  | nome_evento          | data_evento |
|-----|----------------------|-------------|
| 1   | Conferenza Tecnologica | 2025-02-15 |

---

### **2. TIME**

- Rappresenta solo l'ora senza la data.
- Formato: **`HH:MM:SS`** (Ore:Minuti:Secondi).

#### **Esempio:**

```sql
-- Creazione di una tabella con una colonna di tipo TIME
CREATE TABLE orari (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_attivita VARCHAR(50),
    ora_inizio TIME
);

-- Inserimento di un orario
INSERT INTO orari (nome_attivita, ora_inizio)
VALUES ('Allenamento', '18:30:00');

-- Recupero dei dati
SELECT * FROM orari;
```

**Output:**

| id  | nome_attivita  | ora_inizio |
|-----|----------------|------------|
| 1   | Allenamento    | 18:30:00   |

---

### **3. DATETIME**

- Combina una data e un orario.
- Formato: **`YYYY-MM-DD HH:MM:SS`** (Anno-Mese-Giorno Ore:Minuti:Secondi).

#### **Esempio:**

```sql
-- Creazione di una tabella con una colonna di tipo DATETIME
CREATE TABLE appuntamenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descrizione VARCHAR(50),
    data_ora DATETIME
);

-- Inserimento di una data e orario
INSERT INTO appuntamenti (descrizione, data_ora)
VALUES ('Riunione con il cliente', '2025-01-08 14:00:00');

-- Recupero dei dati
SELECT * FROM appuntamenti;
```

**Output:**

| id  | descrizione               | data_ora           |
|-----|---------------------------|--------------------|
| 1   | Riunione con il cliente   | 2025-01-08 14:00:00 |

---

### **4. Differenze principali**

| Tipo       | Contiene         | Formato                 | Esempio                 |
|------------|------------------|-------------------------|-------------------------|
| **DATE**   | Solo la data     | `YYYY-MM-DD`            | `2025-01-06`            |
| **TIME**   | Solo l'ora       | `HH:MM:SS`              | `13:45:30`              |
| **DATETIME** | Data e ora      | `YYYY-MM-DD HH:MM:SS`   | `2025-01-06 13:45:30`   |

---

### **Uso pratico**

- **`DATE`**: Utilizzato per eventi con una sola dimensione temporale come compleanni, scadenze, ecc.
- **`TIME`**: Usato per pianificazioni giornaliere come orari di apertura o chiusura.
- **`DATETIME`**: Usato per registrazioni dettagliate come timestamp di transazioni, log di sistema, ecc.

---

## Usa le funzioni

Le funzioni **`CURRENT_DATE`**, **`CURRENT_TIME`**, **`NOW`**, e altre simili in SQL sono utilizzate per generare valori basati sulla data e/o sull'orario corrente. Ecco una spiegazione con esempi per ciascuna funzione:

---

### **1. `CURRENT_DATE`**

- Restituisce la data corrente senza l'orario.
- Formato: **`YYYY-MM-DD`**

#### **Esempio:**

```sql
-- Inserisce la data corrente in una colonna di tipo DATE
INSERT INTO eventi (nome_evento, data_evento)
VALUES ('Evento Oggi', CURRENT_DATE);

-- Recupero dei dati
SELECT * FROM eventi;
```

**Output esempio:**

| id  | nome_evento  | data_evento |
|-----|--------------|-------------|
| 1   | Evento Oggi  | 2025-01-06  |

---

### **2. `CURRENT_TIME`**

- Restituisce l'orario corrente senza la data.
- Formato: **`HH:MM:SS`**

#### **Esempio:**

```sql
-- Inserisce l'orario corrente in una colonna di tipo TIME
INSERT INTO orari (nome_attivita, ora_inizio)
VALUES ('Attività in corso', CURRENT_TIME);

-- Recupero dei dati
SELECT * FROM orari;
```

**Output esempio:**

| id  | nome_attivita      | ora_inizio |
|-----|--------------------|------------|
| 1   | Attività in corso  | 14:45:10   |

---

### **3. `NOW`**

- Restituisce la data e l'orario corrente.
- Formato: **`YYYY-MM-DD HH:MM:SS`**

#### **Esempio:**

```sql
-- Inserisce la data e l'ora corrente in una colonna di tipo DATETIME
INSERT INTO appuntamenti (descrizione, data_ora)
VALUES ('Appuntamento immediato', NOW);

-- Recupero dei dati
SELECT * FROM appuntamenti;
```

**Output esempio:**

| id  | descrizione            | data_ora            |
|-----|------------------------|---------------------|
| 1   | Appuntamento immediato | 2025-01-06 14:45:10 |

---

### **4. `CURDATE` e `CURTIME`**

- Alias rispettivamente di **`CURRENT_DATE`** e **`CURRENT_TIME`**.

#### **Esempio con CURDATE e CURTIME:**

```sql
-- Inserisce data e ora in due colonne separate
INSERT INTO orari (nome_attivita, ora_inizio)
VALUES ('Nuova attività', CURTIME());

INSERT INTO eventi (nome_evento, data_evento)
VALUES ('Evento con CURDATE', CURDATE());
```

---

### **5. `SYSDATE`**

- Simile a **`NOW`**, ma calcola la data e l'ora al momento esatto dell'esecuzione, anche all'interno di una transazione.
  
#### **Esempio:**

```sql
-- Utilizzo di SYSDATE per registrare un timestamp
INSERT INTO appuntamenti (descrizione, data_ora)
VALUES ('Appuntamento con SYSDATE', SYSDATE());
```

---

### **6. Differenze principali**

| Funzione       | Restituisce           | Formato                 | Esempio Output         |
|----------------|-----------------------|-------------------------|------------------------|
| **`CURRENT_DATE`** | Solo la data         | `YYYY-MM-DD`            | `2025-01-06`           |
| **`CURRENT_TIME`** | Solo l'ora          | `HH:MM:SS`              | `14:45:10`             |
| **`NOW`**          | Data e ora          | `YYYY-MM-DD HH:MM:SS`   | `2025-01-06 14:45:10`  |
| **`CURDATE`**      | Solo la data        | `YYYY-MM-DD`            | `2025-01-06`           |
| **`CURTIME`**      | Solo l'ora          | `HH:MM:SS`              | `14:45:10`             |
| **`SYSDATE`**      | Data e ora precisa | `YYYY-MM-DD HH:MM:SS`   | `2025-01-06 14:45:10`  |

---

### **7. Uso pratico combinato**

Puoi combinare queste funzioni con altre query per scopi come il calcolo di differenze temporali, ordinamento, ecc.

#### **Esempio avanzato:**

```sql
-- Seleziona appuntamenti con una data maggiore di quella attuale
SELECT * 
FROM appuntamenti
WHERE data_ora > NOW();
```

