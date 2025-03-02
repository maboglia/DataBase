---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Nuove Tendenze nei Database Relazionali

Parliamo ora delle "Nuove Tendenze nei Database Relazionali". Negli ultimi anni, sono emerse diverse nuove tendenze e tecnologie nel campo dei database relazionali che stanno influenzando la progettazione, lo sviluppo e la gestione dei database. Vediamone alcune:

---

## Database Cloud-Native

1. **Database Cloud-Native
   - L'adozione di soluzioni cloud-native per i database relazionali è in aumento. Questi database sono progettati specificamente per l'esecuzione su piattaforme cloud, sfruttando le caratteristiche di scalabilità, flessibilità e disponibilità offerte dai servizi cloud.

---

## Distributed SQL

2. **Distributed SQL
   - I database distribuiti sono progettati per funzionare su architetture distribuite e permettono la gestione dei dati su più nodi. Questi sistemi offrono scalabilità orizzontale e prestazioni elevate per applicazioni che richiedono elaborazione parallela su grandi set di dati.

---

## Nuovi Motori di

3. **Nuovi Motori di Archiviazione
   - Alcuni database relazionali stanno adottando nuovi motori di archiviazione per migliorare le prestazioni e la gestione dei dati. Ad esempio, motori di archiviazione columnar ottimizzati per le analisi o motori basati su log-structured per migliorare l'efficienza della scrittura.

---

## Uso Diffuso di

4. **Uso Diffuso di Machine Learning
   - L'integrazione di funzionalità di machine learning nei database relazionali sta diventando sempre più comune. Ciò consente l'analisi dei dati direttamente nel database, semplificando la creazione di modelli predittivi e l'estrazione di informazioni utili.

---

## Gestione Automatica delle

5. **Gestione Automatica delle Prestazioni
   - Gli strumenti di gestione dei database stanno diventando sempre più intelligenti, offrendo funzionalità di ottimizzazione automatica delle prestazioni. Questi strumenti possono analizzare il carico di lavoro, suggerire indici, ottimizzare le query e adattarsi dinamicamente alle variazioni nel carico di lavoro.

---

## Sicurezza Basata su

6. **Sicurezza Basata su Ruoli e Politiche
   - Le moderne soluzioni di database relazionali offrono avanzate funzionalità di sicurezza basate su ruoli e politiche. Ciò consente una gestione più granulare degli accessi, garantendo che gli utenti e le applicazioni possano accedere solo alle risorse autorizzate.

---

## Adozione di SQL

7. **Adozione di SQL Esteso e Supporto JSON
   - L'estensione del linguaggio SQL per supportare strutture di dati non relazionali come JSON è diventata sempre più comune. Ciò consente ai database relazionali di gestire dati strutturati e semistrutturati in modo più flessibile.

---

## RDBMS e NoSQL

8. **RDBMS e NoSQL
   - Molte organizzazioni stanno adottando un approccio ibrido, utilizzando sia database relazionali che NoSQL in base alle esigenze specifiche delle applicazioni. Questo approccio consente di combinare la coerenza dei database relazionali con la flessibilità dei database NoSQL.

---

## Containerization e Orchestrazione

9. **Containerization e Orchestrazione
   - L'uso di container e orchestrazione (come Docker e Kubernetes) sta diventando sempre più diffuso per implementare e gestire database relazionali in ambienti distribuiti e scalabili.

---

## Riduzione dell'Impatto

10. **Riduzione dell'Impatto Ambientale
    - Alcuni database relazionali stanno adottando politiche e tecnologie per ridurre il loro impatto ambientale, ottimizzando le risorse e migliorando l'efficienza energetica.

---

## Blockchain e DLT

11. **Blockchain e DLT (Distributed Ledger Technology)
    - L'integrazione di database relazionali con tecnologie blockchain e DLT sta emergendo, consentendo la gestione di dati sicuri, immutabili e distribuiti.

---

## Dati Temporali e

12. **Dati Temporali e Validità
    - L'interesse per la gestione dei dati temporali e la validità temporale è in aumento. I database relazionali stanno integrando funzionalità per gestire le variazioni temporali nei dati.

