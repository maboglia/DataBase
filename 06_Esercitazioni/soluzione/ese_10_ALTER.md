# Alter table

---

### Obiettivo degli esercizi

Questi esercizi ti aiuteranno a:

1. Aggiungere, modificare e rimuovere colonne.
2. Gestire le chiavi primarie e le chiavi esterne.
3. Rinominare tabelle e colonne.
4. Applicare valori di default e modificare tipi di dati.

---

Ecco il codice per creare le tabelle necessarie che puoi successivamente alterare durante gli esercizi:  

---

### **1. Tabella `studenti`**

```sql
CREATE TABLE IF NOT EXISTS studenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    email VARCHAR(50)
);
```

---

### **2. Tabella `docenti`**

```sql
CREATE TABLE IF NOT EXISTS docenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    email VARCHAR(50),
    telefono VARCHAR(20)
);
```

---

### **3. Tabella `clienti`**

```sql
CREATE TABLE IF NOT EXISTS clienti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    cognome VARCHAR(30),
    email VARCHAR(50),
    provincia CHAR(2)
);
```

---

### **4. Tabella `corsi`**

```sql
CREATE TABLE IF NOT EXISTS corsi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(100),
    prezzo DECIMAL(6, 2)
);
```

---

### **5. Tabella `ordini`**

```sql
CREATE TABLE IF NOT EXISTS ordini (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_ordine DATE,
    totale DECIMAL(10, 2),
    id_cliente INT
);
```

---

### **6. Tabella `libri`**

```sql
CREATE TABLE IF NOT EXISTS libri (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(100),
    prezzo DECIMAL(6, 2),
    pagine INT,
    id_editore INT
);
```

---

### Obiettivi delle modifiche

Queste tabelle di base ti permetteranno di eseguire tutti i comandi `ALTER TABLE` suggeriti negli esercizi precedenti:

1. **Aggiungere e rimuovere colonne.**
2. **Modificare colonne esistenti.**
3. **Rinominare colonne e tabelle.**
4. **Aggiungere e rimuovere chiavi esterne e primarie.**

---

Ecco 9 esercizi per sperimentare il comando `ALTER TABLE`. Ogni esercizio copre un caso d'uso diverso per modificare la struttura delle tabelle:

---

### **1. Aggiungere un campo alla tabella**

Aggiungi un campo chiamato `data_nascita` di tipo `DATE` alla tabella `studenti`.

```sql
ALTER TABLE studenti
ADD data_nascita DATE;
```

---

### **2. Modificare la lunghezza di un campo**

Modifica la lunghezza massima del campo `email` nella tabella `docenti` da 50 a 100 caratteri.

```sql
ALTER TABLE docenti
MODIFY email VARCHAR(100);
```

---

### **3. Rinominare un campo**

Rinomina il campo `cognome` nella tabella `clienti` in `surname`.

```sql
ALTER TABLE clienti
CHANGE cognome surname VARCHAR(50);
```

---

### **4. Cambiare il tipo di un campo**

Modifica il tipo di dato del campo `prezzo` nella tabella `corsi` da `DECIMAL(6,2)` a `FLOAT`.

```sql
ALTER TABLE corsi
MODIFY prezzo FLOAT;
```

---

### **5. Aggiungere una chiave esterna**

Aggiungi una chiave esterna alla tabella `ordini`, collegandola al campo `id` della tabella `clienti`.

```sql
ALTER TABLE ordini
ADD CONSTRAINT fk_ordini_clienti
FOREIGN KEY (id_cliente) REFERENCES clienti(id);
```

---

### **6. Rimuovere un campo**

Rimuovi il campo `telefono` dalla tabella `docenti`.

```sql
ALTER TABLE docenti
DROP COLUMN telefono;
```

---

### **7. Rinominare una tabella**

Rinomina la tabella `libri` in `books`.

```sql
ALTER TABLE libri
RENAME TO books;
```

---

### **8. Aggiungere un campo con un valore di default**

Aggiungi un campo chiamato `stato` di tipo `VARCHAR(20)` con valore di default `'attivo'` alla tabella `corsi`.

```sql
ALTER TABLE corsi
ADD stato VARCHAR(20) DEFAULT 'attivo';
```

---

### **9. Rimuovere una chiave esterna**

Rimuovi la chiave esterna `fk_ordini_clienti` dalla tabella `ordini`.

```sql
ALTER TABLE ordini
DROP FOREIGN KEY fk_ordini_clienti;
```
