# Fornitori - Prodotti

Ecco un esempio di definizione di una base di dati con le tabelle "P" (Prodotti), "F" (Fornitori), e "FP" (Forniture). Le tabelle sono collegate in modo che sia possibile vedere quali fornitori forniscono quali prodotti:

```sql
-- Creazione della tabella dei Prodotti (P)
CREATE TABLE P (
    ProdottoID INT PRIMARY KEY,
    NomeProdotto VARCHAR(50),
    Prezzo DECIMAL(10, 2)
);

-- Inserimento di dati di esempio nella tabella Prodotti (P)
INSERT INTO P (ProdottoID, NomeProdotto, Prezzo)
VALUES (1, 'ProdottoA', 19.99),
       (2, 'ProdottoB', 29.99),
       (3, 'ProdottoC', 14.99);

-- Creazione della tabella dei Fornitori (F)
CREATE TABLE F (
    FornitoreID INT PRIMARY KEY,
    NomeFornitore VARCHAR(50)
);

-- Inserimento di dati di esempio nella tabella Fornitori (F)
INSERT INTO F (FornitoreID, NomeFornitore)
VALUES (1, 'FornitoreX'),
       (2, 'FornitoreY'),
       (3, 'FornitoreZ');

-- Creazione della tabella delle Forniture (FP)
CREATE TABLE FP (
    FornituraID INT PRIMARY KEY,
    ProdottoID INT,
    FornitoreID INT,
    Quantita INT,
    FOREIGN KEY (ProdottoID) REFERENCES P(ProdottoID),
    FOREIGN KEY (FornitoreID) REFERENCES F(FornitoreID)
);

-- Inserimento di dati di esempio nella tabella Forniture (FP)
INSERT INTO FP (FornituraID, ProdottoID, FornitoreID, Quantita)
VALUES (1, 1, 1, 100),
       (2, 1, 2, 50),
       (3, 2, 1, 75),
       (4, 2, 3, 120),
       (5, 3, 3, 80);
```

In questo esempio:

- La tabella "P" contiene informazioni sui prodotti, con colonne come "ProdottoID", "NomeProdotto" e "Prezzo".
- La tabella "F" contiene informazioni sui fornitori, con colonne come "FornitoreID" e "NomeFornitore".
- La tabella "FP" contiene informazioni sulle forniture, con colonne come "FornituraID", "ProdottoID", "FornitoreID" e "Quantita". Le colonne "ProdottoID" e "FornitoreID" sono collegate alle rispettive tabelle di prodotti e fornitori.

Puoi eseguire queste query in un sistema di gestione di database (DBMS) come MySQL, PostgreSQL, SQL Server, o un altro, per creare e popolare la tua base di dati di esempio.

---

| ProdottoID | NomeProdotto | Prezzo  |
|------------|--------------|---------|
| 1          | ProdottoA     | 19.99   |
| 2          | ProdottoB     | 29.99   |
| 3          | ProdottoC     | 14.99   |


---

| FornitoreID | NomeFornitore |
|-------------|---------------|
| 1           | FornitoreX     |
| 2           | FornitoreY     |
| 3           | FornitoreZ     |


---

| FornituraID | ProdottoID | FornitoreID | Quantita |
|-------------|------------|-------------|----------|
| 1           | 1          | 1           | 100      |
| 2           | 1          | 2           | 50       |
| 3           | 2          | 1           | 75       |
| 4           | 2          | 3           | 120      |
| 5           | 3          | 3           | 80       |

---

## Interrogazioni SQL

1. **Seleziona tutti i prodotti:**

2. **Seleziona tutti i fornitori:**

3. **Seleziona tutte le forniture:**

4. **Trova i prodotti con un prezzo superiore a 20:**

5. **Conta il numero totale di fornitori:**

6. **Trova il prodotto con il prezzo massimo:**

7. **Calcola la quantità totale di tutte le forniture:**

8. **Trova i fornitori con almeno 3 forniture:**
