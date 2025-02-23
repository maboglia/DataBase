# **Introduzione ai Database Non Relazionali**

I database **non relazionali** o **NoSQL** rappresentano una categoria di database progettati per gestire grandi quantità di dati, spesso non strutturati o semi-strutturati, in modo flessibile e scalabile. Si differenziano dai database relazionali per il modello di dati che adottano e per l'approccio non rigido allo schema.

---

### **Concetti di NoSQL**

1. **Cosa significa NoSQL?**
   - Originariamente "NoSQL" significava "No SQL", ma oggi viene interpretato come "Not Only SQL", indicando che questi database possono affiancare (non necessariamente sostituire) i database relazionali.

2. **Caratteristiche principali:**
   - **Schema flessibile o assente:** Non richiedono una struttura rigida delle tabelle come nei database relazionali.
   - **Alta scalabilità:** Progettati per funzionare su cluster distribuiti e scalare orizzontalmente.
   - **Performance elevate:** Ottimizzati per letture/scritture rapide.
   - **Adatti a Big Data:** Gestiscono grandi volumi di dati eterogenei.
   - **Orientamento al modello di dati:** I dati vengono memorizzati in formati diversi (documenti, colonne, grafi, chiavi-valori).

3. **Quando usare NoSQL?**
   - Dati non strutturati o semi-strutturati.
   - Applicazioni distribuite e scalabilità elevata.
   - Grandi volumi di dati (Big Data).
   - Necessità di alta velocità in lettura/scrittura.

---

### **Tipologie di Database Non Relazionali**

1. **Database Documentale**
   - Memorizzano i dati come documenti in formato JSON, BSON o XML.
   - Adatti per rappresentare dati complessi e nidificati.
   - Esempi: **MongoDB**, **Couchbase**.
   - **Caso d'uso:** Sistemi di gestione di contenuti, e-commerce.

2. **Database Chiave-Valore**
   - I dati sono memorizzati come coppie chiave-valore, simili a un dizionario.
   - Esempi: **Redis**, **DynamoDB**.
   - **Caso d'uso:** Caching, session management.

3. **Database a Grafo**
   - Ottimizzati per rappresentare relazioni tra entità (nodi e archi).
   - Esempi: **Neo4j**, **Amazon Neptune**.
   - **Caso d'uso:** Social network, sistemi di raccomandazione.

4. **Database a Colonne**
   - Organizzano i dati per colonne invece che per righe, facilitando l'elaborazione di query analitiche.
   - Esempi: **Cassandra**, **HBase**.
   - **Caso d'uso:** Analisi dati, applicazioni IoT.

---

### **Esempi di Database NoSQL**

1. **MongoDB** (Documentale)
   - Dati salvati in documenti JSON/BSON.
   - Supporta query potenti e indicizzazione.
   - Scalabilità orizzontale semplice.

2. **Cassandra** (A Colonne)
   - Progettato per applicazioni distribuite e fault-tolerant.
   - Alta velocità di scrittura e scalabilità massiva.

3. **Redis** (Chiave-Valore)
   - In-memory database estremamente veloce.
   - Ottimo per caching, sessioni utente, code di messaggi.

4. **Neo4j** (A Grafo)
   - Ottimizzato per gestire dati con molte relazioni.
   - Utilizza Cypher come linguaggio di query per grafi.

5. **Amazon DynamoDB** (Chiave-Valore e Documentale)
   - Offerto come servizio gestito da AWS.
   - Adatto per applicazioni serverless e distribuite.

---

### **Conclusioni**

I database NoSQL non sostituiscono completamente quelli relazionali, ma li affiancano in contesti dove la flessibilità dei dati, la scalabilità e le alte prestazioni sono cruciali. Scegliere il tipo di database dipende dai requisiti specifici dell'applicazione.