Queste tendenze riflettono l'evoluzione continua del settore dei database relazionali per soddisfare le esigenze delle moderne applicazioni e infrastrutture. L'adozione di queste nuove tecnologie può portare a miglioramenti significativi nelle prestazioni, nella sicurezza e nella gestione dei dati.

---

## Database NoSQL

---

Parliamo ora dei "Database NoSQL". I database NoSQL (Not Only SQL) sono sistemi di gestione di database progettati per gestire dati strutturati, semi-strutturati o non strutturati. Questi database sono utilizzati per affrontare sfide specifiche che potrebbero non essere ben gestite dai tradizionali database relazionali.

---

## Caratteristiche Principali

1. **Caratteristiche Principali
   - **Schema Flessibile:** I database NoSQL consentono di inserire dati senza la necessità di uno schema fisso, il che li rende adatti a situazioni in cui la struttura dei dati è variabile o sconosciuta.
   - **Distribuzione Orizzontale:** Molti database NoSQL sono progettati per supportare la distribuzione orizzontale su più nodi, consentendo una maggiore scalabilità rispetto ai database relazionali.
   - **Alta Disponibilità e Partizionamento (CAP):** I database NoSQL spesso seguono il teorema CAP (Consistency, Availability, Partition Tolerance), consentendo di garantire due su tre aspetti tra coerenza, disponibilità e tolleranza alle partizioni in situazioni di rete distribuita.

---

## Tipi di Database

2. **Tipi di Database NoSQL
   - **Document-Oriented:** Memorizzano dati in documenti, solitamente in formati come JSON o BSON. Esempi includono MongoDB.
   - **Key-Value Stores:** Memorizzano dati come coppie chiave-valore. Esempi includono Redis e DynamoDB.
   - **Wide-Column Stores:** Memorizzano dati in colonne anziché righe, consentendo una rapida lettura di dati specifici. Esempi includono Cassandra e HBase.
   - **Grafo:** Memorizzano dati come grafi, ideali per relazioni complesse. Esempi includono Neo4j e Amazon Neptune.

---

## Document-Oriented Databases

3. **Document-Oriented Databases
   - MongoDB è un esempio popolare di un database document-oriented. I dati sono memorizzati in documenti JSON-like, consentendo la flessibilità dello schema e la gestione di dati complessi.

   ```json
   {
      "_id": 1,
      "nome": "John Doe",
      "età": 30,
      "indirizzo": {
         "via": "123 Main St",
         "città": "Anytown",
         "stato": "CA"
      },
      "interessi": ["musica", "sport"]
   }
   ```

---

## Key-Value Stores

4. **Key-Value Stores
   - Redis è un esempio di database key-value store. I dati sono memorizzati come coppie chiave-valore, con operazioni efficienti di lettura e scrittura.

   ```redis
   SET utente:1 '{"nome": "Alice", "età": 25, "città": "CityA"}'
   GET utente:1
   ```

---

## Wide-Column Stores

5. **Wide-Column Stores
   - Cassandra è un esempio di wide-column store. I dati sono organizzati in colonne piuttosto che righe, consentendo una rapida lettura di dati specifici.

   ```
   | ID | Nome | Età | Città     |
   |----|------|-----|-----------|
   | 1  | Bob  | 28  | CityB     |
   | 2  | Jane | 35  | CityC     |
   ```

---

## Grafo Databases

6. **Grafo Databases
   - Neo4j è un esempio di grafo database. I dati sono memorizzati come nodi e relazioni, ideali per modellare e navigare attraverso reti complesse.

   ```
   (Persona)-[AMICO]->(Persona)
   ```

---

## Scalabilità e Distribuzione

7. **Scalabilità e Distribuzione
   - I database NoSQL sono spesso progettati per essere altamente scalabili e distribuiti su più nodi. Ciò consente loro di gestire grandi volumi di dati e di supportare applicazioni con elevati requisiti di scalabilità.

---

## Scelta del Database

8. **Scelta del Database
   - La scelta tra database relazionali e NoSQL dipende dalle esigenze specifiche dell'applicazione. I database NoSQL sono spesso preferiti per situazioni in cui la struttura dei dati è flessibile, la scalabilità è critica o sono necessarie alte prestazioni in lettura/scrittura.

---

