---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# 📘 Corso PostgreSQL (20 ore)

## 🎯 Obiettivi

✔ progettare DB relazionali
✔ usare SQL standard con PostgreSQL
✔ comprendere MVCC e transazioni
✔ usare psql e pgAdmin
✔ integrare PostgreSQL con Python (CRUD + query)

---

# 🧭 Struttura generale

| Modulo | Ore | Focus                        |
| ------ | --- | ---------------------------- |
| 1      | 2   | Introduzione e installazione |
| 2      | 3   | SQL base PostgreSQL          |
| 3      | 3   | Modellazione e relazioni     |
| 4      | 3   | Query avanzate               |
| 5      | 3   | Transazioni e MVCC           |
| 6      | 2   | Oggetti DB e performance     |
| 7      | 4   | Integrazione Python          |

---

# 🔹 MODULO 1 — Introduzione PostgreSQL (2h)

### Teoria

* DBMS relazionali
* PostgreSQL vs MySQL
* architettura client/server
* strumenti: psql, pgAdmin

### Laboratorio

* installazione
* accesso psql
* comandi base meta

🎯 Output: studenti operativi in CLI

---

# 🔹 MODULO 2 — SQL base (3h)

### Teoria

* CREATE DATABASE
* CREATE TABLE
* tipi dato PostgreSQL
* SERIAL e identity

### Lab

* CRUD completo
* filtri, ordinamenti
* operatori (LIKE, BETWEEN, IN)

🎯 Mini esercizio: gestione studenti

---

# 🔹 MODULO 3 — Modellazione e relazioni (3h)

### Teoria

* PK e FK
* normalizzazione base
* integrità referenziale

### Lab

* schema scuola (studenti, docenti, esami)
* vincoli
* cascade

🎯 Output: schema relazionale completo

---

# 🔹 MODULO 4 — Query avanzate (3h)

### Teoria

* JOIN (inner, left)
* GROUP BY e HAVING
* subquery
* funzioni aggregate

### Lab

* report voti
* statistiche
* query multi-tabella

---

# 🔹 MODULO 5 — Transazioni e MVCC (3h)

### Teoria

* ACID
* livelli isolamento
* MVCC
* snapshot
* vacuum

### Lab (2 terminali)

* simulazione concorrenza
* rollback
* dirty read demo

🎯 Punto forte concettuale del corso

---

# 🔹 MODULO 6 — Oggetti DB e performance (2h)

### Teoria

* VIEW
* INDEX
* sequence
* cenni trigger e stored procedure

### Lab

* creare view report
* test index e explain

---

# 🔹 MODULO 7 — PostgreSQL + Python (4h)

Riferimento linguaggio: **Python**

### ✔ Libreria

* psycopg (psycopg3)

---

## Parte 1 — Connessione (1h)

```bash
pip install psycopg[binary]
```

```python
import psycopg

conn = psycopg.connect(
    "dbname=scuola user=postgres password=postgres host=localhost"
)
```

---

## Parte 2 — CRUD Python (1.5h)

```python
with conn.cursor() as cur:
    cur.execute(
        "INSERT INTO studenti(nome,cognome) VALUES(%s,%s)",
        ("Mario","Rossi")
    )
conn.commit()
```

SELECT:

```python
with conn.cursor() as cur:
    cur.execute("SELECT * FROM studenti")
    for row in cur:
        print(row)
```

---

## Parte 3 — Progetto mini gestionale (1.5h)

Studenti sviluppano:
✔ DAO studenti
✔ funzioni CRUD
✔ ricerca e report
✔ gestione transazioni

🎯 Output finale: mini applicazione console Python

---

# 📊 Verifica finale

✔ prova SQL
✔ esercizio query
✔ esercizio transazione
✔ mini script Python

---

# 🎓 Competenze finali studenti

* progettazione DB
* SQL intermedio
* concorrenza DB
* uso PostgreSQL reale
* integrazione backend Python

---

## installazione di PostgreSQL

---

Ecco una guida passo-passo per l'installazione di PostgreSQL su sistemi Windows tramite la riga di comando (CLI) e l'utilizzo di un client PostgreSQL (ad esempio, pgAdmin). Assicurati di scaricare l'ultima versione di PostgreSQL dal sito ufficiale prima di iniziare.

