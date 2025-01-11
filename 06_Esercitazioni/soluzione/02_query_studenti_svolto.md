```sql
/*
1
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui cognome è uguale a 'verdi' e ordina per nome
*/
select cognome, nome, email, data_nascita
from studenti
where cognome = 'verdi'
order by cognome;

/*
2
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui genere è 'femmina' e ordina per cognome e per nome
*/
select cognome, nome, email, data_nascita
from studenti
where genere = 'f'
order by cognome, nome;

/*
3
seleziona il cognome, il nome, la città, l'email e la data di nascita
dalla tabella studenti
la cui città NON è 'Torino' e ordina per città, per cognome e nome
*/
select cognome, nome, citta, email, data_nascita
from studenti
where citta != 'torino'
order by citta, cognome, nome;

/*
4
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita è maggiore della data '2000-01-01' compresa
e ordina per data di nascita dalla più recente alla più remota
*/
select cognome, nome, email, data_nascita
from studenti
-- where data_nascita > '1999-12-31'
where data_nascita >= '2000-01-01' 
order by data_nascita desc;

/*
5
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui genere è 'maschio' e la provincia è 'Alessandria' e ordina per cognome e nome
*/
select cognome, nome, citta, email, data_nascita
from studenti
where genere ='m' and provincia = 'al'
order by cognome, nome;

/*
6
seleziona il cognome, il nome, l'email, la data di nascita e la provincia
dalla tabella studenti
la cui provincia è Asti o Novara e ordina per provincia, cognome e nome
*/
select cognome, nome, citta, email, data_nascita
from studenti
where provincia = 'at' or provincia = 'no'
order by provincia, cognome, nome;

/*
7
seleziona il cognome, il nome, l'email, la data di nascita e la provincia
dalla tabella studenti
la cui provincia è Cuneo o Asti o Novara o Alessandria e ordina per provincia, cognome e nome
*/
select cognome, nome, citta, email, data_nascita
from studenti
where provincia in ('cn','at','no','al')
order by provincia, cognome, nome;

/*
8
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita è compresa tra il 1990-01-01 e il 1999-12-31
e il cui genere è 'femmina' e ordina per data di nascita dalla più recente alla più remota,
per cognome e per nome
*/
select cognome, nome, email, data_nascita
from studenti
where data_nascita between '1990-01-01' and '1999-12-31' and genere = 'f'
order by data_nascita desc, cognome, nome;

/*
9
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
la cui data di nascita NON è compresa tra il 1990-01-01 e il 1999-12-31
e il cui genere è 'femmina' e ordina per data di nascita dalla più recente alla più remota,
per cognome e per nome
*/
select cognome, nome, email, data_nascita
from studenti
where data_nascita not between '1990-01-01' and '1999-12-31' and genere = 'f'
order by data_nascita desc;

/*
10
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui cognome inizia per 'r' e ordina per cognome e nome
*/
select cognome, nome, email, data_nascita
from studenti
where cognome like 'r%'
order by cognome, nome;

/*
11
seleziona il cognome, il nome, l'email e la data di nascita
dalla tabella studenti
il cui cognome inizia per 've' o 'de' e ordina per cognome e nome
*/
select cognome, nome, email, data_nascita
from studenti
-- where cognome like 've%' or cognome like 'de%'
where cognome regexp '^[vd]e'
order by cognome;
```

---

# Ecco una spiegazione dettagliata dei costrutti MySQL utilizzati nelle query

---

### **1. `SELECT ... FROM ... WHERE ... ORDER BY`**

- **Esempio:**

```sql
select cognome, nome, email, data_nascita
from studenti
where cognome = 'verdi'
order by cognome;
```

- **Spiegazione:**
  - **`SELECT cognome, nome, email, data_nascita`**: Seleziona solo le colonne specificate.
  - **`FROM studenti`**: Indica la tabella dalla quale ottenere i dati.
  - **`WHERE cognome = 'verdi'`**: Filtra i record dove `cognome` è uguale a `'verdi'`.
  - **`ORDER BY cognome`**: Ordina i risultati in base alla colonna `cognome` in ordine crescente (default).

---

### **2. `WHERE` con condizioni multiple e `ORDER BY` con più colonne**

- **Esempio:**

```sql
select cognome, nome, email, data_nascita
from studenti
where genere = 'f'
order by cognome, nome;
```

- **Spiegazione:**
  - **`WHERE genere = 'f'`**: Filtra i record con `genere = femmina`.
  - **`ORDER BY cognome, nome`**: Ordina prima per `cognome` e, a parità di valore, per `nome`.

---

