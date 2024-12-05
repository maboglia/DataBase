# Domande e risposte

---

## Domanda 1: Cos'è una relazione nel modello relazionale?

Una relazione nel modello relazionale è una tabella che organizza i dati in righe (tuple) e colonne (attributi). Ogni riga rappresenta un'istanza di dati, e ogni colonna definisce un attributo specifico di tali dati.

---

## Domanda 2: Qual è la differenza tra chiave primaria e chiave esterna?

- **Chiave Primaria:** Identifica univocamente ogni tupla nella relazione. Deve essere unica e non nulla.

- **Chiave Esterna:** Collegamento tra due tabelle. È la chiave primaria di una tabella utilizzata come attributo in un'altra tabella per stabilire una relazione tra di esse.

---

## Domanda 3: Come si esegue una selezione nel modello relazionale?

La selezione nel modello relazionale coinvolge l'estrazione di tuple che soddisfano una determinata condizione. Ad esempio:

```sql
SELECT * FROM Studenti WHERE Corso = 'Informatica';
```

Questa query restituirebbe tutte le tuple degli studenti iscritti al corso di Informatica.

---

## Domanda 4: In che modo il modello relazionale gestisce l'integrità dei dati?

Il modello relazionale utilizza chiavi primarie, chiavi esterne e vincoli per garantire l'integrità dei dati. La chiave primaria assicura l'unicità, mentre le chiavi esterne creano relazioni tra tabelle. I vincoli imposti dal DBMS evitano operazioni che potrebbero violare l'integrità referenziale.

---

## Domanda 5: Come funziona l'operazione di join nel modello relazionale?

L'operazione di join combina tuple da due relazioni correlate. Ad esempio:

```sql
SELECT * FROM Studenti JOIN Corsi ON Studenti.Corso = Corsi.CorsoID;
```

Questa query restituirebbe tutte le informazioni sugli studenti e sui corsi correlati attraverso le rispettive chiavi.

---

## Domanda 6: Quali sono i vantaggi della flessibilità del modello relazionale?

La flessibilità del modello relazionale consente di adattare facilmente la struttura dei dati alle esigenze dell'organizzazione. È possibile modificare gli schemi logici senza influire sugli utenti finali, garantendo una gestione più agevole delle informazioni.

---

## Domanda 7: Cosa significa "complessità delle query" come svantaggio?

La complessità delle query si riferisce al fatto che alcune interrogazioni possono richiedere più operazioni per ottenere i risultati desiderati. Ciò potrebbe rendere le query più lunghe o complesse da scrivere, soprattutto in confronto a modelli meno strutturati.

---

## Domanda 8: Come affrontare le prestazioni in caso di grandi dati?

Nel caso di grandi dataset, il modello relazionale potrebbe mostrare inefficienze nelle prestazioni. Per affrontare ciò, è possibile ottimizzare gli indici, implementare partizioni di tabelle e utilizzare tecniche di caching per migliorare le prestazioni del sistema.

---

## Domanda 9: Quali sono le alternative al modello relazionale?

Esistono diverse alternative al modello relazionale, tra cui il modello gerarchico, reticolare e il modello ad oggetti. Inoltre, si stanno sempre più diffondendo modelli NoSQL, come document-store, grafo, e wide-column store, adatti a contesti specifici.

---

## Domanda 10: Come garantire l'indipendenza dei dati nel modello relazionale?

L'indipendenza dei dati nel modello relazionale è garantita attraverso la suddivisione in livelli di astrazione. L'indipendenza fisica consente di interagire con il DBMS indipendentemente dalla struttura fisica dei dati. L'indipendenza logica consente di interagire con il livello esterno in modo indipendente dal livello logico.
