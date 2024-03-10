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

   ![Simbolo Entità](https://i.imgur.com/Za9QcGW.png)

2. **Attributo:**
   - Rappresentato da un'ellisse o un ovale. Viene inserito il nome dell'attributo all'interno dell'ovale e può includere il tipo di dato.

   ![Simbolo Attributo](https://i.imgur.com/w2IY5Fv.png)

3. **Relazione:**
   - Rappresentata da una linea che collega due entità coinvolte nella relazione. La relazione può essere annotata con un nome che descrive la natura della relazione.

   ![Simbolo Relazione](https://i.imgur.com/0Esiq1L.png)

4. **Cardinalità:**
   - Viene utilizzato per indicare il numero di occorrenze associate attraverso una relazione. I simboli comuni includono:
     - 1 (uno) - Indica una relazione uno a uno.
     - M (molti) - Indica una relazione uno a molti.
     - 0..1 (zero o uno) - Indica una relazione opzionale da uno a uno.
     - 0..M (zero o molti) - Indica una relazione opzionale da uno a molti.

   ![Simboli Cardinalità](https://i.imgur.com/zkQPUln.png)

5. **Chiave Primaria:**
   - Viene indicata sottolineando l'attributo che funge da chiave primaria all'interno dell'entità.

   ![Chiave Primaria](https://i.imgur.com/JPlxrBk.png)

6. **Chiave Esterna:**
   - Viene indicata sottolineando l'attributo che funge da chiave esterna all'interno di un'entità che partecipa a una relazione.

   ![Chiave Esterna](https://i.imgur.com/nzKwYmN.png)

7. **Azione sulle Relazioni:**
   - Viene utilizzato per indicare azioni come "cascata" o "imposta a NULL" in caso di eliminazione o aggiornamento di una relazione.

   ![Azione sulle Relazioni](https://i.imgur.com/mldInwF.png)

8. **Ruolo:**
   - Può essere utilizzato per specificare il ruolo di un'entità nella relazione.

   ![Ruolo](https://i.imgur.com/ZCc7Yih.png)

9. **Attributo Derivato:**
   - Viene indicato da un'ellisse con una "D" al suo interno e rappresenta un attributo il cui valore può essere derivato da altri attributi.

   ![Attributo Derivato](https://i.imgur.com/Zs2cPbi.png)

Ricorda che la notazione può variare leggermente in base agli standard specifici o alle preferenze del progettista, ma questi sono i simboli generalmente accettati nei diagrammi ER.
