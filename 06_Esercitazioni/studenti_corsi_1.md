# Studenti, Esami e Corsi

Definiamo prima le tabelle.

**Tabelle:**

1. **Studenti:**
   - StudenteID (Chiave Primaria)
   - NomeStudente
   - DataNascita

2. **Esami:**
   - EsameID (Chiave Primaria)
   - CorsoID (Chiave Esterna verso Corsi)
   - StudenteID (Chiave Esterna verso Studenti)
   - Voto

3. **Corsi:**
   - CorsoID (Chiave Primaria)
   - NomeCorso
   - Dipartimento

**Formato Markdown delle Tabelle:**

**Studenti:**

```markdown
| StudenteID | NomeStudente | DataNascita  |
|------------|--------------|--------------|
| 1          | StudenteA     | 1990-01-15   |
| 2          | StudenteB     | 1992-05-20   |
| 3          | StudenteC     | 1988-11-08   |
```

**Esami:**

```markdown
| EsameID | CorsoID | StudenteID | Voto |
|---------|---------|------------|------|
| 1       | 101     | 1          | 85   |
| 2       | 102     | 2          | 92   |
| 3       | 103     | 3          | 78   |
```

**Corsi:**

```markdown
| CorsoID | NomeCorso         | Dipartimento  |
|---------|-------------------|---------------|
| 101     | Informatica Base  | Informatica   |
| 102     | Matematica Avanzata| Matematica    |
| 103     | Lingua Straniera  | Lingue        |
```

Ogni tabella ha una chiave primaria univoca e, se necessario, chiavi esterne per stabilire relazioni tra le tabelle. 

---

## DDL

Istruzioni SQL per creare le tabelle "Studenti", "Esami", e "Corsi" insieme alle relazioni tra di esse:

```sql
-- Creazione della tabella Studenti
CREATE TABLE Studenti (
    StudenteID INT PRIMARY KEY,
    NomeStudente VARCHAR(50),
    DataNascita DATE
);

-- Creazione della tabella Corsi
CREATE TABLE Corsi (
    CorsoID INT PRIMARY KEY,
    NomeCorso VARCHAR(50),
    Dipartimento VARCHAR(50)
);

-- Creazione della tabella Esami con chiavi esterne
CREATE TABLE Esami (
    EsameID INT PRIMARY KEY,
    CorsoID INT,
    StudenteID INT,
    Voto INT,
    FOREIGN KEY (CorsoID) REFERENCES Corsi(CorsoID),
    FOREIGN KEY (StudenteID) REFERENCES Studenti(StudenteID)
);
```


---

## DML

Ecco degli esempi di dati di prova che puoi inserire nelle tabelle appena create:

```sql
-- Inserimento dati di prova nella tabella Studenti
INSERT INTO Studenti (StudenteID, NomeStudente, DataNascita) VALUES
(1, 'StudenteA', '1990-01-15'),
(2, 'StudenteB', '1992-05-20'),
(3, 'StudenteC', '1988-11-08');

-- Inserimento dati di prova nella tabella Corsi
INSERT INTO Corsi (CorsoID, NomeCorso, Dipartimento) VALUES
(101, 'Informatica Base', 'Informatica'),
(102, 'Matematica Avanzata', 'Matematica'),
(103, 'Lingua Straniera', 'Lingue');

-- Inserimento dati di prova nella tabella Esami
INSERT INTO Esami (EsameID, CorsoID, StudenteID, Voto) VALUES
(1, 101, 1, 85),
(2, 102, 2, 92),
(3, 103, 3, 78);
```


---

Consideriamo le tabelle "Studenti", "Esami" e "Corsi". Ecco alcuni esempi di query SQL più semplici su queste tabelle:

1. **Seleziona tutti gli studenti:**

   ```sql
   SELECT * FROM Studenti;
   ```

2. **Seleziona tutti gli esami:**

   ```sql
   SELECT * FROM Esami;
   ```

3. **Seleziona tutti i corsi:**

   ```sql
   SELECT * FROM Corsi;
   ```

4. **Trova gli studenti che hanno superato l'esame con ID 1:**

   ```sql
   SELECT S.NomeStudente
   FROM Studenti S
   INNER JOIN Esami E ON S.StudenteID = E.StudenteID
   WHERE E.EsameID = 1;
   ```

5. **Calcola la media dei voti di ogni studente:**

   ```sql
   SELECT S.NomeStudente, AVG(E.Voto) AS MediaVoti
   FROM Studenti S
   LEFT JOIN Esami E ON S.StudenteID = E.StudenteID
   GROUP BY S.NomeStudente;
   ```

6. **Trova tutti gli esami che sono corsi nel Dipartimento di Informatica:**

   ```sql
   SELECT * FROM Esami
   WHERE CorsoID IN (SELECT CorsoID FROM Corsi WHERE Dipartimento = 'Informatica');
   ```

7. **Conta il numero totale di esami svolti:**

   ```sql
   SELECT COUNT(*) AS NumeroEsami FROM Esami;
   ```

8. **Trova gli studenti che hanno frequentato almeno un corso:**

   ```sql
   SELECT S.NomeStudente
   FROM Studenti S
   WHERE S.StudenteID IN (SELECT DISTINCT E.StudenteID FROM Esami E);
   ```


