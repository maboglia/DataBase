# Fondamenti di SQL

Un **dato strutturato** è un dato che:

👉 **segue una struttura ben definita**,
👉 **è organizzato secondo uno schema preciso**,
👉 **può essere facilmente letto, cercato e interrogato da un DB o da un programma**.

---

## 1️⃣ In parole semplici

Un dato strutturato è un dato che **sta in una tabella**, con:

* colonne già definite
* tipi di dato precisi
* regole chiare

📌 **Ogni valore sai già dove va e cosa rappresenta.**

---

## 2️⃣ Esempio immediato (tabella SQL)

```text
STUDENTI
------------------------------------------------
id_studente | nome   | cognome | data_nascita
------------------------------------------------
1           | Mario  | Rossi   | 2004-05-10
```

Qui:

* ogni colonna ha un significato
* ogni riga segue la stessa struttura
* il DB sa che `data_nascita` è una data, non testo

👉 Questo è **dato strutturato**.

---

## 3️⃣ Cosa NON è dato strutturato

Esempi di **dati non strutturati**:

* un testo libero
* un PDF
* una email
* una foto
* un audio

📌 In questi casi **non esiste uno schema fisso**.

---

## 4️⃣ Dato semi-strutturato

Esiste anche una via di mezzo 👇

### 🔹 JSON / XML

```json
{
  "id": 1,
  "nome": "Mario",
  "voto": 28
}
```

* c’è una struttura
* ma **non è rigida come una tabella SQL**

👉 si chiama **dato semi-strutturato**.

---

## 5️⃣ Confronto rapido

| Tipo di dato     | Struttura fissa | Schema     | Esempio              |
| ---------------- | --------------- | ---------- | -------------------- |
| Strutturato      | ✅ sì            | Rigido     | Tabelle SQL          |
| Semi-strutturato | ⚠️ parziale     | Flessibile | JSON, XML            |
| Non strutturato  | ❌ no            | Nessuno    | PDF, testo, immagini |

---

## 6️⃣ Perché il dato strutturato è importante

Perché permette:

* query SQL veloci (`SELECT`, `JOIN`)
* controlli di integrità
* coerenza dei dati
* report e statistiche affidabili

👉 È il **pane quotidiano dei database relazionali**.

---

## 7️⃣ In una frase da esame

📌 **Un dato strutturato è un dato organizzato secondo uno schema predefinito, tipicamente in tabelle, che consente un’elaborazione automatica e interrogazioni efficienti.**

---

SQL **nasce proprio per i dati strutturati** perché è stato pensato per lavorare su dati che hanno **ordine, schema e relazioni ben definite**.
Vediamolo in modo logico e semplice.

---

## 1️⃣ SQL nasce insieme al modello relazionale

SQL (anni ’70) nasce per **implementare il modello relazionale di Codd**, che prevede:

* dati organizzati in **tabelle**
* colonne con **significato e tipo fisso**
* righe tutte uguali nella forma
* relazioni tra tabelle

👉 Questo è **esattamente** il concetto di dato strutturato.

---

## 2️⃣ SQL lavora su uno schema fisso

In SQL:

```sql
CREATE TABLE Studenti (
  id INT,
  nome VARCHAR(50),
  data_nascita DATE
);
```

Qui viene definito **prima**:

* quante colonne esistono
* che tipo di dato contengono
* quali regole devono rispettare

📌 Senza struttura **SQL non avrebbe senso**.

---

## 3️⃣ Le query SQL presuppongono struttura

Una query SQL funziona solo se:

* i campi sono noti
* le relazioni sono chiare
* i dati sono confrontabili

```sql
SELECT nome, data_nascita
FROM Studenti
WHERE data_nascita < '2005-01-01';
```

👉 Questa query è possibile **solo perché il dato è strutturato**:

* `nome` è testo
* `data_nascita` è una data
* la colonna esiste per tutte le righe

---

## 4️⃣ SQL usa operazioni matematiche sui dati

SQL permette:

* ordinamenti (`ORDER BY`)
* aggregazioni (`SUM`, `AVG`, `COUNT`)
* confronti (`>`, `<`, `=`)

Esempio:

```sql
SELECT AVG(voto) FROM Esami;
```

📌 Queste operazioni funzionano **solo su dati omogenei e strutturati**.

---

## 5️⃣ Le JOIN esistono solo con dati strutturati

Il cuore di SQL sono le **JOIN**:

```sql
SELECT s.nome, e.voto
FROM Studenti s
JOIN Esami e ON s.id = e.id_studente;
```

