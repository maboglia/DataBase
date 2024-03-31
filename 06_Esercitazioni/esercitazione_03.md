# Esercitazione 03

## Esercizio studenti, corsi, esami e docenti:

Supponiamo di avere le seguenti tabelle:

1. `STUDENTE`: contiene informazioni sugli studenti.
2. `CORSO`: contiene informazioni sui corsi disponibili.
3. `ESAME`: contiene informazioni sugli esami sostenuti dagli studenti.
4. `DOCENTE`: contiene informazioni sui docenti che insegnano i corsi.

Ecco lo schema delle tabelle:

```sql
CREATE TABLE STUDENTE (
    CodS INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cognome VARCHAR(100)
);

CREATE TABLE CORSO (
    CodC INT PRIMARY KEY,
    Nome VARCHAR(100),
    CodDocente INT,
    FOREIGN KEY (CodDocente) REFERENCES DOCENTE(CodDocente)
);

CREATE TABLE ESAME (
    CodE INT PRIMARY KEY,
    CodS INT,
    CodC INT,
    Voto INT,
    FOREIGN KEY (CodS) REFERENCES STUDENTE(CodS),
    FOREIGN KEY (CodC) REFERENCES CORSO(CodC)
);

CREATE TABLE DOCENTE (
    CodDocente INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cognome VARCHAR(100)
);
```

Ora, inseriamo dei dati di esempio nelle tabelle:

```sql
INSERT INTO DOCENTE (CodDocente, Nome, Cognome) VALUES
(1, 'Mario', 'Rossi'),
(2, 'Giulia', 'Verdi');

INSERT INTO CORSO (CodC, Nome, CodDocente) VALUES
(1, 'Matematica', 1),
(2, 'Storia', 2),
(3, 'Scienze', 1);

INSERT INTO STUDENTE (CodS, Nome, Cognome) VALUES
(1, 'Luca', 'Bianchi'),
(2, 'Maria', 'Rossi'),
(3, 'Giovanni', 'Verdi');

INSERT INTO ESAME (CodE, CodS, CodC, Voto) VALUES
(1, 1, 1, 25),
(2, 1, 2, 28),
(3, 2, 1, 30),
(4, 2, 3, 27),
(5, 3, 2, 22),
(6, 3, 3, 26);
```

Ora, risponderò a delle domande utilizzando interrogazioni SQL:

(a) Trovare il nome degli studenti che hanno sostenuto almeno un esame.

```sql
SELECT DISTINCT Nome, Cognome
FROM STUDENTE
WHERE CodS IN (SELECT CodS FROM ESAME);
```

(b) Trovare il nome dei corsi insegnati dal docente di nome 'Mario'.

```sql
SELECT Nome
FROM CORSO
WHERE CodDocente = (SELECT CodDocente FROM DOCENTE WHERE Nome = 'Mario');
```

(c) Trovare il nome dei docenti che insegnano almeno un corso.

```sql
SELECT DISTINCT Nome, Cognome
FROM DOCENTE
WHERE CodDocente IN (SELECT CodDocente FROM CORSO);
```

(d) Trovare il nome degli studenti che hanno sostenuto l'esame del corso di 'Matematica'.

```sql
SELECT DISTINCT Nome, Cognome
FROM STUDENTE
WHERE CodS IN (SELECT CodS FROM ESAME WHERE CodC = (SELECT CodC FROM CORSO WHERE Nome = 'Matematica'));
```

(e) Trovare il nome dei corsi per cui nessuno ha ancora sostenuto un esame.

```sql
SELECT Nome
FROM CORSO
WHERE CodC NOT IN (SELECT CodC FROM ESAME);
```

(f) Trovare il nome del docente che ha ottenuto il voto più alto negli esami.

```sql
SELECT DISTINCT Nome, Cognome
FROM DOCENTE
WHERE CodDocente = (SELECT CodDocente FROM CORSO WHERE CodC = (SELECT CodC FROM ESAME ORDER BY Voto DESC LIMIT 1));
```

(g) Trovare il nome degli studenti che hanno ottenuto un voto superiore a 25 nell'esame di 'Storia'.

```sql
SELECT DISTINCT Nome, Cognome
FROM STUDENTE
WHERE CodS IN (SELECT CodS FROM ESAME WHERE CodC = (SELECT CodC FROM CORSO WHERE Nome = 'Storia') AND Voto > 25);
```
