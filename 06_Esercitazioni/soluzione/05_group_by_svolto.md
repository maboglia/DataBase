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
-- DB generation
-- 1) Contate gli studenti divisi per genere
-- la tabelle risultante mostrerà i seguenti attributi
-- Genere, Quanti
select genere Genere, count(genere) Quanti
from studenti
group by genere;

-- 2) Contate gli studenti divisi per genere solo della provincia di Alessandria
-- la tabelle risultante mostrerà i seguenti attributi
-- Genere, Quanti
select genere Genere, count(genere) Quanti
from studenti
where provincia = 'al'
group by genere
order by quanti;

-- 3) Contate gli studenti divisi per regione
-- la tabelle risultante mostrerà i seguenti attributi
-- Regione, Quanti
select regione Regione, count(*) Quanti
from studenti
group by regione;

-- 4) Contate gli studenti divisi per regione e per genere
-- la tabelle risultante mostrerà i seguenti attributi
-- Regione, Genere, Quanti
select regione Regione, genere Genere, count(*) Quanti
from studenti
group by regione, genere;

-- 5) Contate gli studenti divisi per regione e per genere mostrando anche i totali aggregati
-- ricordatevi della funzione grouping() e dell'istruzione with rollup
-- la tabelle risultante mostrerà i seguenti attributi, con le righe in più dei subtotali e del totale
-- Regione, Genere, Quanti
select
	if(grouping(regione),'totale regioni',regione) Regione,
    if(grouping(genere),'totale genere',genere) Genere,
    count(*) Quanti
from studenti
group by regione, genere with rollup;

-- 6) Contate gli impiegati divisi per ruolo
-- la tabelle risultante mostrerà i seguenti attributi
-- Ruolo, Quanti
select ruolo Ruolo, count(*) Quanti
from impiegato
group by Ruolo;

-- DB liceo
-- 7) Contate gli alunni assegnati alle diverse aule
-- la tabelle risultante mostrerà i seguenti attributi
-- Nome aula, Numero studenti
select a.nome `Nome aula`, count(*) `Numero studenti`
from aule a
join alunni al
on a.id = al.aula_id
group by `Nome aula`;

-- DB libro
-- 8) Contate gli autori divisi per nazionalità
-- la tabelle risultante mostrerà i seguenti attributi
-- Nazionalità, Quanti
select nazionalita `Nazionalità`, count(*) Quanti
from autore
group by nazionalita
order by Quanti desc;

-- 9) Contate i libri per editore e il valore dei libri, ordinate per Editore
-- la tabelle risultante mostrerà i seguenti attributi
-- Editore, Quanti, Valore
select e.nome Editore,
	count(*) Quanti,
    sum(prezzo) Valore
from libri l
join editori e
on e.id = l.editore_id
group by Editore
order by Editore;
```
