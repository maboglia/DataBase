# Ecco una spiegazione dettagliata per ogni query SQL, che utilizza diverse forme di join per combinare le tabelle

---

### **1. Seleziona docenti e corsi insegnati**

```sql
select cognome, nome, email, titolo
from docenti
join corsi
on docenti.id = corsi.docente_id
order by cognome, nome;
```

- **Spiegazione**:
  - Utilizza una `INNER JOIN` per ottenere solo i docenti che insegnano corsi.
  - I risultati sono ordinati per cognome e nome.

---

### **2. Seleziona docenti e corsi con prezzo < 200€**

```sql
select cognome, nome, email, titolo, prezzo
from docenti
join corsi
on docenti.id = corsi.docente_id
and prezzo < 200
order by cognome, nome;
```

- **Spiegazione**:
  - Filtra i corsi con prezzo inferiore a 200€.
  - Viene mantenuta solo la relazione docenti-corsi con questa condizione.

---

### **3. Docente che insegna il corso "HTML"**

```sql
select cognome, nome, email
from docenti
join corsi
on docenti.id = corsi.docente_id
and titolo = 'html';
```

- **Spiegazione**:
  - Filtra i risultati per ottenere il docente associato al corso "HTML".

---

### **4. Docenti con o senza corsi (LEFT JOIN)**

```sql
select cognome, nome, email, titolo
from docenti
left join corsi
on docenti.id = corsi.docente_id
order by titolo, cognome, nome;
```

- **Spiegazione**:
  - Usa una `LEFT JOIN` per mostrare tutti i docenti, anche quelli senza corsi.

---

### **5. Corsi con o senza docenti (RIGHT JOIN)**

```sql
select cognome, nome, email, titolo
from docenti
right join corsi
on docenti.id = corsi.docente_id
order by titolo, cognome, nome;
```

- **Spiegazione**:
  - Usa una `RIGHT JOIN` per mostrare tutti i corsi, anche quelli senza docenti assegnati.

---

### **6. Docenti senza corsi (LEFT JOIN con filtro `NULL`)**

```sql
select cognome, nome, email
from docenti
left join corsi
on docenti.id = corsi.docente_id
where corsi.id is null
order by cognome, nome;
```

- **Spiegazione**:
  - Mostra solo i docenti che non hanno corsi, filtrando con `corsi.id is null`.

---

### **7. Corsi senza docenti (RIGHT JOIN con filtro `NULL`)**

```sql
select titolo
from docenti
right join corsi
on docenti.id = corsi.docente_id
where docenti.id is null
order by titolo;
```

- **Spiegazione**:
  - Mostra solo i corsi senza un docente assegnato.

---

### **8. Studenti e corsi a cui sono iscritti**

```sql
select cognome, nome, email, titolo
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
order by titolo, cognome, nome;
```

- **Spiegazione**:
  - Combina tre tabelle per ottenere gli studenti e i corsi a cui sono iscritti.

---

### **9. Studenti iscritti al corso "Java"**

```sql
select cognome, nome, email
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
and titolo = 'java'
order by cognome, nome;
```

- **Spiegazione**:
  - Filtra gli studenti iscritti specificamente al corso "Java".

---

### **10. Studenti con iscrizioni >= 200€**

```sql
select cognome, nome, email, titolo, iscrizioni.prezzo
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
and iscrizioni.prezzo >= 200;
```

- **Spiegazione**:
  - Mostra gli studenti con iscrizioni a corsi che costano almeno 200€.

---

### **11. Studenti con o senza corsi (LEFT JOIN)**

```sql
select cognome, nome, email, titolo
from studenti
left join iscrizioni
on studenti.id = iscrizioni.studente_id
left join corsi
on corsi.id = iscrizioni.corso_id
order by titolo, cognome, nome;
```

- **Spiegazione**:
  - Usa una `LEFT JOIN` per mostrare tutti gli studenti, anche quelli senza corsi.

---

### **12. Corsi con o senza iscritti (RIGHT JOIN)**

```sql
select cognome, nome, email, titolo
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
right join corsi
on corsi.id = iscrizioni.corso_id
order by titolo, cognome, nome;
```

- **Spiegazione**:
  - Usa una `RIGHT JOIN` per mostrare tutti i corsi, anche quelli senza studenti iscritti.

---

### **13. Studenti senza corsi (LEFT JOIN con filtro `NULL`)**

```sql
select cognome, nome, email
from studenti
left join iscrizioni
on studenti.id = iscrizioni.studente_id
where iscrizioni.corso_id is null
order by cognome, nome;
```

