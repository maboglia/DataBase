# Entity Relation

I diagrammi Entità-Relazione (ER) sono utilizzati per modellare la struttura dei dati in un sistema informatico. Questi diagrammi forniscono una rappresentazione visuale delle entità all'interno del sistema e delle relazioni tra di esse. Ecco alcuni concetti chiave nei diagrammi ER:

1. **Entità:**
   - Un'entità rappresenta un oggetto o un concetto del mondo reale che può essere identificato e memorizzato nei dati. Ad esempio, "Cliente" o "Prodotto" possono essere entità.

2. **Attributi:**
   - Gli attributi sono le caratteristiche o le proprietà che descrivono un'entità. Ad esempio, un'entità "Cliente" può avere attributi come "Nome", "Indirizzo" e "Numero di Telefono".

3. **Relazioni:**
   - Le relazioni indicano le connessioni tra due o più entità. Possono essere di diversi tipi, come "uno a uno", "uno a molti" o "molti a molti". Ad esempio, una relazione tra "Cliente" e "Ordine" può essere "uno a molti", indicando che un cliente può effettuare molti ordini.

4. **Cardinalità:**
   - La cardinalità indica il numero di entità associate attraverso una relazione. Può essere "uno", "zero o uno", "zero o molti", "uno o molti", a seconda di quanti elementi possono essere collegati da entrambe le parti della relazione.

Esempio di un diagramma ER semplice:

```plaintext
[Cliente] --- (effettua) --- (ha) --- [Ordine] --- (contiene) --- (appartiene) --- [Prodotto]
```

In questo esempio:

- "Cliente" è un'entità con attributi come Nome e Numero di Telefono.
- "Ordine" è un'entità con attributi come Data dell'Ordine e Importo Totale.
- "Prodotto" è un'entità con attributi come Nome del Prodotto e Prezzo.
- Le relazioni indicano come le entità sono collegate tra loro. Ad esempio, un cliente può effettuare molti ordini, ma un ordine appartiene a un solo cliente.

Questo è solo un esempio, e la complessità dei diagrammi ER può aumentare in base alla complessità del sistema che si sta modellando. Tuttavia, questi concetti di base rimangono fondamentali per comprendere la struttura delle entità e le loro relazioni.

---

![ER Diagram](https://github.com/maboglia/ProgrammingResources/blob/master/images/internet-sales-model.png?raw=true)

---

## simboli

Nei diagrammi Entità-Relazione (ER), vengono utilizzati diversi simboli per rappresentare gli elementi chiave come entità, attributi, relazioni e cardinalità. Ecco alcuni dei simboli comuni utilizzati nei diagrammi ER:

1. **Entità:**
   - Rappresentata da un rettangolo. All'interno del rettangolo viene inserito il nome dell'entità.

   ![Simbolo Entità](http://linuxdidattica.org/docs/fb_db/figures/esempioER.png)

2. **Attributo:**
   - Rappresentato da un'ellisse o un ovale. Viene inserito il nome dell'attributo all'interno dell'ovale e può includere il tipo di dato.

   ![Simbolo Attributo](http://linuxdidattica.org/docs/fb_db/figures/attributo.png)

3. **Relazione:**
   - Rappresentata da una linea che collega due entità coinvolte nella relazione. La relazione può essere annotata con un nome che descrive la natura della relazione.

   ![Simbolo Relazione](http://linuxdidattica.org/docs/fb_db/figures/alunnoclassebis.png)

4. **Cardinalità:**
   - Viene utilizzato per indicare il numero di occorrenze associate attraverso una relazione. I simboli comuni includono:
     - 1 (uno) - Indica una relazione uno a uno.
     - M (molti) - Indica una relazione uno a molti.
     - 0..1 (zero o uno) - Indica una relazione opzionale da uno a uno.
     - 0..M (zero o molti) - Indica una relazione opzionale da uno a molti.

   ![Simboli Cardinalità](http://linuxdidattica.org/docs/fb_db/figures/alunnoclasseer.png)

5. **Chiave Primaria:**
   - Viene indicata sottolineando l'attributo che funge da chiave primaria all'interno dell'entità.


6. **Chiave Esterna:**
   - Viene indicata sottolineando l'attributo che funge da chiave esterna all'interno di un'entità che partecipa a una relazione.


7. **Azione sulle Relazioni:**
   - Viene utilizzato per indicare azioni come "cascata" o "imposta a NULL" in caso di eliminazione o aggiornamento di una relazione.


8. **Ruolo:**
   - Può essere utilizzato per specificare il ruolo di un'entità nella relazione.


9. **Attributo Derivato:**
   - Viene indicato da un'ellisse con una "D" al suo interno e rappresenta un attributo il cui valore può essere derivato da altri attributi.


Ricorda che la notazione può variare leggermente in base agli standard specifici o alle preferenze del progettista, ma questi sono i simboli generalmente accettati nei diagrammi ER.

---

## Chiavi candidate

Una chiave candidata in un modello relazionale di un database è un insieme minimo di attributi che può essere utilizzato per identificare univocamente una tupla all'interno di una relazione. L'insieme di attributi deve soddisfare due requisiti:

1. **Unicità:** Ogni combinazione di valori nell'insieme di attributi deve identificare in modo univoco una tupla all'interno della relazione. Non può esistere un'altra tupla con gli stessi valori in quegli attributi.

2. **Irreducibilità:** Nessun sottoinsieme dell'insieme di attributi può garantire unicità. In altre parole, se si rimuove qualsiasi attributo dall'insieme, non è più possibile garantire l'identificazione univoca delle tuple.

Le chiavi candidate sono importanti perché forniscono le basi per la determinazione della chiave primaria di una relazione. La chiave primaria è selezionata da tra le chiavi candidate per rappresentare in modo univoco ogni tupla all'interno della relazione.

Ecco un esempio pratico:

Supponiamo di avere una relazione "Studente" con gli attributi "Matricola", "Nome", e "Cognome". L'insieme di attributi {"Matricola"} potrebbe essere una chiave candidata poiché soddisfa i requisiti di unicità e irreducibilità. Tuttavia, anche l'insieme di attributi {"Nome", "Cognome"} potrebbe essere una chiave candidata se ogni studente ha un nome e un cognome unici all'interno della relazione.

La scelta della chiave primaria da tra le chiavi candidate dipenderà dalle esigenze specifiche del database e del sistema che si sta progettando.
