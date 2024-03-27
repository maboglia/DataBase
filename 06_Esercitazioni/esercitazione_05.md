# Esercitazione 05

## esercizio libri e autori:

Supponiamo di avere le seguenti tabelle:

1. `LIBRO`: contiene informazioni sui libri disponibili.
2. `AUTORE`: contiene informazioni sugli autori dei libri.

Ecco lo schema delle tabelle:

```sql
CREATE TABLE LIBRO (
    CodLibro INT PRIMARY KEY,
    Titolo VARCHAR(100),
    Genere VARCHAR(50),
    CodAutore INT,
    FOREIGN KEY (CodAutore) REFERENCES AUTORE(CodAutore)
);

CREATE TABLE AUTORE (
    CodAutore INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cognome VARCHAR(100)
);
```

Ora, inseriamo dei dati di esempio nelle tabelle:

```sql
INSERT INTO AUTORE (CodAutore, Nome, Cognome) VALUES
(1, 'Mario', 'Rossi'),
(2, 'Giulia', 'Verdi');

INSERT INTO LIBRO (CodLibro, Titolo, Genere, CodAutore) VALUES
(1, 'Libro1', 'Romanzo', 1),
(2, 'Libro2', 'Fantasy', 2),
(3, 'Libro3', 'Thriller', 1),
(4, 'Libro4', 'Fantascienza', 2),
(5, 'Libro5', 'Saggio', 1);
```

Ora, risponderò a delle domande utilizzando interrogazioni SQL:

(a) Trovare il nome degli autori che hanno scritto almeno un libro.

```sql
SELECT DISTINCT Nome, Cognome
FROM AUTORE
WHERE CodAutore IN (SELECT CodAutore FROM LIBRO);
```

(b) Trovare il nome degli autori che non hanno scritto libri di genere 'Fantasy'.

```sql
SELECT DISTINCT Nome, Cognome
FROM AUTORE
WHERE CodAutore NOT IN (SELECT CodAutore FROM LIBRO WHERE Genere = 'Fantasy');
```

(c) Trovare il nome dei libri di genere 'Romanzo'.

```sql
SELECT Titolo
FROM LIBRO
WHERE Genere = 'Romanzo';
```

(d) Trovare il nome degli autori dei libri di genere 'Thriller'.

```sql
SELECT DISTINCT Nome, Cognome
FROM AUTORE
WHERE CodAutore IN (SELECT CodAutore FROM LIBRO WHERE Genere = 'Thriller');
```

(e) Trovare il nome degli autori che hanno scritto almeno 2 libri.

```sql
SELECT Nome, Cognome
FROM AUTORE
WHERE CodAutore IN (SELECT CodAutore FROM LIBRO GROUP BY CodAutore HAVING COUNT(*) >= 2);
```

(f) Trovare il titolo dei libri scritti dall'autore di nome 'Mario'.

```sql
SELECT Titolo
FROM LIBRO
WHERE CodAutore = (SELECT CodAutore FROM AUTORE WHERE Nome = 'Mario');
```

(g) Trovare il genere dei libri scritti dall'autore di cognome 'Verdi'.

```sql
SELECT Genere
FROM LIBRO
WHERE CodAutore = (SELECT CodAutore FROM AUTORE WHERE Cognome = 'Verdi');
```