- **Spiegazione**:
  - Filtra gli studenti che non risultano iscritti a nessun corso.

---

### **14. Corsi senza iscritti (LEFT JOIN con filtro `NULL`)**

```sql
select titolo
from corsi
left join iscrizioni
on corsi.id = iscrizioni.corso_id
where iscrizioni.studente_id is null
order by titolo;
```

- **Spiegazione**:
  - Filtra i corsi che non hanno studenti iscritti.

---

Queste query coprono una varietà di scenari utilizzando diverse forme di join (inner, left, right) per gestire relazioni tra tabelle e casi particolari.

---

```sql

-- USARE SINTASSI JOIN
-- corsi, docenti
/* 1
Seleziona cognome, nome, email dei docenti
e titolo corso che insegnano
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from docenti
join corsi
on docenti.id = corsi.docente_id
order by cognome, nome;

/* 2
Seleziona cognome, nome, email dei docenti
e titolo corso che costa meno di 200€(esclusi)
e ordina per cognome e nome
*/
select cognome, nome, email, titolo, prezzo
from docenti
join corsi
on docenti.id = corsi.docente_id
and prezzo < 200
order by cognome, nome;

/* 3
Seleziona cognome, nome, email del docente
che insegna nel corso HTML
*/
select cognome, nome, email
from docenti
join corsi
on docenti.id = corsi.docente_id
and titolo = 'html';

/* 4
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/
select cognome, nome, email, titolo
from docenti
left join corsi
on docenti.id = corsi.docente_id
order by titolo, cognome, nome;

/* 5
Seleziona cognome, nome, email dei docenti, titolo corso che insegnano
e MOSTRA ANCHE I CORSI CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo, cognome e nome
*/
select cognome, nome, email, titolo
from docenti
right join corsi
on docenti.id = corsi.docente_id
order by titolo, cognome, nome;

/* 6
Seleziona cognome, nome, email
SOLO DEI DOCENTI CHE NON HANNO CORSI ASSEGNATI (outer join)
ordina per cognome e nome
*/
select cognome, nome, email
from docenti
left join corsi
on docenti.id = corsi.docente_id
where corsi.id is null
order by cognome, nome;

/* 7
Seleziona titolo SOLO DEI CORSI 
CHE NON HANNO DOCENTI ASSEGNATI (outer join)
ordina per titolo
*/
select titolo
from docenti
right join corsi
on docenti.id = corsi.docente_id
where docenti.id is null
order by titolo;

-- studenti, corsi, iscrizioni
/* 8
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e ordina per titolo, cognome e nome
*/
select cognome, nome, email, titolo
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
order by titolo, cognome, nome;

/* 9
Seleziona cognome, nome, email, degli studenti
iscritti al corso di Java
e ordina per cognome e nome
*/
select cognome, nome, email
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
and titolo = 'java'
order by cognome, nome;

/* 10
Seleziona cognome, nome, email, degli studenti
iscritti a corsi per i quali hanno pagato più di 200€(compresi)
e ordina per cognome e nome
*/
select cognome, nome, email, titolo, iscrizioni.prezzo
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
join corsi
on corsi.id = iscrizioni.corso_id
and iscrizioni.prezzo >= 200;

/* 11
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE GLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per titolo, cognome e nome
*/
select cognome, nome, email, titolo
from studenti
left join iscrizioni
on studenti.id = iscrizioni.studente_id
left join corsi
on corsi.id = iscrizioni.corso_id
order by titolo, cognome, nome;

/* 12
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e MOSTRA ANCHE I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo, cognome e nome
*/
select cognome, nome, email, titolo
from studenti
join iscrizioni
on studenti.id = iscrizioni.studente_id
right join corsi
on corsi.id = iscrizioni.corso_id
order by titolo, cognome, nome;

/* 13
Seleziona cognome, nome, email
SOLO DEGLI STUDENTI CHE NON SONO ISCRITTI A CORSI (outer join)
e ordina per cognome e nome
*/
select cognome, nome, email
from studenti
left join iscrizioni
on studenti.studente_id = iscrizioni.studente_id
where iscrizioni.corso_id is null
order by cognome, nome;

/* 14
Seleziona titolo del corso
SOLO PER I CORSI CHE NON HANNO ISCRITTI(outer join)
e ordina per titolo, cognome e nome
*/
select titolo
from corsi
left join iscrizioni
on corsi.id = iscrizioni.corso_id
where iscrizioni.studente_id is null
order by titolo;
```

