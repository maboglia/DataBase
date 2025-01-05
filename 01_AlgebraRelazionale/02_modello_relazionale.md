# Introduzione al Modello Relazionale

---

## Definizione Generale

Il modello relazionale organizza i dati in tabelle chiamate relazioni, garantendo una rappresentazione chiara e strutturata. Ogni relazione contiene tuple con attributi, offrendo una modalità flessibile e comprensibile di organizzare le informazioni.

---

![modello relazionale](https://upload.wikimedia.org/wikipedia/commons/b/bf/Relational_Model.jpg)

---

## Struttura di una Relazione

Una relazione è rappresentata come una tabella con colonne (attributi) e righe (tuple). Ad esempio:

**Relazione: Studenti**

| Matricola | Nome       | Corso          |
|-----------|------------|----------------|
| 1         | Mario      | Informatica    |
| 2         | Laura      | Fisica         |
| 3         | Alessio    | Matematica     |

Ogni riga rappresenta una tupla, e ogni colonna è un attributo.

---

## Definizione di Relazioni

Per definire una relazione, si utilizza un linguaggio di definizione dei dati. Esempio in SQL:

```sql
CREATE TABLE Studenti (
  Matricola INT PRIMARY KEY,
  Nome VARCHAR(50),
  Corso VARCHAR(50)
);
```

---

## Operazioni nel Modello Relazionale

---

### Operazioni Principali

1. **Selezione:** Estrazione di tuple che soddisfano una condizione.

   ```sql
   SELECT * FROM Studenti WHERE Corso = 'Informatica';
   ```

2. **Proiezione:** Estrazione di colonne specifiche da una relazione.

   ```sql
   SELECT Nome FROM Studenti;
   ```

3. **Join:** Combinazione di tuple da relazioni correlate.

   ```sql
   SELECT * FROM Studenti JOIN Corsi ON Studenti.Corso = Corsi.CorsoID;
   ```

4. **Unione:** Combinazione di tuple da due relazioni.

   ```sql
   SELECT * FROM Studenti UNION SELECT * FROM Docenti;
   ```

---

## Vantaggi e Svantaggi del Modello Relazionale

---

## Vantaggi

1. **Semplicità di Utilizzo:** Struttura tabellare intuitiva.
2. **Integrità dei Dati:** Chiavi e vincoli garantiscono coerenza.
3. **Flessibilità:** Adattabile a diverse esigenze.

---

## Svantaggi

1. **Complessità delle Query:** Alcune query possono richiedere più operazioni.
2. **Prestazioni in Caso di Grandi Dati:** Inefficienze con dataset estremamente grandi.
3. **Flessibilità Limitata:** Non sempre ideale per modellare relazioni complesse.

---

## Sintesi

Il modello relazionale fornisce una struttura organizzata e chiara per la gestione dei dati, con una corretta progettazione e uso delle operazioni. Le tabelle e le relazioni offrono un'ottima visualizzazione delle informazioni.

---

## Il modello più diffuso

Il **modello relazionale** è uno dei modelli di basi di dati più utilizzati e diffusi, proposto da [Edgar F. Codd](03_Codd.md) nel 1970. Questo modello rivoluzionò il campo della gestione dei dati, superando i limiti dei modelli precedenti, come il modello reticolare e il modello gerarchico, e introducendo il concetto di **indipendenza fisica dei dati**.

---

### 1. **Indipendenza Fisica dei Dati**

Nel modello relazionale, i dati sono gestiti a un livello **logico**, separato dalla loro rappresentazione **fisica**. Questo significa che l'utente e le applicazioni interagiscono con i dati senza preoccuparsi di come sono effettivamente memorizzati su disco o nei dispositivi di memoria. L'accesso avviene tramite concetti logici, come **tabelle** e **relazioni**, e non richiede conoscenze dettagliate sui percorsi di memorizzazione fisica (ad esempio, gli indirizzi di memoria). Questo approccio offre numerosi vantaggi, tra cui:

- **Indipendenza dai dettagli fisici**: permette di cambiare la rappresentazione fisica dei dati (ad esempio, spostare i dati su un altro disco) senza influire sull'accesso ai dati o sulle applicazioni che li utilizzano.
- **Flessibilità**: l'utente può lavorare con una rappresentazione astratta dei dati (come tabelle e colonne) senza preoccuparsi dei dettagli di implementazione fisica.

---

### 2. **Le Componenti del Modello Relazionale**

Il modello relazionale si basa su due componenti principali:

---

#### a. **Strutture per organizzare i dati**

I dati nel modello relazionale sono organizzati in **tabelle**. Ogni tabella rappresenta una **relazione** tra entità e consiste di:

- **Righe** (tuple o record): Ogni riga rappresenta una singola istanza dell'entità o relazione.
- **Colonne** (attributi): Ogni colonna rappresenta una proprietà specifica della relazione.
- Una **tabella** è quindi una struttura bidimensionale, con righe e colonne, che rappresenta un insieme di dati omogenei.

Esempio: Una tabella "Studenti" potrebbe contenere colonne come `ID_Studente`, `Nome`, `Cognome`, `Data_Nascita`.

---

#### b. **Vincoli di integrità**

I vincoli di integrità sono regole che assicurano che i dati inseriti nelle tabelle siano **corretti** e **consistenti** rispetto alla realtà modellata. I principali vincoli di integrità nel modello relazionale sono:

- **Integrità dell'entità**: ogni tupla in una tabella deve essere univoca e identificabile tramite una chiave primaria. La chiave primaria è un attributo (o un insieme di attributi) che identifica in modo univoco ogni riga della tabella.
- **Integrità referenziale**: assicura che le relazioni tra le tabelle siano coerenti. Per esempio, se una tabella "Ordini" fa riferimento a un "Cliente", allora ogni valore nella colonna del cliente deve corrispondere a un valore valido nella tabella "Clienti" (chiave esterna).
- **Domini**: ogni attributo ha un dominio specifico, che stabilisce i tipi di valori che possono essere associati a quel particolare attributo (ad esempio, un campo "Data_Nascita" può contenere solo date valide).

---

### 3. **Vantaggi del Modello Relazionale**

Il modello relazionale ha avuto un grande successo e diffusione grazie a vari vantaggi:

- **Semplicità**: L'organizzazione dei dati in tabelle è intuitiva e facile da comprendere.
- **Indipendenza fisica**: Gli utenti possono interagire con i dati senza preoccuparsi di come sono memorizzati fisicamente.
- **Flessibilità e scalabilità**: Le tabelle possono essere facilmente modificate per adattarsi a nuove esigenze senza compromettere il funzionamento complessivo del sistema.
- **Standardizzazione**: I linguaggi di interrogazione, come SQL (Structured Query Language), sono basati su questo modello, facilitando l'accesso e la manipolazione dei dati.

---

### 4. **Evoluzione e Adozione**

Nonostante la proposta iniziale di Codd avesse incontrato alcune difficoltà pratiche, specialmente nell'implementazione efficiente del modello, a partire dagli anni '80 il modello relazionale è diventato il paradigma dominante per la gestione dei dati. L'introduzione di sistemi di gestione di basi di dati relazionali (RDBMS) come **Oracle**, **MySQL**, **PostgreSQL**, e **Microsoft SQL Server** ha permesso una rapida diffusione del modello grazie anche alla standardizzazione del linguaggio SQL e ai miglioramenti nelle tecniche di ottimizzazione delle performance.

In sintesi, il **modello relazionale** è la base di gran parte delle applicazioni moderne di gestione dei dati, grazie alla sua semplicità, indipendenza fisica dei dati e l'efficace uso dei vincoli di integrità per garantire la coerenza e la qualità dei dati.
