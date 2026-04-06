# 📌 SCHEDA: VECTOR DATABASE (Vector DB)

## 🔹 Definizione

Un **Vector Database** è un database progettato per memorizzare e interrogare **vettori numerici** (embedding), cioè rappresentazioni matematiche di testi, immagini, audio o altri dati.

L’obiettivo è permettere **ricerche per similarità** invece che per uguaglianza.

---

## 🔹 Cos’è un Embedding

Un **embedding** è un array di numeri (es. 384, 768, 1536 dimensioni) che rappresenta un contenuto in uno spazio matematico.

Esempio:

* Testo: `"Il gatto dorme sul divano"`
* Embedding: `[0.12, -0.34, 0.88, ...]`

Testi con significato simile → vettori vicini.

---

## 🔹 Principale funzionalità

### ✅ Similarity Search (ricerca semantica)

Trova elementi “simili” a un input.

Esempio:

* Query: `"animale che riposa"`
* Risultato: documenti che parlano di “gatto che dorme”, anche senza parole identiche.

---

## 🔹 Operazioni principali

Un Vector DB supporta:

* **Insert**: salva vettore + metadati
* **Search / Query**: cerca vettori simili
* **Update**
* **Delete**
* **Filtering** su metadati (es. data, autore, categoria)

---

## 🔹 Distanze e metriche di similarità

Le più comuni:

### 📌 Cosine Similarity

Misura l’angolo tra vettori.

* molto usata per NLP

### 📌 Euclidean Distance

Distanza geometrica classica.

### 📌 Dot Product

Molto usata in modelli neurali e ranking.

---

## 🔹 Struttura tipica di un record

Un record in un Vector DB contiene:

* **id**
* **vector** (embedding)
* **metadata** (JSON: autore, categoria, data, ecc.)
* **payload** (testo originale opzionale)

---

## 🔹 Indicizzazione (ANN)

I Vector DB usano strutture per **Approximate Nearest Neighbor Search (ANN)**, perché confrontare milioni di vettori uno a uno è troppo lento.

Algoritmi comuni:

* **HNSW (Hierarchical Navigable Small World)**
* IVF (Inverted File Index)
* PQ (Product Quantization)

---

## 🔹 Differenza tra DB classico e Vector DB

| Aspetto    | DB relazionale     | Vector DB                  |
| ---------- | ------------------ | -------------------------- |
| Ricerca    | per valori esatti  | per similarità             |
| Dati       | righe/colonne      | vettori                    |
| Query      | SQL                | nearest neighbor search    |
| Uso tipico | CRUD transazionale | AI, NLP, ricerca semantica |

---

## 🔹 A cosa serve un Vector DB (Use Cases)

### 📌 RAG (Retrieval-Augmented Generation)

* si indicizzano documenti aziendali
* il modello recupera i più pertinenti
* poi genera risposta basata su quelli

### 📌 Chatbot su documenti

FAQ intelligenti, manuali, regolamenti.

### 📌 Search semantico su siti e archivi

Ricerca per significato, non solo parole.

### 📌 Raccomandazione prodotti

"utenti simili", "prodotti simili".

### 📌 Similarità immagini / audio

ricerca per immagini simili (computer vision).

---

## 🔹 Componenti tipici di una pipeline

1. Raccolta documenti (PDF, HTML, DB…)
2. Chunking (divisione in pezzi)
3. Creazione embedding (modello AI)
4. Salvataggio su Vector DB
5. Query embedding
6. Recupero top-k risultati
7. Risposta AI (LLM)

---

## 🔹 Esempi di Vector DB famosi

* **Pinecone**
* **Weaviate**
* **Milvus**
* **Chroma**
* **Qdrant**
* **FAISS** (libreria, non DB completo)
* PostgreSQL con **pgvector**

---

## 🔹 Vantaggi

✅ Ricerca semantica efficace
✅ Scalabilità su grandi quantità di documenti
✅ Base per chatbot e sistemi AI moderni
✅ Filtri su metadati + similarità

---

## 🔹 Limiti / Problemi

⚠️ Risultati “approssimati” (ANN)
⚠️ qualità dipende dagli embedding
⚠️ serve chunking corretto
⚠️ aggiornamenti massivi possono essere costosi
⚠️ non sostituisce DB relazionali (è complementare)

---

# 🧠 Concetti chiave da ricordare

* Il Vector DB non cerca parole ma **vicinanza matematica**
* Un embedding rappresenta il significato del contenuto
* La query viene trasformata in embedding
* Si cercano i **Top-k vettori più vicini**
* Fondamentale per RAG e chatbot su documenti
