---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
theme: Gaia
---

# Normalizzazione

Parliamo ora di "Normalizzazione", un processo chiave nella progettazione di database relazionali. La normalizzazione è un insieme di regole e linee guida che mirano a organizzare i dati in modo efficiente, riducendo la duplicazione e garantendo l'integrità dei dati.

---

### Obiettivo della Normalizzazione

1. **Obiettivo della Normalizzazione:** L'obiettivo principale della normalizzazione è eliminare la ridondanza dei dati e garantire che le dipendenze funzionali siano gestite in modo appropriato. Ciò contribuisce a evitare problemi come l'inserimento, la modifica o la cancellazione di dati che potrebbero portare a inconsistenze.

---

La **normalizzazione** è il processo con cui progettiamo le tabelle di un database relazionale per:

✅ evitare ridondanza dei dati
✅ prevenire anomalie (inserimento, aggiornamento, cancellazione)
✅ rendere il modello più chiaro e manutenibile

Vediamo le forme normali con esempi semplici, pensati per programmatori junior.

---

# ✅ **Prima Forma Normale (1NF)**

👉 **Regola:** ogni campo deve contenere un valore *atomico* (singolo, non scomponibile).
👉 Niente liste, array o campi multipli nella stessa colonna.

---

## ❌ Tabella NON in 1NF

| StudenteID | Nome        | Telefoni       |
| ---------- | ----------- | -------------- |
| 1          | Mario Rossi | 333111, 333222 |

**Problema:** la colonna *Telefoni* contiene più valori.

---

## ✅ Soluzione in 1NF

| StudenteID | Nome        |
| ---------- | ----------- |
| 1          | Mario Rossi |

| TelefonoID | StudenteID | Telefono |
| ---------- | ---------- | -------- |
| 1          | 1          | 333111   |
| 2          | 1          | 333222   |

👉 Abbiamo separato i dati ripetuti in un’altra tabella (relazione 1-N).

---

# ✅ **Seconda Forma Normale (2NF)**

👉 **Regola:**

* deve essere già in 1NF
* ogni attributo non chiave deve dipendere dall’intera chiave primaria (non solo da una parte)

⚠️ Il problema nasce soprattutto con **chiavi composte**.

---

## ❌ Tabella NON in 2NF

| StudenteID | CorsoID | NomeStudente | NomeCorso |
| ---------- | ------- | ------------ | --------- |

Chiave primaria: **(StudenteID, CorsoID)**

**Problema:**

* NomeStudente dipende solo da StudenteID
* NomeCorso dipende solo da CorsoID

👉 Dipendenze parziali.

---

## ✅ Soluzione in 2NF

**Studenti**
| StudenteID | NomeStudente |

**Corsi**
| CorsoID | NomeCorso |

**Iscrizioni**
| StudenteID | CorsoID |

👉 Separiamo ciò che non dipende dalla chiave composta.

---

# ✅ **Terza Forma Normale (3NF)**

👉 **Regola:**

* deve essere in 2NF
* nessuna dipendenza transitiva tra attributi non chiave

💡 Dipendenza transitiva = un campo dipende da un altro campo non chiave.

---

## ❌ Tabella NON in 3NF

| StudenteID | CittàID | NomeStudente | NomeCittà | CAP |
| ---------- | ------- | ------------ | --------- | --- |

**Problema:**

* StudenteID → CittàID
* CittàID → NomeCittà, CAP

👉 NomeCittà e CAP dipendono indirettamente da StudenteID (dipendenza transitiva).

---

## ✅ Soluzione in 3NF

**Studenti**
| StudenteID | NomeStudente | CittàID |

**Città**
| CittàID | NomeCittà | CAP |

👉 Ogni attributo dipende solo dalla chiave della sua tabella.

---

# ✅ **Forma Normale di Boyce-Codd (BCNF)**

👉 Versione più rigorosa della 3NF
👉 **Regola:** per ogni dipendenza funzionale X → Y, X deve essere una chiave candidata

💡 Serve a eliminare casi rari ma insidiosi che la 3NF non risolve.

---

## ❌ Esempio NON in BCNF

| Docente | Corso | Aula |