👉 Le JOIN funzionano perché:

* le colonne hanno lo stesso significato
* i valori sono confrontabili
* esistono chiavi e vincoli

📌 Senza struttura, **non potresti collegare nulla**.

---

## 6️⃣ Vincoli e integrità

SQL nasce per garantire:

* **integrità dei dati**
* **coerenza**
* **assenza di errori logici**

```sql
id INT PRIMARY KEY,
voto INT CHECK (voto BETWEEN 18 AND 30)
```

👉 Questi controlli sono possibili **solo con dati strutturati**.

---

## 7️⃣ Perché non funziona bene con dati non strutturati

Un testo libero o un PDF:

* non ha colonne
* non ha tipi
* non ha relazioni
* non ha regole

📌 SQL può **salvarli** (come BLOB o TEXT)
📌 ma **non può capirli né analizzarli nativamente**

---

## 8️⃣ Sintesi concettuale

SQL nasce per dati strutturati perché:

1. richiede uno **schema**
2. lavora su **tabelle e colonne**
3. usa **operazioni logiche e matematiche**
4. sfrutta **relazioni e vincoli**
5. garantisce **coerenza e affidabilità**

---

## 9️⃣ Frase perfetta da interrogazione

📌 **SQL nasce per i dati strutturati perché presuppone uno schema fisso, dati omogenei e relazioni esplicite, elementi indispensabili per interrogazioni, aggregazioni e controlli di integrità efficienti.**

---

## Elementi fondamentali del linguaggio SQL

Possiamo suddividere il linguaggio SQL in cinque categorie principali, ognuna con uno scopo specifico all'interno del ciclo di vita dei dati.

---

### 1. DDL – Data Definition Language

Si occupa della **struttura** del database. Serve a definire, modificare o eliminare gli schemi, le tabelle e gli indici (l'ossatura, non il contenuto).

* **CREATE**: Crea nuovi oggetti (database, tabelle, viste).
* **ALTER**: Modifica la struttura di un oggetto esistente (es. aggiunge una colonna).
* **DROP**: Elimina definitivamente un oggetto e il suo contenuto.
* **TRUNCATE**: Svuota una tabella di tutti i record, ma mantiene la struttura.

### 2. DML – Data Manipulation Language

Si occupa della **gestione dei dati** all'interno delle tabelle. È il "motore" che permette di popolare e aggiornare le informazioni.

* **INSERT**: Inserisce nuove righe (tuple) in una tabella.
* **UPDATE**: Modifica i valori nelle righe esistenti.
* **DELETE**: Rimuove righe specifiche da una tabella.

### 3. DQL – Data Query Language

È la componente più utilizzata. Serve esclusivamente a **interrogare** il database per estrarre informazioni.

* **SELECT**: Recupera i dati da una o più tabelle. È il comando che permette di filtrare, ordinare e aggregare i risultati.
> *Nota: Spesso il comando SELECT viene raggruppato sotto il DML, ma data la sua importanza e specificità, viene quasi sempre trattato come categoria a sé (DQL).*



### 4. DCL – Data Control Language

Si occupa della **sicurezza** e dei permessi. Definisce chi può fare cosa all'interno del database.

* **GRANT**: Concede privilegi agli utenti (es. permesso di sola lettura).
* **REVOKE**: Revoca i privilegi precedentemente concessi.

### 5. TCL – Transaction Control Language

Gestisce le **transazioni**, ovvero sequenze di operazioni che devono essere trattate come un'unica unità di lavoro "atomica" (o vanno tutte a buon fine, o nessuna).

* **COMMIT**: Rende permanenti le modifiche effettuate durante la transazione.
* **ROLLBACK**: Annulla le modifiche se qualcosa è andato storto, riportando il DB allo stato precedente.
* **SAVEPOINT**: Crea punti di ripristino intermedi all'interno di una transazione.

---

### Tabella Riassuntiva

| Categoria | Scopo Principale      | Comandi Chiave               |
| --------- | --------------------- | ---------------------------- |
| **DDL**   | Struttura (Schema)    | `CREATE`, `ALTER`, `DROP`    |
| **DML**   | Contenuto (Dati)      | `INSERT`, `UPDATE`, `DELETE` |
| **DQL**   | Interrogazione        | `SELECT`                     |
| **DCL**   | Sicurezza/Permessi    | `GRANT`, `REVOKE`            |
| **TCL**   | Integrità/Transazioni | `COMMIT`, `ROLLBACK`         |

