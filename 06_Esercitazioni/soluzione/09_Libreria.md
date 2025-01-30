# Esercitazione Libreria

[Scarica il database](../../09_data/libreria/)

Esegui queste query coprono diversi aspetti come **SELECT, JOIN, GROUP BY, HAVING, ORDER BY, COUNT, SUM, AVG** e molto altro.

---

### **1. Elenco di tutti i libri**

```sql
SELECT * FROM libro;
```

---

### **2. Elenco di tutti gli autori**

```sql
SELECT * FROM autore;
```

---

### **3. Elenco di tutti gli editori**

```sql
SELECT * FROM editore;
```

---

### **4. Selezionare il titolo e il prezzo dei libri ordinati per prezzo crescente**

```sql
SELECT titolo, prezzo FROM libro ORDER BY prezzo ASC;
```

---

### **5. Selezionare i libri con un prezzo superiore a 15€**

```sql
SELECT titolo, prezzo FROM libro WHERE prezzo > 15;
```

---

### **6. Contare il numero totale di libri nel database**

```sql
SELECT COUNT(*) AS numero_libri FROM libro;
```

---

### **7. Ottenere la media delle pagine dei libri**

```sql
SELECT AVG(pagine) AS media_pagine FROM libro;
```

---

### **8. Trovare il libro più costoso**

```sql
SELECT titolo, prezzo FROM libro ORDER BY prezzo DESC LIMIT 1;
```

---

### **9. Trovare il libro meno costoso**

```sql
SELECT titolo, prezzo FROM libro ORDER BY prezzo ASC LIMIT 1;
```

---

### **10. Contare il numero di autori per nazione**

```sql
SELECT nazionalita, COUNT(*) AS numero_autori 
FROM autore 
GROUP BY nazionalita;
```

---

### **11. Elenco dei libri con più di 500 pagine**

```sql
SELECT titolo, pagine FROM libro WHERE pagine > 500;
```

---

### **12. Elenco degli autori italiani**

```sql
SELECT nome, cognome FROM autore WHERE nazionalita = 'it';
```

---

### **13. Trovare tutti i libri pubblicati da un determinato editore (es. Mondadori)**

```sql
SELECT titolo FROM libro 
JOIN editore ON libro.editore_id = editore.id 
WHERE editore.nome = 'Mondadori';
```

---

### **14. Contare il numero di libri per ogni editore**

```sql
SELECT e.nome AS editore, COUNT(l.id) AS numero_libri
FROM libro l
JOIN editore e ON l.editore_id = e.id
GROUP BY e.nome;
```

---

### **15. Trovare i libri con più di 400 pagine pubblicati da un determinato editore**

```sql
SELECT titolo, pagine FROM libro 
WHERE pagine > 400 AND editore_id = (SELECT id FROM editore WHERE nome = 'Mondadori');
```

---

### **16. Trovare il numero di autori che hanno scritto almeno un libro**

```sql
SELECT COUNT(DISTINCT autore_id) AS numero_autori 
FROM autore_libro;
```

---

### **17. Trovare gli autori che hanno scritto più di un libro**

```sql
SELECT a.nome, a.cognome, COUNT(al.libro_id) AS numero_libri
FROM autore a
JOIN autore_libro al ON a.id = al.autore_id
GROUP BY a.id
HAVING COUNT(al.libro_id) > 1;
```

---

### **18. Trovare gli autori che non hanno scritto alcun libro**

```sql
SELECT nome, cognome FROM autore 
WHERE id NOT IN (SELECT autore_id FROM autore_libro);
```

---

### **19. Selezionare i libri con più di un autore**

```sql
SELECT l.titolo, COUNT(al.autore_id) AS numero_autori
FROM libro l
JOIN autore_libro al ON l.id = al.libro_id
GROUP BY l.id
HAVING COUNT(al.autore_id) > 1;
```

---

### **20. Contare il numero di libri per autore**

```sql
SELECT a.nome, a.cognome, COUNT(al.libro_id) AS numero_libri
FROM autore a
JOIN autore_libro al ON a.id = al.autore_id
GROUP BY a.id;
```

---

### **21. Ottenere la somma totale del prezzo di tutti i libri**

```sql
SELECT SUM(prezzo) AS totale_prezzi FROM libro;
```

---

### **22. Contare il numero di libri con un prezzo compreso tra 10 e 20 euro**

```sql
SELECT COUNT(*) AS numero_libri FROM libro WHERE prezzo BETWEEN 10 AND 20;
```

---

### **23. Trovare il prezzo medio dei libri per editore**

```sql
SELECT e.nome AS editore, AVG(l.prezzo) AS prezzo_medio
FROM libro l
JOIN editore e ON l.editore_id = e.id
GROUP BY e.nome;
```

---

### **24. Trovare gli autori con più libri pubblicati da editori diversi**

```sql
SELECT a.nome, a.cognome, COUNT(DISTINCT l.editore_id) AS numero_editori
FROM autore a
JOIN autore_libro al ON a.id = al.autore_id
JOIN libro l ON al.libro_id = l.id
GROUP BY a.id
HAVING COUNT(DISTINCT l.editore_id) > 1;
```

---

### **25. Trovare i libri con il prezzo più alto per ogni editore**

```sql
SELECT e.nome AS editore, l.titolo, l.prezzo
FROM libro l
JOIN editore e ON l.editore_id = e.id
WHERE l.prezzo = (SELECT MAX(prezzo) FROM libro WHERE editore_id = e.id);
```

---

### **26. Ottenere i 5 libri più costosi**

```sql
SELECT titolo, prezzo FROM libro ORDER BY prezzo DESC LIMIT 5;
```

---

### **27. Contare il numero di libri pubblicati da ciascun editore con più di 3 libri**

```sql
SELECT e.nome AS editore, COUNT(l.id) AS numero_libri
FROM libro l
JOIN editore e ON l.editore_id = e.id
GROUP BY e.nome
HAVING COUNT(l.id) > 3;
```

---

### **28. Selezionare il nome degli editori che hanno pubblicato almeno un libro con più di 500 pagine**

```sql
SELECT DISTINCT e.nome
FROM editore e
JOIN libro l ON e.id = l.editore_id
WHERE l.pagine > 500;
```

---

### **29. Trovare gli autori che hanno scritto libri pubblicati da più di un editore**

```sql
SELECT a.nome, a.cognome, COUNT(DISTINCT l.editore_id) AS numero_editori
FROM autore a
JOIN autore_libro al ON a.id = al.autore_id
JOIN libro l ON al.libro_id = l.id
GROUP BY a.id
HAVING COUNT(DISTINCT l.editore_id) > 1;
```

---

### **30. Contare il numero di libri per ogni autore con più di 1 libro**

```sql
SELECT a.nome, a.cognome, COUNT(al.libro_id) AS numero_libri
FROM autore a
JOIN autore_libro al ON a.id = al.autore_id
GROUP BY a.id
HAVING COUNT(al.libro_id) > 1;
```

