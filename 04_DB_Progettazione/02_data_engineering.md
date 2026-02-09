# Ingegneria del dato

### (versione didattica per corso DB + Python)

### Idea chiave da trasmettere agli studenti

> **L’ingegneria del dato è l’arte di portare i dati “grezzi” a diventare dati “utilizzabili”**
> in modo **corretto, efficiente e ripetibile**.

Non analizza i dati (quello viene dopo),
**li prepara bene**.

---

## 1️⃣ Ruolo dell’ingegneria del dato nel corso

Nel tuo corso l’ingegneria del dato:

* **parte dal database**
* **usa Python come strumento operativo**
* **prepara i dati per analisi, report e applicazioni**

Schema mentale semplice per gli studenti:

```
Sorgenti dati → Database → Python → Dati puliti e pronti
```

---

## 2️⃣ Fondamenti database (base dell’ingegneria del dato)

### Concetti chiave da collegare all’ingegneria del dato

* Tabelle, record, attributi
* Chiavi primarie e chiavi esterne
* Integrità referenziale
* Tipi di dato
* Normalizzazione (almeno 1NF–3NF)
* Query SQL (SELECT, JOIN, GROUP BY)

### Messaggio didattico importante

> Un Data Engineer **ragiona prima in termini di modello dati**,
> poi scrive codice.

Esempio concettuale:

* “Posso importare questi dati?”
* “Sono coerenti?”
* “Posso collegarli ad altre tabelle?”

---

## 3️⃣ Python come strumento di ingegneria del dato

Python **non sostituisce il database**, lo **potenzia**.

### Usi principali nel corso

* Lettura dati da file (CSV, JSON)
* Connessione al DB
* Trasformazione dei dati
* Controllo qualità
* Automazione

---

## 4️⃣ Pipeline semplificata (ETL didattica)

Introdurre **ETL** in modo leggero e concreto:

### E – Extract (estrazione)

* File CSV
* File JSON
* Database

```python
import csv
```

oppure

```python
import json
```

---

### T – Transform (trasformazione)

* Pulizia dati
* Conversione tipi
* Controlli di coerenza
* Arricchimento

Esempi didattici:

* Date come stringhe → date reali
* Campi vuoti → NULL
* Codici duplicati → errore

```python
if eta < 0:
    raise ValueError("Età non valida")
```

---

### L – Load (caricamento)

* Inserimento nel database
* Uso di transazioni
* Rollback in caso di errore

```python
INSERT INTO studenti (...)
```

Messaggio chiave:

> Il database **deve restare consistente**,
> anche se il file di origine è sporco.

---

## 5️⃣ Qualità del dato (tema fondamentale)

Qui l’ingegneria del dato diventa “seria”.

### Concetti da introdurre

* Dati mancanti
* Dati duplicati
* Dati incoerenti
* Vincoli violati

Esempio didattico:

* Uno studente senza matricola
* Un voto fuori range
* Un esame senza studente

---

## 6️⃣ Ingegneria del dato ≠ Analisi dei dati

Chiarire bene la differenza:

| Ingegneria del dato | Analisi dei dati |
| ------------------- | ---------------- |
| Prepara i dati      | Studia i dati    |
| Controlla qualità   | Fa statistiche   |
| Usa DB + Python     | Usa grafici, ML  |

Frase da ricordare agli studenti:

> “Se i dati sono sbagliati, **l’analisi sarà sbagliata**, anche se il codice è perfetto.”

---

## 7️⃣ Esempio didattico completo (mini-caso)

### Scenario

* File `studenti.csv`
* Database `scuola`

### Obiettivi

* Importare studenti
* Validare dati
* Inserire solo quelli corretti

### Competenze coinvolte

* File system
* Python
* SQL
* Transazioni
* Controlli

Questo **è ingegneria del dato**, anche senza Big Data.

---

## 8️⃣ Obiettivo formativo del corso

Alla fine del corso lo studente deve saper:

* leggere dati da fonti diverse
* capire se i dati sono affidabili
* progettare tabelle corrette
* usare Python per automatizzare
* caricare dati senza “rompere” il database

---

## 9️⃣ Messaggio finale per gli studenti

> Prima di fare grafici, intelligenza artificiale o machine learning
> bisogna **saper costruire dati buoni**.

---

