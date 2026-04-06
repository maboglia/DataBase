# Dal modello concettuale al modello relazionale

Questa scheda didattica sintetizza i concetti fondamentali della **progettazione concettuale e logica** delle basi di dati.

---

## 1. La Progettazione Concettuale

[cite_start]L'obiettivo è rappresentare la realtà di interesse ad un alto livello di astrazione[cite: 1].

### Concetti Chiave

* [cite_start]**Modello:** Insieme di regole e strutture per rappresentare la realtà[cite: 2].
* [cite_start]**Schema:** La rappresentazione specifica di una realtà secondo un modello[cite: 2].
* [cite_start]**Astrazione:** Processo mentale che evidenzia proprietà rilevanti trascurando quelle non necessarie[cite: 2, 3].

### Primitive di Astrazione

1. [cite_start]**Classificazione:** Definisce una classe a partire da oggetti con proprietà comuni [es. Lunedì è membro della classe SETTIMANA](cite: 3).
2. [cite_start]**Generalizzazione:** Stabilisce una relazione tra una superclasse (es. PERSONA) e le sue sottoclassi [es. UOMO, DONNA](cite: 3, 4).
3. [cite_start]**Aggregazione:** Definisce un concetto a partire dalle sue parti componenti [es. BICICLETTA composta da RUOTA e PEDALE](cite: 5).

---

## 2. Il Modello Entity-Relationship (E/R)

[cite_start]È lo strumento principale per la progettazione concettuale[cite: 9].

### [cite_start]Elementi Base [cite: 9]

* **Entità:** Rappresenta classi di oggetti (es. STUDENTE).
* **Associazione (Relationship):** Legame logico tra entità (es. ESAME tra Studente e Corso).
* **Attributo:** Proprietà elementari di entità o associazioni (es. NOME, DATA).

### Cardinalità delle Associazioni

[cite_start]Indica il numero minimo e massimo di occorrenze di un'associazione a cui un'entità può partecipare[cite: 7].

* [cite_start]**Partecipazione:** Opzionale (min=0) o Obbligatoria [min > 0](cite: 7).
* [cite_start]**Tipi di associazione:** Uno-a-uno ($1:1$), Uno-a-molti ($1:N$), Molti-a-molti ($N:M$)[cite: 8].

---

## 3. Metodologie di Progetto

[cite_start]La costruzione di uno schema E/R è un processo incrementale che utilizza diverse strategie[cite: 22]:

| Strategia | Descrizione |
| :--- | :--- |
| **Top-Down** | [cite_start]Parte da concetti astratti e li raffina in concetti più semplici e dettagliati[cite: 44]. |
| **Bottom-Up** | [cite_start]Inizia da concetti elementari per costruire strutture più complesse e integrate[cite: 45]. |
| **Mixed** | [cite_start]Combina entrambi gli approcci, partendo da concetti chiave e raffinandoli o integrandoli[cite: 46, 47]. |

---

## 4. Progettazione Logica Relazionale

[cite_start]Consiste nella traduzione dello schema E/R in uno **schema relazionale** [tabelle](cite: 52).

### Regole di Traduzione Standard

1. [cite_start]**Entità:** Ogni entità diventa una tabella; la chiave primaria dell'entità diventa la chiave primaria della tabella[cite: 60].
2. [cite_start]**Associazioni Molti-a-Molti ($N:M$):** Diventano una nuova tabella contenente le chiavi primarie delle entità collegate (come chiavi esterne) e gli eventuali attributi dell'associazione[cite: 60].
3. [cite_start]**Associazioni Uno-a-Molti ($1:N$):** Solitamente si "compattano" aggiungendo la chiave dell'entità dal lato "1" come chiave esterna nella tabella dal lato "N"[cite: 64].
4. [cite_start]**Attributi Composti:** Vengono esplosi nei loro componenti semplici o trattati come un unico attributo atomico[cite: 59].

### [cite_start]Esempio di Traduzione [cite: 60]

* **Entità:** `Studente(Matricola, Nome)`
* **Entità:** `Corso(Codice, Titolo)`
* **Associazione ($N:M$):** `Esame(Matricola, Codice, Data, Voto)`
  * *Nota: `Matricola` e `Codice` sono Foreign Keys (FK) verso le rispettive tabelle.*