### **3. `WHERE ... !=` (Diverso da)**

- **Esempio:**

```sql
select cognome, nome, citta, email, data_nascita
from studenti
where citta != 'torino'
order by citta, cognome, nome;
```

- **Spiegazione:**
  - **`WHERE citta != 'torino'`**: Filtra i record in cui la città non è `'torino'`.
  - **`ORDER BY citta, cognome, nome`**: Ordina prima per città, poi per cognome, infine per nome.

---

### **4. `WHERE` con confronto di date**

- **Esempio:**

```sql
select cognome, nome, email, data_nascita
from studenti
where data_nascita >= '2000-01-01'
order by data_nascita desc;
```

- **Spiegazione:**
  - **`WHERE data_nascita >= '2000-01-01'`**: Filtra i record con data di nascita maggiore o uguale al 1° gennaio 2000.
  - **`ORDER BY data_nascita desc`**: Ordina i risultati in ordine decrescente per data di nascita.

---

### **5. `WHERE` con condizioni `AND`**

- **Esempio:**

```sql
select cognome, nome, citta, email, data_nascita
from studenti
where genere = 'm' and provincia = 'al'
order by cognome, nome;
```

- **Spiegazione:**
  - **`WHERE genere = 'm' AND provincia = 'al'`**: Filtra i record dove entrambe le condizioni sono vere.
  - **`ORDER BY cognome, nome`**: Ordina per cognome e nome.

---

### **6. `WHERE` con condizioni `OR`**

- **Esempio:**

```sql
select cognome, nome, citta, email, data_nascita
from studenti
where provincia = 'at' or provincia = 'no'
order by provincia, cognome, nome;
```

- **Spiegazione:**
  - **`WHERE provincia = 'at' OR provincia = 'no'`**: Filtra i record in cui la provincia è Asti o Novara.
  - **`ORDER BY provincia, cognome, nome`**: Ordina per provincia, poi per cognome e nome.

---

### **7. `WHERE ... IN`**

- **Esempio:**

```sql
select cognome, nome, citta, email, data_nascita
from studenti
where provincia in ('cn', 'at', 'no', 'al')
order by provincia, cognome, nome;
```

- **Spiegazione:**
  - **`WHERE provincia IN ('cn', 'at', 'no', 'al')`**: Filtra i record dove la provincia è una tra quelle elencate.
  - **`ORDER BY provincia, cognome, nome`**: Ordina per provincia, cognome e nome.

---

### **8. `WHERE ... BETWEEN`**

- **Esempio:**

```sql
select cognome, nome, email, data_nascita
from studenti
where data_nascita between '1990-01-01' and '1999-12-31' and genere = 'f'
order by data_nascita desc, cognome, nome;
```

- **Spiegazione:**
  - **`WHERE data_nascita BETWEEN '1990-01-01' AND '1999-12-31'`**: Filtra le date comprese nell’intervallo.
  - **`AND genere = 'f'`**: Aggiunge una condizione che limita il genere a femmine.
  - **`ORDER BY data_nascita desc, cognome, nome`**: Ordina per data di nascita in ordine decrescente, poi per cognome e nome.

---

### **9. `WHERE NOT BETWEEN`**

- **Esempio:**

```sql
select cognome, nome, email, data_nascita
from studenti
where data_nascita not between '1990-01-01' and '1999-12-31' and genere = 'f'
order by data_nascita desc;
```

- **Spiegazione:**
  - **`WHERE NOT BETWEEN`**: Filtra le date **non** comprese nell’intervallo specificato.
  - **`AND genere = 'f'`**: Limita i record al genere femminile.

---

### **10. `LIKE` con caratteri jolly**

- **Esempio:**

```sql
select cognome, nome, email, data_nascita
from studenti
where cognome like 'r%'
order by cognome, nome;
```

- **Spiegazione:**
  - **`LIKE 'r%'`**: Cerca i cognomi che iniziano con la lettera `'r'`.
  - `%`: Carattere jolly che rappresenta zero o più caratteri.

---

### **11. `REGEXP` per pattern più complessi**

- **Esempio:**

```sql
select cognome, nome, email, data_nascita
from studenti
where cognome regexp '^[vd]e'
order by cognome;
```

- **Spiegazione:**
  - **`REGEXP '^[vd]e'`**: Cerca cognomi che iniziano con `'ve'` o `'de'`.
  - `^`: Indica l’inizio della stringa.
  - `[vd]`: Specifica che la stringa può iniziare con `'v'` o `'d'`.

---

Ogni costrutto SQL serve a costruire query flessibili e precise per manipolare e analizzare i dati.
