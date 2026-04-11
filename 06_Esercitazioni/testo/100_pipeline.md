Ecco una **pipeline a step** progettata per testare in modo completo i **fondamenti di basi di dati e SQL** (DDL, DML, query, join, aggregazioni, vincoli, viste, transazioni).

---

# 🧩 PROGETTO: SchoolDB SQL Pipeline (fondamenti basi dati)

## 🎯 Obiettivo

Realizzare un database relazionale completo per una scuola e costruire una pipeline di query SQL che:

1. crea lo schema (DDL)
2. inserisce dati (DML)
3. esegue interrogazioni base
4. usa join e subquery
5. applica vincoli e integrità referenziale
6. calcola statistiche e aggregazioni
7. crea viste e report
8. testa transazioni e rollback

---

# 📌 Contesto

Sistema scolastico con:

* studenti
* docenti
* materie
* classi
* iscrizioni
* voti/esami

---

# 🗂️ STEP 0 — Preparazione ambiente DB

## Task

Scegli DBMS (uno):

* MySQL / MariaDB
* PostgreSQL
* SQLite (più semplice)
* SQL Server

Creare database:

```sql
CREATE DATABASE scuola;
```

Se SQLite: creare file `scuola.db`.

---

# STEP 1 — Modellazione concettuale (ER)

## Task

Disegnare un diagramma E-R con entità e relazioni:

### Entità richieste

* STUDENTE
* DOCENTE
* MATERIA
* CLASSE
* ESAME
* ISCRIZIONE (studente-classe)

### Relazioni richieste

* Uno studente appartiene a una classe (ma può cambiare anno → storico)
* Un docente insegna una o più materie
* Uno studente sostiene esami in diverse materie

📌 Output richiesto:

* diagramma ER (anche su carta/foto)
* cardinalità corrette

---

# STEP 2 — Traduzione ER → schema relazionale

## Task

Definire tabelle con:

* chiavi primarie
* chiavi esterne
* attributi obbligatori (NOT NULL)

Esempio di attributi minimi:

### STUDENTE

* id_studente (PK)
* nome
* cognome
* data_nascita
* email

### CLASSE

* id_classe (PK)
* anno (es 5)
* sezione (es A)
* indirizzo

### ISCRIZIONE

* id_iscrizione (PK)
* id_studente (FK)
* id_classe (FK)
* anno_scolastico (es 2025/2026)

### MATERIA

* id_materia (PK)
* nome
* ore_settimanali

### DOCENTE

* id_docente (PK)
* nome
* cognome
* email

### DOCENTE_MATERIA

* id_docente (FK)
* id_materia (FK)

### ESAME

* id_esame (PK)
* id_studente (FK)
* id_materia (FK)
* data_esame
* voto
* tipo (orale/scritto/pratico)

---

# STEP 3 — Creazione fisica DB (DDL)

## Task

Scrivere ed eseguire tutte le `CREATE TABLE`.

Requisiti:

* PK auto-increment (se supportato)
* FK con ON DELETE / ON UPDATE
* NOT NULL dove serve
* CHECK su voto (2..10)
* UNIQUE su email

📌 Esempio check:

```sql
CHECK (voto BETWEEN 2 AND 10)
```

📌 Output atteso:

* database creato correttamente senza errori

---

# STEP 4 — Inserimento dati (DML)

## Task

Popolare tabelle con dati realistici:

Minimo richiesto:

* 20 studenti
* 3 classi
* 8 docenti
* 6 materie
* almeno 60 esami (voti distribuiti)

📌 Obiettivo: dataset sufficiente per query complesse.

---

# STEP 5 — Query base (SELECT, WHERE, ORDER BY)

## Task

Scrivere query per:

1. Elenco studenti ordinati per cognome
2. Studenti nati dopo il 2007
3. Materie con più di 3 ore settimanali
4. Esami con voto >= 8
5. Docenti che hanno email con dominio `@scuola.it`

---

# STEP 6 — Join fondamentali

## Task

Scrivere query con JOIN per:

1. Elenco studenti con la loro classe attuale
2. Elenco esami con nome studente + materia + voto
3. Docenti e materie insegnate
4. Studenti che hanno sostenuto un esame di Informatica
5. Classi con numero studenti iscritti

📌 Join richiesti:

* INNER JOIN
* LEFT JOIN (almeno una query)

---

# STEP 7 — Aggregazioni (GROUP BY, HAVING)

## Task

