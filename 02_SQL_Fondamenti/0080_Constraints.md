# Constraints

I **constraints** (vincoli) in SQL sono regole definite per garantire l'integrità dei dati in una tabella. Aiutano a mantenere la coerenza e la correttezza dei dati durante le operazioni di inserimento, aggiornamento o eliminazione. Ecco i principali vincoli con spiegazioni ed esempi:

---

### **1. PRIMARY KEY**

- **Scopo:** Identifica in modo univoco ogni record in una tabella.
- **Proprietà:**
  - Deve essere unico per ogni riga.
  - Non può contenere valori NULL.
- **Uso:** Solitamente definito su una o più colonne.

#### **Esempio:**

```sql
CREATE TABLE studenti (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50)
);
```

---

### **2. FOREIGN KEY**

- **Scopo:** Stabilisce una relazione tra due tabelle.
- **Proprietà:**
  - Assicura che il valore in una colonna corrisponda a un valore esistente in un'altra tabella.
  - Previene inserimenti o eliminazioni che violano la relazione.

#### **Esempio:**

```sql
CREATE TABLE corsi (
    corso_id INT PRIMARY KEY,
    nome_corso VARCHAR(100)
);

CREATE TABLE iscrizioni (
    iscrizione_id INT PRIMARY KEY,
    studente_id INT,
    corso_id INT,
    FOREIGN KEY (corso_id) REFERENCES corsi(corso_id)
);
```

---

### **3. UNIQUE**

- **Scopo:** Garantisce che tutti i valori di una colonna o di un gruppo di colonne siano univoci.
- **Proprietà:** Permette un solo valore NULL (se applicabile).

#### **Esempio:**

```sql
CREATE TABLE utenti (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```

---

### **4. NOT NULL**

- **Scopo:** Impedisce che una colonna contenga valori NULL.
- **Proprietà:** Garantisce che ogni riga abbia un valore valido per quella colonna.

#### **Esempio:**

```sql
CREATE TABLE prodotti (
    prodotto_id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    prezzo DECIMAL(10, 2) NOT NULL
);
```

---

### **5. CHECK**

- **Scopo:** Definisce una condizione che deve essere vera per ogni valore inserito nella colonna.
- **Proprietà:** Può essere utilizzato per vincolare i valori all'interno di un range o un pattern.

#### **Esempio:**

```sql
CREATE TABLE dipendenti (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    eta INT CHECK (eta >= 18 AND eta <= 65)
);
```

---

### **6. DEFAULT**

- **Scopo:** Specifica un valore predefinito per una colonna se non viene fornito un valore esplicito.
- **Proprietà:** Aggiunge automaticamente il valore predefinito durante l'inserimento.

#### **Esempio:**

```sql
CREATE TABLE ordini (
    ordine_id INT PRIMARY KEY,
    stato VARCHAR(20) DEFAULT 'In elaborazione'
);
```

---

### **7. AUTO_INCREMENT**

- **Scopo:** Genera automaticamente un valore univoco per una colonna (di solito una chiave primaria).
- **Proprietà:** Aumenta il valore di un numero intero per ogni nuovo record.

#### **Esempio:**

```sql
CREATE TABLE clienti (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);
```

---

### **Riepilogo**

| Vincolo       | Scopo                                          |
|---------------|-----------------------------------------------|
| **PRIMARY KEY** | Identifica univocamente ogni record in una tabella. |
| **FOREIGN KEY** | Stabilisce relazioni tra tabelle.             |
| **UNIQUE**      | Garantisce valori univoci.                   |
| **NOT NULL**    | Impedisce valori NULL.                       |
| **CHECK**       | Definisce condizioni sui valori.             |
| **DEFAULT**     | Imposta un valore predefinito.               |
| **AUTO_INCREMENT** | Genera automaticamente ID univoci.       |

---

## Aggiugnere vincoli alle tabelle esistenti

Ecco una serie di istruzioni `ALTER TABLE` per aggiungere i vari vincoli (**constraints**) richiesti:

### 1. **Aggiungere una chiave primaria (PRIMARY KEY):**

```sql
ALTER TABLE tabella
ADD CONSTRAINT pk_nome_primaria PRIMARY KEY (colonna);
```

### 2. **Aggiungere una chiave esterna (FOREIGN KEY):**

```sql
ALTER TABLE tabella_figlio
ADD CONSTRAINT fk_nome_esterna FOREIGN KEY (colonna_figlio)
REFERENCES tabella_padre(colonna_padre)
ON DELETE CASCADE
ON UPDATE CASCADE;
```

### 3. **Aggiungere un vincolo di unicità (UNIQUE):**

```sql
ALTER TABLE tabella
ADD CONSTRAINT unq_nome_unico UNIQUE (colonna);
```

### 4. **Impedire valori NULL (NOT NULL):**

```sql
ALTER TABLE tabella
MODIFY colonna tipo NOT NULL;
```

### 5. **Aggiungere un vincolo CHECK:**

```sql
ALTER TABLE tabella
ADD CONSTRAINT chk_nome_check CHECK (colonna > 0 AND colonna < 100);
```

### 6. **Impostare un valore predefinito (DEFAULT):**

```sql
ALTER TABLE tabella
ALTER colonna SET DEFAULT 'valore_predefinito';
```

### 7. **Abilitare AUTO_INCREMENT per una colonna:**

```sql
ALTER TABLE tabella
MODIFY colonna INT AUTO_INCREMENT;
```

---

### Esempio completo

Supponiamo di avere una tabella chiamata `utenti`:

```sql
CREATE TABLE utenti (
    id INT,
    nome VARCHAR(50),
    email VARCHAR(100),
    eta INT,
    stato VARCHAR(10)
);
```

Aggiungiamo tutti i vincoli richiesti:

```sql
-- 1. PRIMARY KEY
ALTER TABLE utenti
ADD CONSTRAINT pk_utenti PRIMARY KEY (id);

-- 2. FOREIGN KEY
ALTER TABLE utenti
ADD CONSTRAINT fk_utenti_stato FOREIGN KEY (stato)
REFERENCES stati(codice)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- 3. UNIQUE
ALTER TABLE utenti
ADD CONSTRAINT unq_email UNIQUE (email);

-- 4. NOT NULL
ALTER TABLE utenti
MODIFY nome VARCHAR(50) NOT NULL;

-- 5. CHECK
ALTER TABLE utenti
ADD CONSTRAINT chk_eta CHECK (eta >= 18 AND eta <= 99);

-- 6. DEFAULT
ALTER TABLE utenti
ALTER stato SET DEFAULT 'attivo';

-- 7. AUTO_INCREMENT
ALTER TABLE utenti
MODIFY id INT AUTO_INCREMENT;
```

