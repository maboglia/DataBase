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

### Forme Normali

2. **Forme Normali:** La normalizzazione viene comunemente descritta in diverse forme normali (1NF, 2NF, 3NF, BCNF, ecc.). Ogni forma normale introduce regole specifiche per garantire una struttura dati ben progettata.


---

   - **Prima Forma Normale (1NF):** Ogni colonna in una tabella deve contenere solo valori atomici (non decomponibili) e ogni cella della tabella deve contenere un singolo valore.
   

---

   - **Seconda Forma Normale (2NF):** Una tabella è in 2NF se è in 1NF e se tutte le colonne non chiave dipendono completamente dalla chiave primaria.


---

   - **Terza Forma Normale (3NF):** Una tabella è in 3NF se è in 2NF e se non esistono dipendenze transitiva tra le colonne non chiave.


---

   - **Forma Normale di Boyce-Codd (BCNF):** Una forma più avanzata che estende la 3NF, eliminando le dipendenze funzionali non banali su chiavi candidate.

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

### Obiettivo della Normalizzazione

1. **Obiettivo della Normalizzazione:** L'obiettivo principale della normalizzazione è eliminare la duplicazione e la ridondanza dei dati, garantendo al contempo che le informazioni siano mantenute in modo coerente. Una progettazione normalizzata facilita l'aggiornamento dei dati, riduce il rischio di errori e semplifica le operazioni di interrogazione.

---

### Forme Normali

2. **Forme Normali:** La normalizzazione si basa su una serie di regole definite come forme normali. Le più comuni sono la Prima Forma Normale (1NF), la Seconda Forma Normale (2NF), e la Terza Forma Normale (3NF).


---

   - **1NF:** Ogni colonna in una tabella deve contenere solo valori atomici, e ogni cella della tabella deve contenere un singolo valore, non una lista o un set di valori.


---

   - **2NF:** Deve essere in 1NF e ogni non-chiave deve dipendere completamente dalla chiave primaria.


---

   - **3NF:** Deve essere in 2NF e non deve esistere dipendenza transitiva, ovvero una colonna non chiave non deve dipendere da altre colonne non chiave.

---

### Esempio di Normalizzazione

3. **Esempio di Normalizzazione:** Consideriamo una tabella che registra informazioni sugli studenti, tra cui il corso di studi e il professore assegnato. 
4. Se il professore è associato solo al corso di studi e non a uno specifico studente, potremmo avere una ridondanza. 
5. In questo caso, la normalizzazione potrebbe prevedere la creazione di una tabella separata per i corsi e i professori, collegata alla tabella degli studenti attraverso le chiavi.

---

### Tabella originale

| StudenteID | Nome    | CorsoDiStudi | Professore     |
|------------|---------|--------------|----------------|
| 1          | Mario   | Informatica  | Prof. Rossi    |
| 2          | Laura   | Fisica       | Prof. Bianchi  |
| 3          | Carlo   | Chimica       | Prof. Rossi    |

---

### Tabella normalizzata

| CorsoDiStudi | Professore     |
|--------------|----------------|
| Informatica  | Prof. Rossi    |
| Fisica       | Prof. Bianchi  |
| Chimica      | Prof. Rossi    |

---


| StudenteID | Nome  | CorsoDiStudi |
|------------|-------|--------------|
| 1          | Mario | Informatica  |
| 2          | Laura | Fisica       |
| 3          | Carlo | Chimica      |

---

#### elimina la ridondanza dei dati

Questa normalizzazione elimina la ridondanza dei dati e semplifica la gestione delle informazioni sui corsi e sui professori.

La normalizzazione è un concetto chiave per garantire la struttura efficiente e senza ridondanze di un database, contribuendo a migliorare l'integrità e la facilità di manutenzione dei dati.
