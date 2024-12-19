# Esercitazione 04

## Esercizio prodotti fornitori:

Supponiamo di avere le seguenti tabelle:

1. `PRODOTTO`: contiene informazioni sui prodotti disponibili.
2. `FORNITORE`: contiene informazioni sui fornitori che forniscono i prodotti.

Ecco lo schema delle tabelle:

```sql
CREATE TABLE PRODOTTO (
    CodP INT PRIMARY KEY,
    Nome VARCHAR(100),
    Prezzo DECIMAL(10, 2),
    CodF INT,
    FOREIGN KEY (CodF) REFERENCES FORNITORE(CodF)
);

CREATE TABLE FORNITORE (
    CodF INT PRIMARY KEY,
    Nome VARCHAR(100),
    Indirizzo VARCHAR(255)
);
```

Ora, inseriamo dei dati di esempio nelle tabelle:

```sql
INSERT INTO FORNITORE (CodF, Nome, Indirizzo) VALUES
(1, 'FornitoreA', 'Via Roma, 1'),
(2, 'FornitoreB', 'Via Milano, 2');

INSERT INTO PRODOTTO (CodP, Nome, Prezzo, CodF) VALUES
(1, 'Prodotto1', 10.99, 1),
(2, 'Prodotto2', 20.50, 1),
(3, 'Prodotto3', 15.75, 2),
(4, 'Prodotto4', 30.25, 2),
(5, 'Prodotto5', 5.99, 1);
```

---

Interrogazioni SQL:

(a) Trovare il nome dei fornitori che forniscono almeno un prodotto.

```sql
SELECT DISTINCT Nome
FROM FORNITORE
WHERE CodF IN (SELECT CodF FROM PRODOTTO);
```

(b) Trovare il nome dei prodotti forniti dal fornitore di nome 'FornitoreA'.

```sql
SELECT Nome
FROM PRODOTTO
WHERE CodF = (SELECT CodF FROM FORNITORE WHERE Nome = 'FornitoreA');
```

(c) Trovare il nome dei fornitori che forniscono solo prodotti con un prezzo superiore a 20.

```sql
SELECT DISTINCT Nome
FROM FORNITORE
WHERE CodF NOT IN (SELECT CodF FROM PRODOTTO WHERE Prezzo <= 20);
```

(d) Trovare il nome dei prodotti forniti da almeno due fornitori diversi.

```sql
SELECT Nome
FROM PRODOTTO
WHERE CodP IN (SELECT CodP FROM PRODOTTO GROUP BY CodP HAVING COUNT(DISTINCT CodF) >= 2);
```

(e) Trovare il nome dei fornitori che forniscono esclusivamente prodotti con un prezzo inferiore a 10.

```sql
SELECT DISTINCT Nome
FROM FORNITORE
WHERE CodF NOT IN (SELECT CodF FROM PRODOTTO WHERE Prezzo >= 10);
```

(f) Trovare il nome del fornitore che fornisce il prodotto più costoso.

```sql
SELECT Nome
FROM FORNITORE
WHERE CodF = (SELECT CodF FROM PRODOTTO ORDER BY Prezzo DESC LIMIT 1);
```

(g) Trovare il nome dei prodotti forniti da un fornitore con sede in 'Via Milano, 2'.

```sql
SELECT Nome
FROM PRODOTTO
WHERE CodF = (SELECT CodF FROM FORNITORE WHERE Indirizzo = 'Via Milano, 2');
```
