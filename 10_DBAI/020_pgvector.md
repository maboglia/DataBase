# 🧪 MINI ESERCITAZIONE: pgvector su PostgreSQL (Vector DB)

## 🎯 Obiettivo

Creare un database PostgreSQL con estensione **pgvector** per:

* memorizzare embedding (vettori numerici)
* fare query di similarità (nearest neighbors)
* usare filtri con metadati

---

# 1) Prerequisiti

Hai bisogno di:

* PostgreSQL (>= 14 consigliato)
* estensione **pgvector** installata

Se usi Docker è tutto più semplice.

---

# 2) Avvio rapido con Docker (consigliato)

```bash
docker run --name pgvector-db \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_DB=vectordb \
  -p 5432:5432 \
  -d pgvector/pgvector:pg16
```

Connessione:

```bash
psql -h localhost -U postgres -d vectordb
```

Password: `postgres`

---

# 3) Abilitare l’estensione pgvector

Dentro `psql`:

```sql
CREATE EXTENSION IF NOT EXISTS vector;
```

Verifica:

```sql
\dx
```

---

# 4) Creazione tabella "documenti"

Creiamo una tabella che contiene:

* testo originale
* embedding
* categoria (metadata)
* data inserimento

⚠️ Useremo embedding di dimensione 3 per semplicità didattica (nella realtà sono 384/768/1536).

```sql
DROP TABLE IF EXISTS documenti;

CREATE TABLE documenti (
    id SERIAL PRIMARY KEY,
    testo TEXT NOT NULL,
    categoria VARCHAR(50),
    embedding VECTOR(3),
    created_at TIMESTAMP DEFAULT NOW()
);
```

---

# 5) Inserimento dati (documenti + embedding)

Inseriamo alcuni documenti e relativi vettori (inventati).

```sql
INSERT INTO documenti (testo, categoria, embedding) VALUES
('Il gatto dorme sul divano', 'animali',  '[0.9, 0.1, 0.2]'),
('Il cane corre nel parco',   'animali',  '[0.85, 0.15, 0.25]'),
('La pizza margherita è buona', 'cibo',   '[0.1, 0.9, 0.8]'),
('Il database PostgreSQL supporta SQL', 'informatica', '[0.2, 0.3, 0.95]'),
('I vettori sono usati nella AI moderna', 'informatica', '[0.25, 0.35, 0.9]');
```

Controllo:

```sql
SELECT * FROM documenti;
```

---

# 6) Query di Similarità (Nearest Neighbors)

## 6.1 Query: trova i documenti più simili a un vettore

Supponiamo che una query testuale generi questo embedding:

`[0.88, 0.12, 0.22]`

Cerchiamo i 3 più simili usando distanza L2 (Euclidea):

```sql
SELECT id, testo, categoria,
       embedding <-> '[0.88, 0.12, 0.22]' AS distanza
FROM documenti
ORDER BY embedding <-> '[0.88, 0.12, 0.22]'
LIMIT 3;
```

📌 `<->` = distanza Euclidea (L2)

---

# 7) Query con filtro su metadata (categoria)

Troviamo documenti simili ma solo nella categoria `"informatica"`:

```sql
SELECT id, testo, categoria,
       embedding <-> '[0.22, 0.33, 0.92]' AS distanza
FROM documenti
WHERE categoria = 'informatica'
ORDER BY embedding <-> '[0.22, 0.33, 0.92]'
LIMIT 3;
```

---

# 8) Similarità Coseno (Cosine Distance)

pgvector supporta anche la distanza coseno con:

📌 `<=>` = cosine distance

Esempio:

```sql
SELECT id, testo,
       embedding <=> '[0.88, 0.12, 0.22]' AS distanza_coseno
FROM documenti
ORDER BY embedding <=> '[0.88, 0.12, 0.22]'
LIMIT 3;
```

---

# 9) Creare un indice per velocizzare la ricerca (HNSW)

Su dataset grandi è obbligatorio.

## 9.1 Indice HNSW (cosine)

```sql
CREATE INDEX documenti_embedding_hnsw
ON documenti
USING hnsw (embedding vector_cosine_ops);
```

Dopo questo, query con `<=>` diventano molto più rapide.

---

# 10) Esercizio pratico guidato (da fare tu)

## ESERCIZIO A

Inserisci questi due nuovi documenti:

* `"Il leone vive nella savana"` categoria `"animali"`
* `"Gli spaghetti alla carbonara sono un piatto italiano"` categoria `"cibo"`

Inventati tu i vettori coerenti (esempio: animali simili ai primi).

---

## ESERCIZIO B

Fai una query per trovare i 5 documenti più simili a:

`[0.87, 0.11, 0.23]`

---

## ESERCIZIO C

Fai la stessa query ma solo con `categoria = 'cibo'`

---

# 11) Mini Simulazione RAG (semplificata)

## Idea

La query dell’utente viene convertita in embedding e cerchiamo i documenti più simili.

Esempio:
Query utente:
➡️ `"parlami di intelligenza artificiale e vettori"`

embedding ipotetico:
`[0.24, 0.34, 0.92]`

Query:

```sql
SELECT testo
FROM documenti
ORDER BY embedding <-> '[0.24, 0.34, 0.92]'
LIMIT 2;
```

Il risultato sarebbe il contesto da dare a un LLM.

---

# 12) Extra: cancellazione e aggiornamento

## Update embedding

```sql
UPDATE documenti
SET embedding = '[0.95, 0.05, 0.15]'
WHERE id = 1;
```

## Delete

```sql
DELETE FROM documenti WHERE id = 2;
```

---

# 13) Domande finali (tipo verifica orale)

1. Cos’è un embedding e perché è utile?
2. Che differenza c’è tra `<->` e `<=>`?
3. Perché servono indici ANN come HNSW?
4. Perché un vector DB non sostituisce un DB relazionale?
5. Come funziona la pipeline RAG?

---

# ✅ Risultato finale della mini esercitazione

Hai creato un piccolo sistema con:

* tabella documenti + embedding
* query di similarità
* filtri su metadati
* indice HNSW
* esempio di recupero stile RAG