## Sfide dei Database

9. **Sfide dei Database NoSQL
   - Pur offrendo vantaggi in termini di flessibilità e scalabilità, i database NoSQL possono presentare sfide come la complessità di query, la mancanza di standardizzazione e la curva di apprendimento.

I database NoSQL offrono un approccio diverso rispetto ai tradizionali database relazionali, progettati per soddisfare le esigenze specifiche di applicazioni moderne che richiedono flessibilità, scalabilità e gestione efficiente di dati non strutturati. La scelta tra un database relazionale e un NoSQL dipenderà dalle caratteristiche specifiche del progetto.

---

## Architettura a Microservizi

---

Parliamo ora dell'"Architettura a Microservizi". L'architettura a microservizi è un approccio alla progettazione del software che suddivide un'applicazione in componenti autonomi, chiamati microservizi, ciascuno dei quali è responsabile di una funzionalità specifica. Questi microservizi comunicano tra loro attraverso API ben definite e possono essere sviluppati, distribuiti e scalati indipendentemente l'uno dall'altro.

---

## Caratteristiche Principali

1. **Caratteristiche Principali
   - **Decomposizione in Servizi
     - Un'applicazione monolitica viene scomposta in piccoli servizi autonomi e autosufficienti, ognuno responsabile di una specifica funzionalità.

   - **Comunicazione tramite API
     - I microservizi comunicano tra loro attraverso interfacce API ben definite. Questa comunicazione può avvenire tramite HTTP/REST, messaging asincrono, o altri protocolli.

   - **Indipendenza dei Servizi
     - I microservizi sono sviluppati, distribuiti e gestiti indipendentemente gli uni dagli altri. Ciò consente un rapido sviluppo, rilascio e scalabilità.

   - **Scalabilità Separata
     - I singoli microservizi possono essere scalati separatamente in base alle esigenze di carico. Questo consente di ottimizzare le risorse e garantire prestazioni ottimali.

   - **Resilienza e Tolleranza agli Errori
     - Un fallimento in un microservizio non dovrebbe influenzare l'intero sistema. L'architettura a microservizi promuove la resilienza, consentendo al sistema di continuare a funzionare anche in presenza di fallimenti isolati.

   - **Libertà Tecnologica
     - Ogni microservizio può essere sviluppato utilizzando tecnologie e stack tecnologici diversi, a condizione che rispetti le interfacce API definite. Ciò consente la libertà tecnologica e la scelta delle migliori tecnologie per ogni servizio.

   - **Sviluppo e Rilascio Continuo
     - Grazie all'indipendenza dei microservizi, è possibile implementare pratiche di sviluppo e rilascio continui, accelerando il ciclo di vita del software.

---

## Architettura Monolitica vs

2. **Architettura Monolitica vs. Microservizi
   - **Monolitica
     - Un'applicazione monolitica è un singolo blocco di codice in cui tutte le funzionalità sono integrate e dipendono strettamente l'una dall'altra. Qualsiasi modifica richiede la distribuzione dell'intera applicazione.

   - **Microservizi
     - I microservizi sono componenti indipendenti che possono essere sviluppati e implementati separatamente. Ogni microservizio è autosufficiente e comunica con gli altri attraverso interfacce API.

---

## Sfide dell'Architettura

3. **Sfide dell'Architettura a Microservizi
   - **Complessità del Sistem
     - La gestione di un ecosistema di microservizi può diventare complessa, richiedendo una buona pianificazione e strumenti adeguati.

   - **Gestione delle Transazioni
     - Coordinare transazioni distribuite tra microservizi può essere una sfida. È importante considerare approcci come il modello Saga per gestire transazioni complesse.

   - **Consistenza e Coerenza dei Dati
     - Mantenere la coerenza dei dati attraverso diversi microservizi può richiedere la progettazione di strategie efficaci per garantire l'integrità dei dati.

   - **Monitoraggio e Debugging
     - Monitorare e debuggare l'intero sistema di microservizi può essere più complesso rispetto a un'applicazione monolitica. Sono necessari strumenti e pratiche apposite.

   - **Sicurezza
     - La gestione della sicurezza in un ambiente di microservizi richiede un'attenzione particolare per garantire che ogni servizio sia protetto e che le comunicazioni siano sicure.

