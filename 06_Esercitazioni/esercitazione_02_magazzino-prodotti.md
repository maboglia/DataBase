# Esercitazione 02

## magazzino e dei prodotti

Ecco un esercizio SQL con il tema del magazzino e dei prodotti:

Supponiamo di avere le seguenti tabelle:

1. `PRODOTTO`: contiene informazioni sui prodotti presenti in magazzino.
2. `MAGAZZINO`: contiene informazioni sui magazzini disponibili.

Ecco lo schema delle tabelle:

```sql
CREATE TABLE PRODOTTO (
    CodP INT PRIMARY KEY,
    Nome VARCHAR(100),
    Prezzo DECIMAL(10, 2),
    Quantita INT,
    CodM INT,
    FOREIGN KEY (CodM) REFERENCES MAGAZZINO(CodM)
);

CREATE TABLE MAGAZZINO (
    CodM INT PRIMARY KEY,
    Nome VARCHAR(100),
    Indirizzo VARCHAR(255)
);
```

Ora, inseriamo dei dati di esempio nelle tabelle:

```sql
INSERT INTO MAGAZZINO (CodM, Nome, Indirizzo) VALUES
(1, 'Magazzino A', 'Via Roma, 1'),
(2, 'Magazzino B', 'Via Milano, 2');

INSERT INTO PRODOTTO (CodP, Nome, Prezzo, Quantita, CodM) VALUES
(1, 'Prodotto1', 10.99, 100, 1),
(2, 'Prodotto2', 20.50, 50, 1),
(3, 'Prodotto3', 15.75, 75, 2),
(4, 'Prodotto4', 30.25, 25, 2),
(5, 'Prodotto5', 5.99, 200, 1);
```

---

## Domande

(a) Trovare il codice e il nome dei magazzini che contengono almeno un prodotto con l'argomento 'maglietta'.
(b) Trovare il codice e il nome dei magazzini che non contengono prodotti con l'argomento 'maglietta'.
(c) Trovare il codice e il nome dei magazzini che contengono solo prodotti con l'argomento 'scarpe'.
(d) Trovare il codice e il nome dei magazzini che contengono almeno un prodotto con l'argomento 'borsa' oppure 'zaino'.
(e) Trovare il codice e il nome dei magazzini che contengono prodotti sia con l'argomento 'scarpe' sia con l'argomento 'maglietta'.
(f) Trovare il codice e il nome dei magazzini che contengono almeno 2 prodotti di scarpe.
(g) Trovare il codice e il nome dei magazzini che contengono un solo prodotto di borsa.

---

## Risposte

(a) Trovare il codice e il nome dei magazzini che contengono almeno un prodotto con l'argomento 'maglietta'.

```sql
SELECT DISTINCT CodM, Nome
FROM MAGAZZINO
WHERE CodM IN (SELECT CodM FROM PRODOTTO WHERE Nome LIKE '%maglietta%');
```

(b) Trovare il codice e il nome dei magazzini che non contengono prodotti con l'argomento 'maglietta'.

```sql
SELECT CodM, Nome
FROM MAGAZZINO
WHERE CodM NOT IN (SELECT CodM FROM PRODOTTO WHERE Nome LIKE '%maglietta%');
```

(c) Trovare il codice e il nome dei magazzini che contengono solo prodotti con l'argomento 'scarpe'.

```sql
SELECT CodM, Nome
FROM MAGAZZINO
WHERE CodM NOT IN (SELECT CodM FROM PRODOTTO WHERE Nome NOT LIKE '%scarpe%');
```

(d) Trovare il codice e il nome dei magazzini che contengono almeno un prodotto con l'argomento 'borsa' oppure 'zaino'.

```sql
SELECT DISTINCT CodM, Nome
FROM MAGAZZINO
WHERE CodM IN (SELECT CodM FROM PRODOTTO WHERE Nome LIKE '%borsa%' OR Nome LIKE '%zaino%');
```

(e) Trovare il codice e il nome dei magazzini che contengono prodotti sia con l'argomento 'scarpe' sia con l'argomento 'maglietta'.

```sql
SELECT CodM, Nome
FROM MAGAZZINO
WHERE CodM IN (SELECT CodM FROM PRODOTTO WHERE Nome LIKE '%scarpe%')
AND CodM IN (SELECT CodM FROM PRODOTTO WHERE Nome LIKE '%maglietta%');
```

(f) Trovare il codice e il nome dei magazzini che contengono almeno 2 prodotti di scarpe.

```sql
SELECT CodM, Nome
FROM MAGAZZINO
WHERE CodM IN (SELECT CodM FROM PRODOTTO WHERE Nome LIKE '%scarpe%'
               GROUP BY CodM HAVING COUNT(*) >= 2);
```

(g) Trovare il codice e il nome dei magazzini che contengono un solo prodotto di borsa.

```sql
SELECT CodM, Nome
FROM MAGAZZINO
WHERE CodM IN (SELECT CodM FROM PRODOTTO WHERE Nome LIKE '%borsa%'
               GROUP BY CodM HAVING COUNT(*) = 1);
```
