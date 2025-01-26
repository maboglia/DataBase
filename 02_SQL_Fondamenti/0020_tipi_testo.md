In MySQL, i **tipi di dati testo** vengono utilizzati per memorizzare stringhe di caratteri di diverse lunghezze. Si suddividono principalmente in tipi di **lunghezza fissa** e **lunghezza variabile**.

---

### **1. Tipi di dati testo di lunghezza fissa**

| Tipo    | Dimensione massima | Uso principale                                                                                       |
|---------|---------------------|-----------------------------------------------------------------------------------------------------|
| **CHAR(n)** | Fino a 255 caratteri  | Stringhe di lunghezza fissa. Spazi aggiunti vengono usati per riempire fino alla lunghezza definita (padding). |

#### **Esempio CHAR:**

```sql
CREATE TABLE EsempioChar (
    Codice CHAR(10) -- Ogni valore sarà esattamente di 10 caratteri, con spazi aggiunti se più corto
);
```

- **Quando usarlo:** Quando le stringhe hanno lunghezza fissa, come codici postali o codici prodotto.

---

### **2. Tipi di dati testo di lunghezza variabile**

| Tipo        | Dimensione massima         | Uso principale                                                                                 |
|-------------|-----------------------------|-------------------------------------------------------------------------------------------------|
| **VARCHAR(n)** | Fino a 65.535 caratteri   | Stringhe di lunghezza variabile. Occupa solo lo spazio necessario più 1 o 2 byte per la lunghezza. |

#### **Esempio VARCHAR:**

```sql
CREATE TABLE EsempioVarchar (
    Nome VARCHAR(100) -- Ogni valore può avere fino a 100 caratteri
);
```

- **Quando usarlo:** Per memorizzare stringhe di lunghezza variabile, come nomi di persone o titoli di prodotti.

---

### **3. Tipi di dati per grandi quantità di testo**

| Tipo          | Dimensione massima    | Uso principale                                             |
|---------------|------------------------|-----------------------------------------------------------|
| **TINYTEXT**  | Fino a 255 caratteri  | Piccole quantità di testo, come brevi descrizioni.        |
| **TEXT**      | Fino a 65.535 caratteri | Testo medio, come commenti o descrizioni più lunghe.      |
| **MEDIUMTEXT**| Fino a 16.777.215 caratteri | Grandi quantità di testo, come articoli o blog post.     |
| **LONGTEXT**  | Fino a 4.294.967.295 caratteri | Testo molto grande, come documenti completi o file HTML. |

#### **Esempio TEXT:**

```sql
CREATE TABLE EsempioText (
    Descrizione TEXT -- Memorizza descrizioni lunghe
);
```

- **Quando usarli:** Per campi di grandi dimensioni, come contenuti di articoli, descrizioni o messaggi.

---

### **4. Differenze tra VARCHAR e TEXT**

- **VARCHAR**:
  - Può avere una lunghezza massima definita dall'utente (es. `VARCHAR(255)`).
  - Supporta indici parziali e completi (utile per ricerche).
  - Memorizza la lung