---

## Esempio di Architettura

4. **Esempio di Architettura a Microservizi
   - Consideriamo un'applicazione di e-commerce scomposta in microservizi:
     - **Servizio di Autenticazione:** Gestisce l'autenticazione degli utenti.
     - **

---

**Servizio di Catalogo:** Gestisce l'inventario dei prodotti e le informazioni sul catalogo.

- **Servizio di Carrello:** Gestisce il carrello degli acquisti per gli utenti.

- **Servizio di Pagamento:** Gestisce le transazioni di pagamento durante il processo di checkout.

- **Servizio di Spedizione:** Si occupa della gestione della logistica e della spedizione degli ordini.

- **Servizio di Recensioni:** Permette agli utenti di lasciare recensioni e valutazioni sui prodotti.

- **Servizio di Notifiche:** Invia notifiche agli utenti riguardo a ordini, promozioni, ecc.

- **Gateway API:** Aggrega le API di tutti i servizi e fornisce un'interfaccia unificata per le applicazioni client.

   Questi microservizi lavorano insieme attraverso API ben definite per fornire le funzionalità complete dell'applicazione di e-commerce. Ogni microservizio può essere sviluppato e scalato indipendentemente, consentendo un'evoluzione flessibile e un mantenimento semplificato.

---

## Vantaggi dell'Architettura

5. **Vantaggi dell'Architettura a Microservizi
   - **Scalabilità Selettiva:** I microservizi possono essere scalati separatamente in base alle esigenze specifiche, migliorando l'efficienza nell'uso delle risorse.

   - **Agilità nello Sviluppo:** Consentono lo sviluppo e il rilascio indipendenti, accelerando i tempi di sviluppo e facilitando l'aggiornamento continuo.

   - **Resilienza e Affidabilità:** Un fallimento in un microservizio non dovrebbe influenzare l'intero sistema, aumentando la resilienza complessiva.

   - **Libertà Tecnologica:** Ogni microservizio può utilizzare la tecnologia più adatta per la sua funzionalità, offrendo flessibilità e adattabilità.

   - **Mantenimento Semplificato:** Gli aggiornamenti o le modifiche possono essere apportati a singoli microservizi senza la necessità di distribuire l'intera applicazione.

   - **Facilità di Scalabilità Horizzontale:** La distribuzione orizzontale di singoli microservizi facilita la gestione del carico e la scalabilità dell'applicazione.

---

## Considerazioni Importanti

6. **Considerazioni Importanti
   - **Granularità dei Servizi:** La granularità dei microservizi dovrebbe essere bilanciata. Microservizi troppo piccoli possono portare a overhead di gestione, mentre microservizi troppo grandi potrebbero perdere alcuni benefici dell'approccio.

   - **Comunicazione tra Microservizi:** La comunicazione tra microservizi deve essere gestita attentamente. Le scelte di protocollo e i meccanismi di messaggistica influenzano la coerenza e la performance del sistema.

   - **Strumenti di Gestione e Monitoraggio:** L'uso di strumenti di gestione, monitoraggio e tracciatura è essenziale per mantenere la visibilità e il controllo su un sistema composto da numerosi microservizi.

   - **Cultura DevOps:** L'adozione dell'architettura a microservizi spesso richiede una cultura DevOps che favorisca la collaborazione tra sviluppatori e operatori, incoraggiando la responsabilità condivisa per la distribuzione e il monitoraggio.

L'architettura a microservizi è un approccio potente ma complesso alla progettazione del software, offrendo flessibilità, scalabilità e agilità. Tuttavia, è importante considerare attentamente le sfide e le considerazioni specifiche del contesto prima di adottare questo modello architetturale.

---

---

## differenze tra i database SQL (relazionali) e i database NoSQL

---

Le principali differenze tra i database SQL (relazionali) e i database NoSQL (non relazionali) riguardano la struttura dei dati, il modello di dati, la scalabilità, la flessibilità dello schema e l'utilizzo tipico. Di seguito sono elencate alcune delle differenze chiave:

---

## Modello di Dati

