# **Confronto tra ACID (DB relazionali) e BASE (NoSQL)**

---

## 1️⃣ Contesto

* **ACID** → database **relazionali** (SQL)
* **BASE** → database **NoSQL**, distribuiti e scalabili

Non sono “meglio o peggio”:
👉 **rispondono a esigenze diverse**.

---

## 2️⃣ Significato degli acronimi

### 🔹 ACID

* **A**tomicity → tutto o niente
* **C**onsistency → dati sempre coerenti
* **I**solation → transazioni indipendenti
* **D**urability → dati persistenti

---

### 🔹 BASE

* **B**asically Available → sempre disponibile
* **S**oft state → lo stato può cambiare nel tempo
* **E**ventual consistency → coerenza *eventuale*

---

## 3️⃣ Confronto diretto

| Aspetto       | ACID (SQL)       | BASE (NoSQL)       |
| ------------- | ---------------- | ------------------ |
| Tipo di DB    | Relazionale      | Non relazionale    |
| Schema        | Rigido           | Flessibile         |
| Transazioni   | Forti e complete | Deboli o assenti   |
| Coerenza      | Immediata        | Eventuale          |
| Disponibilità | Secondaria       | Prioritaria        |
| Scalabilità   | Verticale        | Orizzontale        |
| JOIN          | Native           | Assenti o simulate |
| Uso tipico    | Dati critici     | Grandi volumi      |

---

## 4️⃣ Coerenza: il punto chiave

### ACID

📌 Dopo `COMMIT` **tutti vedono subito i dati corretti**

👉 ideale per:

* banche
* contabilità
* prenotazioni
* sistemi scolastici

---

### BASE

📌 I nodi **si allineano col tempo**

👉 per un breve periodo:

* due utenti possono vedere dati diversi

👉 ideale per:

* social network
* e-commerce
* log
* big data

---

## 5️⃣ Collegamento al teorema CAP

Nei sistemi distribuiti non si possono garantire **tutte e tre**:

* **C**onsistency
* **A**vailability
* **P**artition tolerance

📌 Scelte tipiche:

* ACID → **CP**
* BASE → **AP**

---

## 6️⃣ Esempio concreto

### 💳 Banca (ACID)

Un bonifico:

* o riesce completamente
* o viene annullato

👉 **ACID obbligatorio**

---

### ❤️ Social Network (BASE)

Un “like”:

* può apparire dopo qualche secondo
* non è critico

👉 **BASE accettabile**

---

## 7️⃣ In una frase da esame

📌 **ACID privilegia coerenza e affidabilità dei dati, BASE privilegia disponibilità e scalabilità accettando una coerenza eventuale.**

---

## 8️⃣ Quando usare cosa

👉 **ACID se**:

* dati critici
* vincoli forti
* transazioni complesse

👉 **BASE se**:

* grandi volumi
* alta concorrenza
* tolleranza all’incoerenza temporanea

---

Ecco un confronto chiaro tra **MySQL** (relazionale) e **MongoDB** (NoSQL, documentale) 👇

---

## 1️⃣ Tipo di database

| Caratteristica   | MySQL                    | MongoDB                  |
| ---------------- | ------------------------ | ------------------------ |
| Tipo             | Relazionale (RDBMS)      | NoSQL, documentale       |
| Modello dati     | Tabelle, righe e colonne | Documenti JSON/BSON      |
| Schema           | Fisso (rigido)           | Flessibile (schema-less) |
| Dati strutturati | ✅ Necessari              | ❌ Opzionali              |

---

## 2️⃣ Linguaggio e query

| Caratteristica | MySQL          | MongoDB                                                  |
| -------------- | -------------- | -------------------------------------------------------- |
| Linguaggio     | SQL            | Query JSON-like / Mongo Query Language                   |
| JOIN           | ✅ Native       | ❌ Non native, si usano $lookup                           |
| Transazioni    | ✅ ACID (forti) | ✅ ACID solo a livello di singolo documento o replica set |

---

## 3️⃣ Performance e scalabilità

| Caratteristica | MySQL                           | MongoDB                                   |
| -------------- | ------------------------------- | ----------------------------------------- |
| Scalabilità    | Verticale (miglior hardware)    | Orizzontale (sharding)                    |
| Velocità       | Buona per transazioni complesse | Ottima per grandi volumi e letture veloci |
| Volume dati    | Medi                            | Molto grandi (Big Data)                   |

---

## 4️⃣ Integrità dei dati

| Caratteristica | MySQL                           | MongoDB                                       |
| -------------- | ------------------------------- | --------------------------------------------- |
| Vincoli        | PRIMARY KEY, FOREIGN KEY, CHECK | Limitati; integrità gestita dall’applicazione |
| ACID           | Forte                           | Solo parziale o su singoli documenti          |
| BASE           | ❌                               | ✅ Eventual consistency possibile              |

---

## 5️⃣ Tipici casi d’uso

| Uso                         | MySQL | MongoDB    |
| --------------------------- | ----- | ---------- |
| Applicazioni bancarie       | ✅     | ❌          |
| Sistemi scolastici          | ✅     | ❌/limitato |
| Social network              | ❌     | ✅          |
| E-commerce ad alto traffico | ❌     | ✅          |
| Log, analytics, IoT         | ❌     | ✅          |

---

## 6️⃣ Sintesi chiave

* **MySQL** → dati **strutturati**, integrità **ACID**, transazioni **complesse**, schema rigido
* **MongoDB** → dati **semi-strutturati/non strutturati**, **scalabilità**, flessibile, **coerenza eventuale (BASE)**