---

## Modificare la struttura del DB

Aggiungiamo la tabella "Docenti" collegata ai corsi. Di seguito, trovi gli statement SQL per creare la nuova tabella, gli esempi di dati di prova e alcune query SQL.

```sql
-- Creazione della tabella Docenti
CREATE TABLE Docenti (
    DocenteID INT PRIMARY KEY,
    NomeDocente VARCHAR(50),
    Dipartimento VARCHAR(50)
);

-- Aggiunta della chiave esterna alla tabella Corsi
ALTER TABLE Corsi
ADD COLUMN DocenteID INT,
ADD FOREIGN KEY (DocenteID) REFERENCES Docenti(DocenteID);

-- Inserimento dati di prova nella tabella Docenti
INSERT INTO Docenti (DocenteID, NomeDocente, Dipartimento) VALUES
(1, 'ProfessoreX', 'Informatica'),
(2, 'ProfessoreY', 'Matematica'),
(3, 'ProfessoressaZ', 'Lingue');

-- Aggiornamento dei dati di prova nella tabella Corsi con l'ID del Docente
UPDATE Corsi SET DocenteID = 1 WHERE CorsoID = 101;
UPDATE Corsi SET DocenteID = 2 WHERE CorsoID = 102;
UPDATE Corsi SET DocenteID = 3 WHERE CorsoID = 103;
```

**Formato Markdown della nuova tabella:**

**Docenti:**

```markdown
| DocenteID | NomeDocente   | Dipartimento  |
|-----------|---------------|---------------|
| 1         | ProfessoreX   | Informatica   |
| 2         | ProfessoreY   | Matematica    |
| 3         | ProfessoressaZ| Lingue        |
```

Ora, puoi eseguire alcune query su queste tabelle, come ad esempio:

1. **Seleziona tutti i corsi con i relativi docenti:**

   ```sql
   SELECT Corsi.NomeCorso, Docenti.NomeDocente
   FROM Corsi
   INNER JOIN Docenti ON Corsi.DocenteID = Docenti.DocenteID;
   ```

2. **Trova tutti i corsi tenuti dal ProfessoreX:**

   ```sql
   SELECT Corsi.NomeCorso
   FROM Corsi
   INNER JOIN Docenti ON Corsi.DocenteID = Docenti.DocenteID
   WHERE Docenti.NomeDocente = 'ProfessoreX';
   ```

3. **Calcola il numero totale di corsi per ogni dipartimento:**

   ```sql
   SELECT Dipartimento, COUNT(*) AS NumeroCorsi
   FROM Corsi
   GROUP BY Dipartimento;
   ```

### Esercizi

Alcuni esercizi SQL relativi al database proposto:

1. **Esercizio su Join:**
   - Trova il nome dello studente, il corso e il voto di ogni esame.

2. **Esercizio su Aggregazione:**
   - Calcola la media dei voti per ciascun corso.

3. **Esercizio su Filtraggio:**
   - Trova il nome degli studenti che hanno ottenuto un voto superiore a 90 in almeno un esame.

4. **Esercizio su Inserimento dati:**
   - Aggiungi un nuovo studente e assegnagli un voto in uno dei corsi.

5. **Esercizio su Aggiornamento dati:**
   - Modifica il voto di uno specifico studente in un esame.

6. **Esercizio su Sottoquery:**
   - Trova i corsi tenuti da docenti del Dipartimento di Informatica.

7. **Esercizio su Group By e Having:**
   - Trova i dipartimenti con almeno 2 corsi.

8. **Esercizio su Join e Order By:**
   - Trova il nome dello studente, il corso e il voto di ogni esame, ordinati per nome dello studente.

9. **Esercizio su Left Join:**
   - Trova il nome di tutti i corsi e, se disponibile, il nome del docente che lo tiene.

10. **Esercizio su Delete:**
    - Elimina uno specifico esame dalla tabella Esami.

---

## 10 esercizi SQL che coinvolgono clausole come WHERE, LIKE, DISTINCT, e altre:

11. **Esercizio su Filtraggio con WHERE:**
    - Trova tutti gli esami con un voto superiore a 80.

12. **Esercizio su Ordinamento con ORDER BY:**
    - Mostra il nome degli studenti in ordine alfabetico.

13. **Esercizio su Distinct:**
    - Trova tutti i dipartimenti distinti presenti nella tabella Corsi.

14. **Esercizio su Filtraggio con LIKE:**
    - Trova il nome dei corsi che iniziano con la parola "Informatica".

15. **Esercizio su Filtraggio con BETWEEN:**
    - Trova gli esami con voti compresi tra 70 e 90.

16. **Esercizio su Inserimento dati con INSERT:**
    - Aggiungi un nuovo corso alla tabella Corsi.

17. **Esercizio su Aggiornamento dati con UPDATE:**
    - Modifica il Dipartimento di un docente specifico.

18. **Esercizio su Join con alias:**
    - Trova il nome dello studente e il nome del corso di ogni esame, utilizzando alias per le tabelle.

19. **Esercizio su Filtraggio con IN:**
    - Trova gli esami svolti dagli studenti con ID 1, 2, e 3.

20. **Esercizio su Count e Group By:**
    - Conta il numero totale di esami per ciascun corso.

