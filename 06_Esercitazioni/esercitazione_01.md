# Esercitazione 01

## Rivista-articolo

```sql
-- Creazione delle tabelle
CREATE TABLE RIVISTA (
    CodR INT PRIMARY KEY,
    NomeR VARCHAR(50),
    Editore VARCHAR(50)
);

CREATE TABLE ARTICOLO (
    CodA INT PRIMARY KEY,
    Titolo VARCHAR(100),
    Argomento VARCHAR(50),
    CodR INT,
    FOREIGN KEY (CodR) REFERENCES RIVISTA(CodR)
);

-- Popolamento delle tabelle
INSERT INTO RIVISTA (CodR, NomeR, Editore) VALUES
(1, 'RivistaA', 'EditoreA'),
(2, 'RivistaB', 'EditoreB'),
(3, 'RivistaC', 'EditoreC');

INSERT INTO ARTICOLO (CodA, Titolo, Argomento, CodR) VALUES
(1, 'Articolo1', 'motociclismo', 1),
(2, 'Articolo2', 'calcio', 1),
(3, 'Articolo3', 'motociclismo', 2),
(4, 'Articolo4', 'basket', 2),
(5, 'Articolo5', 'auto', 3),
(6, 'Articolo6', 'motociclismo', 3),
(7, 'Articolo7', 'motociclismo', 3);
```

### interrogazioni SQL

(a) Trovare il codice e il nome delle riviste che hanno pubblicato almeno un articolo di argomento 'motociclismo'.

```sql
SELECT DISTINCT CodR, NomeR
FROM RIVISTA
WHERE CodR IN (SELECT CodR FROM ARTICOLO WHERE Argomento = 'motociclismo');
```

(b) Trovare il codice e il nome delle riviste che non hanno mai pubblicato articoli di argomento 'motociclismo'.

```sql
SELECT CodR, NomeR
FROM RIVISTA
WHERE CodR NOT IN (SELECT CodR FROM ARTICOLO WHERE Argomento = 'motociclismo');
```

(c) Trovare il codice e il nome delle riviste che hanno pubblicato solo articoli di motociclismo.

```sql
SELECT CodR, NomeR
FROM RIVISTA
WHERE CodR IN (SELECT CodR FROM ARTICOLO WHERE Argomento = 'motociclismo')
AND CodR NOT IN (SELECT CodR FROM ARTICOLO WHERE Argomento <> 'motociclismo');
```

(d) Trovare il codice e il nome delle riviste che pubblicano articoli di motociclismo oppure di auto.

```sql
SELECT DISTINCT CodR, NomeR
FROM RIVISTA
WHERE CodR IN (SELECT CodR FROM ARTICOLO WHERE Argomento = 'motociclismo')
OR CodR IN (SELECT CodR FROM ARTICOLO WHERE Argomento = 'auto');
```

(e) Trovare il codice e il nome delle riviste che pubblicano articoli sia di motociclismo sia di auto.

```sql
SELECT CodR, NomeR
FROM RIVISTA
WHERE CodR IN (SELECT CodR FROM ARTICOLO WHERE Argomento = 'motociclismo')
AND CodR IN (SELECT CodR FROM ARTICOLO WHERE Argomento = 'auto');
```

(f) Trovare il codice e il nome delle riviste che hanno pubblicato almeno 2 articoli di motociclismo.

```sql
SELECT CodR, NomeR
FROM RIVISTA
WHERE CodR IN (SELECT CodR FROM ARTICOLO WHERE Argomento = 'motociclismo'
               GROUP BY CodR HAVING COUNT(*) >= 2);
```

(g) Trovare il codice e il nome delle riviste che hanno pubblicato un solo articolo di motociclismo.

```sql
SELECT CodR, NomeR
FROM RIVISTA
WHERE CodR IN (SELECT CodR FROM ARTICOLO WHERE Argomento = 'motociclismo'
               GROUP BY CodR HAVING COUNT(*) = 1);
```
