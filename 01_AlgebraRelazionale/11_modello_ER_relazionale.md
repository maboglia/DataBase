# Il modello E/R

Il **modello E/R (Entità/Relazioni)** serve a **progettare un database prima di scrivere SQL**.
È un modello **concettuale**, quindi **non tecnico**, pensato per **capire e rappresentare la realtà**.

---

## 1️⃣ A cosa serve il modello E/R

Il modello E/R risponde a questa domanda:

> **“Quali informazioni devo memorizzare e come sono collegate tra loro?”**

👉 Si usa **prima** del modello relazionale e di SQL.

---

## 2️⃣ I tre elementi fondamentali

### 🔹 Entità

Un’**entità** rappresenta un oggetto del mondo reale.

Esempi:

* Studente
* Docente
* Materia
* Esame

Ogni entità diventerà **una tabella** nel database.

---

### 🔹 Attributi

Gli **attributi** descrivono un’entità.

Esempio: **Studente**

* matricola
* nome
* cognome
* data_nascita

Uno di questi è la **chiave primaria** (es. `matricola`).

---

### 🔹 Relazioni

Le **relazioni** descrivono come le entità sono collegate.

Esempi:

* Studente **sostiene** Esame
* Docente **insegna** Materia

---

## 3️⃣ Cardinalità (quanti?)

Ogni relazione ha una **cardinalità**:

* **1 : 1**
* **1 : N**
* **N : M**

Esempio:

* uno studente → molti esami
  **Studente (1) — (N) Esame**

---

## 4️⃣ Il diagramma E/R

Il modello E/R si rappresenta con un **diagramma grafico**:

* **rettangoli** → entità
* **ovali** → attributi
* **rombi** → relazioni

Esempio concettuale:

```text
[Studente] ---- sostiene ---- [Esame]
     |                          |
   matricola                 voto
   nome                      data
```

---

## 5️⃣ Chiave primaria e chiave esterna

Nel modello E/R:

* la **chiave primaria** identifica un’entità
* le **chiavi esterne non si vedono ancora**
  👉 compaiono nel **modello relazionale**

---

## 6️⃣ Relazioni N : M

Le relazioni **molti a molti** sono normali nel modello E/R.

Esempio:

* Studente ↔ Materia

Nel diagramma E/R:

```text
Studente ---- frequenta ---- Materia
```

Nel modello relazionale diventerà:

```text
Studente_Materia
```

---

## 7️⃣ Dal modello E/R al modello relazionale

📌 Regola fondamentale:

| Modello E/R     | Modello Relazionale |
| --------------- | ------------------- |
| Entità          | Tabella             |
| Attributi       | Colonne             |
| Chiave primaria | PRIMARY KEY         |
| Relazione 1:N   | FOREIGN KEY         |
| Relazione N:M   | Tabella ponte       |

---

## 8️⃣ Esempio completo (scuola)

### E/R (concettuale)

* Studente (matricola, nome, cognome)
* Materia (id, nome)
* Docente (id, nome)
* Relazioni:

  * Studente **frequenta** Materia (N:M)
  * Docente **insegna** Materia (1:N)

---

### Relazionale (SQL)

```sql
STUDENTI(id_studente PK, nome, cognome)
MATERIE(id_materia PK, nome)
DOCENTI(id_docente PK, nome)

STUDENTI_MATERIE(
  id_studente FK,
  id_materia FK
)
```

---

# Il **modello relazionale**

Il **modello relazionale** è il modo più comune per **organizzare i dati nei database SQL**.
Lo spiego in modo semplice, usando concetti che già conosciamo nella vita quotidiana.

---

## 1️⃣ L’idea di base

Nel modello relazionale:

* i **dati sono organizzati in tabelle**
* le **tabelle sono collegate tra loro da relazioni**
* ogni tabella rappresenta un **insieme di oggetti dello stesso tipo**

👉 È come un insieme di **fogli Excel collegati tra loro**.

---

## 2️⃣ La tabella (relazione)

Una **tabella** è detta anche **relazione**.

Esempio: tabella `Studenti`

| id_studente | nome  | cognome | data_nascita |
| ----------- | ----- | ------- | ------------ |
| 1           | Mario | Rossi   | 2004-05-10   |
| 2           | Lucia | Bianchi | 2003-11-22   |

* **righe (tuple)** → i singoli record (uno studente)
* **colonne (attributi)** → le caratteristiche dello studente

---

## 3️⃣ Chiave primaria (PRIMARY KEY)

Ogni tabella deve avere una **chiave primaria**:

* identifica **in modo univoco** ogni riga
* **non può essere NULL**
* **non può ripetersi**

Esempio:

```sql
id_studente INT PRIMARY KEY
```

👉 È come il **codice fiscale** per le persone.

---

## 4️⃣ Relazioni tra tabelle

Le tabelle sono collegate tramite **chiavi esterne (FOREIGN KEY)**.

Esempio:

* uno studente può sostenere molti esami
* ogni esame appartiene a uno studente

### Tabella `Esami`

| id_esame | voto | data       | id_studente |
| -------- | ---- | ---------- | ----------- |
| 1        | 28   | 2024-06-20 | 1           |
| 2        | 30   | 2024-07-10 | 1           |

```sql
id_studente INT REFERENCES Studenti(id_studente)
```

👉 `id_studente` è una **chiave esterna** che crea la relazione.

---

## 5️⃣ Tipi di relazioni

Nel modello relazionale ci sono tre casi principali:

### 🔹 1 a 1

* una persona → una carta d’identità

### 🔹 1 a N (il più comune)

* uno studente → molti esami

### 🔹 N a N

* studenti ↔ materie
  👉 si usa una **tabella di collegamento**

Esempio:

```text
Studenti_Materie
- id_studente
- id_materia
```

---

## 6️⃣ Integrità dei dati

Il modello relazionale impone **regole** per evitare errori:

* **integrità di entità** → chiave primaria sempre valida
* **integrità referenziale** → una chiave esterna deve riferirsi a un record esistente
* **vincoli** (`NOT NULL`, `UNIQUE`, `CHECK`)

👉 Serve per mantenere i dati **coerenti e affidabili**.

---

## 7️⃣ Perché si usa SQL

SQL è il linguaggio che permette di:

* creare tabelle (`CREATE TABLE`)
* inserire dati (`INSERT`)
* leggere dati (`SELECT`)
* collegare tabelle (`JOIN`)
* mantenere le relazioni

Esempio:

```sql
SELECT s.nome, e.voto
FROM Studenti s
JOIN Esami e ON s.id_studente = e.id_studente;
```