Regole:

* Docente → Aula (ogni docente usa sempre la stessa aula)
* Corso → Docente

Chiave candidata: **Corso**

👉 Ma esiste Docente → Aula dove Docente NON è chiave → violazione BCNF

---

## ✅ Soluzione BCNF

**Docenti**
| Docente | Aula |

**Corsi**
| Corso | Docente |

---

# 🎯 **Riassunto veloce per studenti**

| Forma    | Obiettivo                                     |
| -------- | --------------------------------------------- |
| **1NF**  | Campi atomici                                 |
| **2NF**  | Niente dipendenze parziali da chiavi composte |
| **3NF**  | Niente dipendenze transitive                  |
| **BCNF** | Ogni dipendenza parte da una chiave candidata |

---

# 💡 Consiglio pratico (molto importante)

Nella realtà:

✅ 3NF è quasi sempre sufficiente
✅ BCNF si usa in progettazioni più complesse
⚠️ A volte si *denormalizza* per performance (report, analytics)


---

### Esempio di Normalizzazione

3. **Esempio di Normalizzazione:** Consideriamo una tabella degli studenti che contiene informazioni sia sugli studenti che sui corsi a cui sono iscritti. Una progettazione non normalizzata potrebbe includere duplicazione di dati, ad esempio ripetendo il nome del corso per ogni studente iscritto. Normalizzando la struttura, si creerebbero tabelle separate per studenti e corsi, con una tabella di associazione che collega gli studenti ai corsi in cui sono iscritti.

---

### Vantaggi della Normalizzazione

4. **Vantaggi della Normalizzazione:** I principali vantaggi della normalizzazione includono la riduzione della ridondanza dei dati, la gestione più efficiente delle modifiche ai dati, la facilità di mantenimento e la prevenzione di anomalie dei dati.

---

### Considerazioni nella Progettazione

5. **Considerazioni nella Progettazione:** Mentre la normalizzazione è importante, è anche cruciale bilanciarla con la necessità di prestazioni ottimali in alcune situazioni. In alcuni casi, potrebbe essere necessario denormalizzare parte del database per migliorare le prestazioni delle query.

---

La normalizzazione è una pratica chiave nella progettazione di basi di dati relazionali, e una comprensione approfondita delle forme normali aiuta a garantire una struttura di database efficiente e resistente agli errori.

---

La normalizzazione è un processo di progettazione delle tabelle in un database relazionale, mirato a ridurre la ridondanza dei dati e migliorare l'integrità.

---

### Esempio di Normalizzazione

- **Esempio di Normalizzazione:** Consideriamo una tabella che registra informazioni sugli studenti, tra cui il corso di studi e il professore assegnato. 
- Se il professore è associato solo al corso di studi e non a uno specifico studente, potremmo avere una ridondanza. 
- In questo caso, la normalizzazione potrebbe prevedere la creazione di una tabella separata per i corsi e i professori, collegata alla tabella degli studenti attraverso le chiavi.

---

### Tabella originale

| StudenteID | Nome  | CorsoDiStudi | Professore    |
| ---------- | ----- | ------------ | ------------- |
| 1          | Mario | Informatica  | Prof. Rossi   |
| 2          | Laura | Fisica       | Prof. Bianchi |
| 3          | Carlo | Chimica      | Prof. Rossi   |

---

### Tabella normalizzata

| CorsoDiStudi | Professore    |
| ------------ | ------------- |
| Informatica  | Prof. Rossi   |
| Fisica       | Prof. Bianchi |
| Chimica      | Prof. Rossi   |

---

| StudenteID | Nome  | CorsoDiStudi |
| ---------- | ----- | ------------ |
| 1          | Mario | Informatica  |
| 2          | Laura | Fisica       |
| 3          | Carlo | Chimica      |

---

#### elimina la ridondanza dei dati

Questa normalizzazione elimina la ridondanza dei dati e semplifica la gestione delle informazioni sui corsi e sui professori.

La normalizzazione è un concetto chiave per garantire la struttura efficiente e senza ridondanze di un database, contribuendo a migliorare l'integrità e la facilità di manutenzione dei dati.
