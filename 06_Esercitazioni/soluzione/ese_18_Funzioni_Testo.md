# sperimentare le principali funzioni di testo in SQL 

---

### **Esercizio 1: Convertire il testo in maiuscolo**

**Descrizione:** Seleziona i nomi dei clienti in maiuscolo.  
**Query:**

```sql
SELECT UPPER(nome) AS nome_maiuscolo, cognome 
FROM clienti;
```

---

### **Esercizio 2: Convertire il testo in minuscolo**

**Descrizione:** Seleziona i cognomi dei clienti in minuscolo.  
**Query:**

```sql
SELECT LOWER(cognome) AS cognome_minuscolo, nome 
FROM clienti;
```

---

### **Esercizio 3: Concatenare stringhe**

**Descrizione:** Crea una colonna che mostri il nome completo (nome + cognome).  
**Query:**

```sql
SELECT CONCAT(nome, ' ', cognome) AS nome_completo 
FROM clienti;
```

---

### **Esercizio 4: Estrarre una parte di testo**

**Descrizione:** Estrai i primi tre caratteri del nome del corso.  
**Query:**

```sql
SELECT titolo, SUBSTRING(titolo, 1, 3) AS abbreviazione 
FROM corsi;
```

---

### **Esercizio 5: Calcolare la lunghezza di una stringa**

**Descrizione:** Trova la lunghezza del nome dei libri.  
**Query:**

```sql
SELECT titolo, CHAR_LENGTH(titolo) AS lunghezza 
FROM libri;
```

---

### **Esercizio 6: Rimuovere spazi iniziali e finali**

**Descrizione:** Rimuovi spazi inutili dai nomi dei clienti.  
**Query:**

```sql
SELECT nome, TRIM(nome) AS nome_senza_spazi 
FROM clienti;
```

---

### **Esercizio 7: Sostituire una parte di testo**

**Descrizione:** Sostituisci "Corso" con "Lezione" nei titoli dei corsi.  
**Query:**

```sql
SELECT titolo, REPLACE(titolo, 'Corso', 'Lezione') AS titolo_modificato 
FROM corsi;
```

---

### **Esercizio 8: Cercare una sottostringa**

**Descrizione:** Trova i corsi che contengono la parola "Base".  
**Query:**

```sql
SELECT titolo 
FROM corsi 
WHERE titolo LIKE '%Base%';
```

---

### **Esercizio 9: Inserire testo con zeri a sinistra**

**Descrizione:** Formatta gli ID degli ordini in modo che abbiano sempre 5 cifre (es. 00001).  
**Query:**

```sql
SELECT LPAD(id, 5, '0') AS id_formattato, data_ordine 
FROM ordini;
```

