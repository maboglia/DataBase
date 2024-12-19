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
-- Inserimento dati di prova nella tabella Autore
INSERT INTO Autore (CodAutore, Nome, Cognome) VALUES
(1, 'Stephen', 'King'),
(2, 'J.K.', 'Rowling'),
(3, 'George', 'Orwell'),
(4, 'Agatha', 'Christie'),
(5, 'Haruki', 'Murakami'),
(6, 'Jane', 'Austen'),
(7, 'Fyodor', 'Dostoevsky'),
(8, 'Leo', 'Tolstoy'),
(9, 'Gabriel', 'García Márquez'),
(10, 'Charles', 'Dickens');

-- Inserimento dati di prova nella tabella Libro
INSERT INTO Libro (CodLibro, Titolo, Genere, CodAutore) VALUES
(1, 'It', 'Horror', 1),
(2, 'Harry Potter and the Philosopher''s Stone', 'Fantasy', 2),
(3, '1984', 'Distopia', 3),
(4, 'Murder on the Orient Express', 'Mystery', 4),
(5, 'Norwegian Wood', 'Fiction', 5),
(6, 'Pride and Prejudice', 'Romance', 6),
(7, 'Crime and Punishment', 'Psychological Fiction', 7),
(8, 'War and Peace', 'Historical Fiction', 8),
(9, 'One Hundred Years of Solitude', 'Magic Realism', 9),
(10, 'Great Expectations', 'Classic Literature', 10);

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
