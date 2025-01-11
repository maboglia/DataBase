# Ecco una spiegazione dei costrutti SQL usati nelle query

---

### **1. `SELECT` con Join tra docenti e corsi**

- **Esempio:**

```sql
select cognome, nome, email, titolo
from docenti, corsi
where docenti.id = corsi.docente_id
order by cognome, nome;
```

- **Spiegazione:**
  - **`docenti.id = corsi.docente_id`**: Effettua un join tra le tabelle `docenti` e `corsi` sulla base della corrispondenza tra l'ID del docente nella tabella `docenti` e il riferimento nella tabella `corsi`.
  - **`order by cognome, nome`**: Ordina i risultati per cognome e nome in ordine crescente.

---

### **2. `WHERE` con condizione di prezzo**

- **Esempio:**

```sql
select cognome, nome, email, titolo, prezzo
from docenti, corsi
where docenti.id = corsi.docente_id
and prezzo < 200
order by cognome, nome;
```

- **Spiegazione:**
  - **`and prezzo < 200`**: Filtra i corsi con un prezzo inferiore a 200.
  - **`order by cognome, nome`**: Ordina per cognome e nome del docente.

---

### **3. Filtro per titolo specifico**

- **Esempio:**

```sql
select cognome, nome, email
from docenti, corsi
where docenti.id = corsi.docente_id
and titolo = 'html';
```

- **Spiegazione:**
  - **`and titolo = 'html'`**: Filtra i corsi con titolo `'html'`.

---

### **4. Filtro per cognome del docente**

- **Esempio:**

```sql
select titolo
from docenti, corsi
where docenti.id = corsi.docente_id
and cognome = 'Verdi'
order by titolo;
```

- **Spiegazione:**
  - **`and cognome = 'Verdi'`**: Filtra i corsi insegnati dal docente con cognome `'Verdi'`.
  - **`order by titolo`**: Ordina per titolo dei corsi.

---

### **5. `LIKE` per filtri con pattern**

- **Esempio:**

```sql
select cognome, nome, email, titolo
from docenti, corsi
where docenti.id = corsi.docente_id
and titolo like 'Introduzione%'
order by titolo, cognome, nome;
```

- **Spiegazione:**
  - **`like 'Introduzione%'`**: Cerca corsi il cui titolo inizia con `'Introduzione'`.
  - **`order by titolo, cognome, nome`**: Ordina per titolo, poi per cognome e nome.

---

### **6. Join tra studenti, corsi e iscrizioni**

- **Esempio:**

```sql
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
order by cognome, nome;
```

- **Spiegazione:**
  - **`studenti.id = iscrizioni.studente_id`**: Collega studenti con le loro iscrizioni.
  - **`corsi.id = iscrizioni.corso_id`**: Collega corsi con le iscrizioni.
  - **`order by cognome, nome`**: Ordina per cognome e nome dello studente.

---

### **7. Filtro per genere specifico**

- **Esempio:**

```sql
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and genere = 'f'
order by cognome, nome;
```

- **Spiegazione:**
  - **`and genere = 'f'`**: Filtra le studentesse (genere femminile).

---

### **8. Filtro per titolo specifico di corso**

- **Esempio:**

```sql
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and titolo = 'java'
order by cognome, nome;
```

- **Spiegazione:**
  - **`and titolo = 'java'`**: Filtra gli studenti iscritti al corso di `'java'`.

---

### **9. Filtro combinato per genere e titolo**

- **Esempio:**

```sql
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and titolo = 'basi di dati'
and genere = 'm'
order by cognome, nome;
```

- **Spiegazione:**
  - **`and titolo = 'basi di dati' and genere = 'm'`**: Filtra gli studenti maschi iscritti al corso di `'basi di dati'`.

---

### **10. Filtro per prezzo maggiore o uguale**

- **Esempio:**

```sql
select cognome, nome, email, titolo, iscrizioni.prezzo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and iscrizioni.prezzo >= 200
order by cognome, nome;
```

- **Spiegazione:**
  - **`and iscrizioni.prezzo >= 200`**: Filtra le iscrizioni con prezzo pari o superiore a 200.
  - **`order by cognome, nome`**: Ordina per cognome e nome dello studente.

---

Queste query utilizzano principalmente join impliciti per collegare le tabelle, filtrando i risultati in base a specifiche condizioni. La chiave per comprenderle sta nella relazione tra le tabelle coinvolte e nell'uso delle condizioni `WHERE`.

---

```sql
/* 1
Seleziona cognome, nome, email dei docenti
e titolo corso che insegnano
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from docenti, corsi
where docenti.id = corsi.docente_id
order by cognome, nome;

/* 2
Seleziona cognome, nome, email dei docenti
e titolo corso che costa meno di 200€(esclusi)
e ordina per cognome e nome
*/
select cognome, nome, email, titolo, prezzo
from docenti, corsi
where docenti.id = corsi.docente_id
and prezzo < 200
order by cognome, nome;

/* 3
Seleziona cognome, nome, email del docente
che insegna nel corso HTML
*/
select cognome, nome, email
from docenti, corsi
where docenti.id = corsi.docente_id
and titolo = 'html';

/* 4
Seleziona titolo corso/i insegnati dal docente il cui cognome è Verdi
e ordina per titolo corsi
*/
select titolo
from docenti, corsi
where docenti.id = corsi.docente_id
and cognome = 'Verdi'
order by titolo;

/* 5
Seleziona cognome, nome, email del/dei docente/i
che insegnano nei corsi il cui titolo comincia per 'Introduzione'
e ordina per titolo, cognome e nome
*/
select cognome, nome, email, titolo
from docenti, corsi
where docenti.id = corsi.docente_id
and titolo like 'Introduzione%'
order by titolo, cognome, nome;

/* 6
Seleziona cognome, nome, email, degli studenti 
e titolo del corso a cui sono iscritti
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
order by cognome, nome;

/* 7
Seleziona cognome, nome, email, degli studenti FEMMINA
e titolo corso a cui sono iscritte
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and genere = 'f'
order by cognome, nome;

/* 8
Seleziona cognome, nome, email, degli studenti
iscritti al corso di Java
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and titolo = 'java'
order by cognome, nome;

/* 9
Seleziona cognome, nome, email, degli studenti MASCHI
iscritti al corso di Basi di dati
e ordina per cognome e nome
*/
select cognome, nome, email, titolo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and titolo = 'basi di dati'
and genere = 'm'
order by cognome, nome;

/* 10
Seleziona cognome, nome, email, degli studenti
iscritti a corsi per i quali hanno pagato più di 200€(compresi)
e ordina per cognome e nome
*/
select cognome, nome, email, titolo, iscrizioni.prezzo
from studenti, corsi, iscrizioni
where studenti.id = iscrizioni.studente_id
and corsi.id = iscrizioni.corso_id
and iscrizioni.prezzo >= 200
order by cognome, nome;
```