---

### Installazione di PostgreSQL su Windows tramite CLI

---

### Scarica PostgreSQL

1. **Scarica PostgreSQL
   - Visita il [sito ufficiale di PostgreSQL](https://www.postgresql.org/download/windows/) e scarica l'ultima versione di PostgreSQL per Windows.

---

### Esegui il File

2. **Esegui il File di Installazione
   - Dopo il download, esegui il file di installazione di PostgreSQL (ad esempio, `postgresql-x.x.x-x-windows-x64.exe`).

---

### Configurazione

3. **Configurazione
   - Durante l'installazione, imposta la password per l'utente `postgres` e seleziona la directory di installazione.

---

### Porta di Ascolto

4. **Porta di Ascolto
   - Puoi mantenere la porta di default 5432 o sceglierne una diversa durante l'installazione.

---

### Strumenti Aggiuntivi

5. **Strumenti Aggiuntivi
   - Puoi scegliere di installare strumenti aggiuntivi come pgAdmin durante il processo di installazione.

---

### Completa l'Installazione

6. **Completa l'Installazione
   - Segui le istruzioni per completare l'installazione. Assicurati di selezionare l'opzione per avviare il servizio PostgreSQL al termine dell'installazione.

---

### Utilizzo di PostgreSQL tramite CLI

---

### Avvio del Servizio

1. **Avvio del Servizio
   - Dopo l'installazione, avvia il servizio PostgreSQL. Puoi farlo tramite il Pannello di Controllo di Windows o utilizzando il comando:

     ```bash
     net start postgresql-x64-x.x
     ```

---

### Accesso a PostgreSQL

2. **Accesso a PostgreSQL da CLI
   - Apri una finestra del prompt dei comandi (Command Prompt) o PowerShell e accedi a PostgreSQL utilizzando il comando:

     ```bash
     psql -U postgres
     ```

     Inserisci la password che hai configurato durante l'installazione.

---

### Utilizzo di PostgreSQL tramite pgAdmin

---

### Esegui pgAdmin

1. **Esegui pgAdmin
   - Dopo l'installazione di pgAdmin, eseguilo. Puoi trovarlo nel menu Start o cercarlo nel menu di ricerca di Windows.

---

### Crea una Nuova

2. **Crea una Nuova Connessione
   - Nella finestra principale di pgAdmin, fai clic su "Add New Server" e compila i dettagli necessari, inclusi nome host, nome utente, password, e porta.

---

### Esplora il Database

3. **Esplora il Database
   - Dopo aver stabilito la connessione, puoi esplorare il database, visualizzare tabelle, eseguire query e utilizzare le funzionalità di amministrazione offerte da pgAdmin.

---

### Esempi di Comandi PostgreSQL da CLI

---

### Visualizza i Database

1. **Visualizza i Database
   - Dopo l'accesso a PostgreSQL, puoi visualizzare i database disponibili con il comando:

     ```sql
     \l
     ```

---

### Crea un Nuovo

2. **Crea un Nuovo Database
   - Puoi creare un nuovo database con il comando:

     ```sql
     CREATE DATABASE nomedeldatabase;
     ```

---

### Seleziona un Database

3. **Seleziona un Database
   - Scegli il database su cui lavorare con il comando:

     ```sql
     \c nomedeldatabase;
     ```

---

### Visualizza le Tabelle

4. **Visualizza le Tabelle
   - Visualizza le tabelle nel database corrente con il comando:

     ```sql
     \dt
     ```

---

### Esegui Query

5. **Esegui Query
   - Esegui le tue query SQL normalmente. Ad esempio:

     ```sql
     SELECT * FROM nomedellatabella;
     ```

Questi sono solo passaggi di base, e ci sono molte altre funzionalità avanzate che puoi esplorare man mano che diventi più familiare con PostgreSQL e pgAdmin.

---

# 📊 MODULO 1 — Introduzione PostgreSQL

## 🟦 Slide 1 — Cos’è PostgreSQL

* DBMS relazionale open source
* SQL standard
* multi-utente e multi-transazione
* usato in web, data, backend

---

## 🟦 Slide 2 — PostgreSQL vs MySQL

**PostgreSQL**

* più rigoroso
* più estendibile
* MVCC avanzato

**MySQL**

* semplice
* diffuso web
* veloce CRUD

---

## 🟦 Slide 3 — Architettura

* server PostgreSQL
* client psql
* pgAdmin
* connessione TCP porta 5432

---

## 🟦 Slide 4 — psql base

```
\l
\c db
\dt
\d tabella
```

---

# 📊 MODULO 2 — SQL base

## 🟦 Slide 1 — Creazione DB

```sql
CREATE DATABASE scuola;
```

---

## 🟦 Slide 2 — Tipi dato

* INTEGER
* VARCHAR
* DATE
* BOOLEAN
* SERIAL
* TEXT

---

## 🟦 Slide 3 — CRUD

```sql
INSERT
SELECT
UPDATE
DELETE
```

---

## 🟦 Slide 4 — Filtri

* WHERE
* LIKE / ILIKE
* BETWEEN
* IN
* ORDER BY

---

# 📊 MODULO 3 — Modellazione

## 🟦 Slide 1 — Concetti base

* entità
* attributi
* chiavi primarie
* relazioni

---

## 🟦 Slide 2 — PK e FK

```sql
PRIMARY KEY
REFERENCES
ON DELETE CASCADE
```

---

## 🟦 Slide 3 — Normalizzazione

* ridurre ridondanza
* migliorare integrità
* separare entità

---

## 🟦 Slide 4 — Schema scuola

* studenti
* docenti
* esami

---

# 📊 MODULO 4 — Query avanzate

## 🟦 Slide 1 — JOIN

```sql
INNER JOIN
LEFT JOIN
```

---

## 🟦 Slide 2 — Aggregazioni

* COUNT
* AVG
* SUM
* GROUP BY
* HAVING

---

## 🟦 Slide 3 — Subquery

```sql
SELECT *
FROM studenti
WHERE id IN (SELECT id_studente FROM esami);
```

---

## 🟦 Slide 4 — Funzioni utili

* COALESCE
* CASE
* date functions

---

# 📊 MODULO 5 — Transazioni e MVCC

## 🟦 Slide 1 — ACID

* Atomicità
* Consistenza
* Isolamento
* Durabilità

---

## 🟦 Slide 2 — Transazioni

```sql
BEGIN;
COMMIT;
ROLLBACK;
```

---

## 🟦 Slide 3 — MVCC

* versioni multiple record
* snapshot
* letture non bloccano scritture

👉 metafora: album fotografico

---

## 🟦 Slide 4 — Vacuum

* rimozione versioni obsolete
* prevenzione bloat
* autovacuum

---

# 📊 MODULO 6 — Oggetti DB

## 🟦 Slide 1 — View

```sql
CREATE VIEW report AS ...
```

✔ semplificano query
✔ sicurezza

---

## 🟦 Slide 2 — Index

```sql
CREATE INDEX idx_nome ON studenti(nome);
```

✔ velocizzano SELECT
✔ costo su INSERT/UPDATE

---

## 🟦 Slide 3 — Explain

```sql
EXPLAIN ANALYZE SELECT ...
```

---

## 🟦 Slide 4 — Altri oggetti

* sequence
* trigger (cenni)
* stored procedure

---

# 📊 MODULO 7 — PostgreSQL + Python

## 🟦 Slide 1 — Libreria

```
pip install psycopg[binary]
```

---

## 🟦 Slide 2 — Connessione

```python
import psycopg
conn = psycopg.connect("dbname=scuola user=postgres")
```

---

## 🟦 Slide 3 — CRUD Python

```python
cur.execute(
  "INSERT INTO studenti(nome) VALUES(%s)",
  ("Mario",)
)
```

---

## 🟦 Slide 4 — Mini progetto

* DAO studenti
* CRUD
* report
* transazioni

🎯 output: app console Python

---

# 🎓 Slide finali corso

## 🟦 Competenze acquisite

* SQL PostgreSQL
* modellazione DB
* concorrenza MVCC
* performance base
* integrazione Python

---