Scrivere query per:

1. Media voti per studente
2. Media voti per materia
3. Numero esami per materia
4. Numero studenti per classe
5. Studenti con media > 7 (HAVING)

Esempio:

```sql
SELECT id_studente, AVG(voto) AS media
FROM esame
GROUP BY id_studente
HAVING AVG(voto) > 7;
```

---

# STEP 8 — Subquery e query avanzate

## Task

Scrivere query con subquery per:

1. Studente con media più alta
2. Materia con voto medio più basso
3. Studenti che non hanno mai sostenuto esami
4. Docenti che insegnano più di 1 materia
5. Studenti che hanno almeno un 10

---

# STEP 9 — Operazioni DML avanzate (UPDATE, DELETE)

## Task

1. Aumentare di +1 tutti i voti < 6 (max 6)
2. Aggiornare email di un docente
3. Cancellare esami più vecchi di una data (test)
4. Cancellare uno studente e verificare cosa succede (vincoli FK)

📌 Scopo: testare ON DELETE CASCADE / RESTRICT.

---

# STEP 10 — Vincoli e integrità referenziale

## Task

Testare che il DB blocchi:

* inserimento studente senza email
* inserimento email duplicata
* inserimento voto 11
* inserimento esame con id_materia inesistente

📌 Output richiesto:

* screenshot o log degli errori DB

---

# STEP 11 — Viste SQL (VIEW)

## Task

Creare almeno 3 viste:

### Vista 1: elenco studenti con classe

```sql
CREATE VIEW v_studenti_classi AS ...
```

### Vista 2: esami dettagliati

(studente + materia + voto + data)

### Vista 3: medie studenti

(media voti per studente)

📌 Poi usare le viste in query reali.

---

# STEP 12 — Report finale con query complesse

## Task

Scrivere query per produrre report tipo:

1. Top 5 studenti per media voti
2. Studenti insufficienti (media < 6)
3. Materie più difficili (media più bassa)
4. Distribuzione voti (quanti 10, quanti 9, ecc.)
5. Classe con rendimento migliore (media più alta)

---

# STEP 13 — Indici (INDEX) e performance base

## Task

Creare indici su:

* `studente(email)`
* `esame(id_studente)`
* `esame(id_materia)`
* `iscrizione(id_classe)`

Poi usare:

```sql
EXPLAIN SELECT ...
```

📌 Obiettivo: capire concetto di indice.

---

# STEP 14 — Transazioni (COMMIT, ROLLBACK)

## Task

Simulare una situazione reale:

### Scenario

* inserisci un esame
* aggiorni la media (se esiste tabella di appoggio)
* se qualcosa fallisce → rollback

Esempio:

```sql
BEGIN;

INSERT INTO esame (...) VALUES (...);

UPDATE studente SET ... WHERE ...;

ROLLBACK;
```

Poi ripetere con COMMIT.

📌 Obiettivo: capire atomicità.

---

# STEP 15 — Stored Procedure / Trigger (facoltativo)

## Trigger richiesto (facoltativo)

Quando inserisci un esame:

* controlla che la data non sia futura
* controlla voto valido
* (extra) aggiorna tabella `media_studenti`

---

# STEP 16 — Backup ed Export (facoltativo)

## Task

* esportare DB in SQL dump
* importarlo su un nuovo DB

---

# 🎯 Output finale richiesto

Alla fine devono esserci:

✅ file SQL con DDL (`schema.sql`)
✅ file SQL con dati (`dati.sql`)
✅ file SQL con query (`query.sql`)
✅ viste create
✅ report query finali
✅ test transazioni completati

---

# 📌 Consegna (criteri di completamento)

Il progetto è completato se:

* tutte le tabelle sono create con PK/FK
* almeno 20 studenti e 60 esami inseriti
* query JOIN funzionano
* query GROUP BY/HAVING corrette
* viste create e interrogabili
* transazioni testate
* indici creati e spiegati

---

# 🔥 Bonus (molto formativo)

### BONUS A: Query con ranking (Top studenti)

Se DB supporta window functions:

```sql
SELECT
  s.nome,
  s.cognome,
  AVG(e.voto) AS media,
  RANK() OVER (ORDER BY AVG(e.voto) DESC) AS posizione
FROM studente s
JOIN esame e ON s.id_studente = e.id_studente
GROUP BY s.id_studente;
```

### BONUS B: Query pivot (distribuzione voti per materia)

(da fare con CASE WHEN)