1. **Modello di Dati
   - **SQL (Relazionale):** Utilizza un modello di dati tabellare, in cui i dati sono organizzati in tabelle con righe e colonne. Ogni tabella ha uno schema definito e le relazioni tra tabelle sono basate su chiavi primarie e esterne.
   - **NoSQL (Non Relazionale):** Utilizza vari modelli di dati, tra cui documenti, chiave-valore, colonne e grafi. I database NoSQL sono progettati per gestire dati strutturati, semi-strutturati o non strutturati, offrendo flessibilità nella struttura dei dati.

---

## Schema dei Dati

2. **Schema dei Dati
   - **SQL:** Richiede uno schema fisso e predefinito, in cui la struttura della tabella, i tipi di dati e le relazioni devono essere definiti in anticipo. Le modifiche allo schema possono richiedere procedure complesse.
   - **NoSQL:** Offre una maggiore flessibilità dello schema, consentendo l'inserimento di dati senza una struttura predefinita. Questo è particolarmente utile in scenari in cui la struttura dei dati può cambiare frequentemente.

---

## Scalabilità

3. **Scalabilità
   - **SQL:** La scalabilità orizzontale (aggiunta di nuovi server) può essere complessa, e spesso si fa affidamento sulla scalabilità verticale (aggiunta di risorse al server esistente).
   - **NoSQL:** Molte soluzioni NoSQL sono progettate per la scalabilità orizzontale, consentendo la distribuzione su più nodi in modo efficiente. Questo è particolarmente utile per gestire volumi di dati elevati e carichi di lavoro distribuiti.

---

## Transazioni e Consistenza

4. **Transazioni e Consistenza
   - **SQL:** I database relazionali seguono il concetto di ACID (Atomicità, Coerenza, Isolamento, Durabilità) e sono ideali per applicazioni che richiedono transazioni complesse e garanzie di consistenza.
   - **NoSQL:** Alcuni database NoSQL sacrificano alcune delle proprietà ACID per offrire maggiore velocità e scalabilità. La consistenza eventualmente coerente (eventual consistency) è spesso accettata in cambio di una maggiore distribuzione e velocità.

---

## Complessità delle Query

5. **Complessità delle Query
   - **SQL:** È progettato per eseguire query complesse tramite il linguaggio SQL. Le operazioni di join e le query ad hoc sono potenti ma possono richiedere risorse significative.
   - **NoSQL:** I modelli di dati NoSQL sono spesso ottimizzati per query specifiche. Le operazioni di query sono generalmente più semplici e più veloci, ma la complessità dipende dal modello specifico utilizzato.

---

## Uso Tipico

6. **Uso Tipico
   - **SQL:** Comunemente utilizzato in applicazioni in cui la struttura dei dati è stabile, le relazioni tra entità sono importanti e sono richieste transazioni complesse, come in sistemi di gestione di database aziendali tradizionali.
   - **NoSQL:** Adatto per scenari in cui la flessibilità dello schema, la gestione di grandi volumi di dati, la scalabilità orizzontale e la velocità di lettura/scrittura sono prioritari. Comunemente utilizzato in applicazioni web, social media, analisi di grandi dati e altri contesti dinamici.

È importante notare che queste sono generalizzazioni e che ci sono variazioni significative tra i diversi database SQL e NoSQL. La scelta tra SQL e NoSQL dipende dalle specifiche esigenze dell'applicazione e dai requisiti del progetto.

---

Le principali differenze tra SQL (Structured Query Language) e NoSQL (Not Only SQL) riguardano il modello di dati, la struttura del database, la scalabilità e il modo in cui vengono gestite le relazioni. Di seguito, sono elencate le differenze principali:

---

## Esempi di Database

7. **Esempi di Database SQL e NoSQL
   - **SQL:** MySQL, PostgreSQL, Oracle Database, Microsoft SQL Server.
   - **NoSQL:** MongoDB, CouchDB, Cassandra, Redis, Amazon DynamoDB.

In sintesi, la scelta tra SQL e NoSQL dipende dalle specifiche esigenze del progetto. SQL è spesso preferito quando è richiesta una struttura rigorosa e la gestione di relazioni complesse, mentre NoSQL è adatto per situazioni in cui la flessibilità, la scalabilità e la gestione di dati non strutturati sono prioritari.

---

