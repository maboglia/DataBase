# Magazzino Prodotti

Creiamo un esempio di database per un magazzino di prodotti informatici con tre tabelle: "Prodotti", "Fornitori" e "Inventario". Di seguito troverai le definizioni delle tabelle in formato Markdown, gli statement SQL per crearle, l'inserimento di dati di prova e alcune query.

**Tabelle:**

1. **Prodotti:**
   - ProdottoID (Chiave Primaria)
   - NomeProdotto
   - Prezzo
   - Categoria

2. **Fornitori:**
   - FornitoreID (Chiave Primaria)
   - NomeFornitore
   - Indirizzo
   - Email

3. **Inventario:**
   - MovimentoID (Chiave Primaria)
   - ProdottoID (Chiave Esterna verso Prodotti)
   - FornitoreID (Chiave Esterna verso Fornitori)
   - Quantita
   - DataMovimento

**Vista delle Tabelle:**

**Prodotti:**

```markdown
| ProdottoID | NomeProdotto     | Prezzo | Categoria       |
|------------|------------------|--------|-----------------|
| 1          | Laptop Dell      | 1200   | Computer        |
| 2          | Stampante HP     | 300    | Periferica      |
| 3          | Mouse Logitech   | 50     | Accessorio      |
```

**Fornitori:**

```markdown
| FornitoreID | NomeFornitore | Indirizzo          | Email                   |
|-------------|---------------|--------------------|-------------------------|
| 101         | ABC Elettronica| Via Roma, 123      | abc@example.com         |
| 102         | XYZ Computer   | Via Verdi, 456     | xyz@example.com         |
| 103         | Tech Supplies  | Corso Italia, 789  | tech@example.com        |
```

**Inventario:**

```markdown
| MovimentoID | ProdottoID | FornitoreID | Quantita | DataMovimento |
|-------------|------------|-------------|----------|---------------|
| 1           | 1          | 101         | 10       | 2022-03-01    |
| 2           | 2          | 102         | 5        | 2022-03-02    |
| 3           | 3          | 103         | 20       | 2022-03-03    |
```

**Statement SQL per la Creazione delle Tabelle:**

```sql
-- Creazione della tabella Prodotti
CREATE TABLE Prodotti (
    ProdottoID INT PRIMARY KEY,
    NomeProdotto VARCHAR(50),
    Prezzo DECIMAL(10, 2),
    Categoria VARCHAR(50)
);

-- Creazione della tabella Fornitori
CREATE TABLE Fornitori (
    FornitoreID INT PRIMARY KEY,
    NomeFornitore VARCHAR(50),
    Indirizzo VARCHAR(100),
    Email VARCHAR(50)
);

-- Creazione della tabella Inventario con chiavi esterne
CREATE TABLE Inventario (
    MovimentoID INT PRIMARY KEY,
    ProdottoID INT,
    FornitoreID INT,
    Quantita INT,
    DataMovimento DATE,
    FOREIGN KEY (ProdottoID) REFERENCES Prodotti(ProdottoID),
    FOREIGN KEY (FornitoreID) REFERENCES Fornitori(FornitoreID)
);
```

**Insert Fake Data:**

```sql
-- Inserimento dati di prova nella tabella Prodotti
INSERT INTO Prodotti (ProdottoID, NomeProdotto, Prezzo, Categoria) VALUES
(1, 'Laptop Dell', 1200, 'Computer'),
(2, 'Stampante HP', 300, 'Periferica'),
(3, 'Mouse Logitech', 50, 'Accessorio'),
(4, 'Smartphone Samsung', 800, 'Elettronica'),
(5, 'Tablet Apple', 600, 'Elettronica'),
(6, 'Tastiera Wireless', 80, 'Accessorio'),
(7, 'Monitor LG', 400, 'Periferica'),
(8, 'Cuffie Sony', 150, 'Accessorio'),
(9, 'Hard Disk esterno', 120, 'Periferica'),
(10, 'Fotocamera Canon', 700, 'Elettronica');

-- Inserimento dati di prova nella tabella Fornitori
INSERT INTO Fornitori (FornitoreID, NomeFornitore, Indirizzo, Email) VALUES
(101, 'ABC Elettronica', 'Via Roma, 123', 'abc@example.com'),
(102, 'XYZ Computer', 'Via Verdi, 456', 'xyz@example.com'),
(103, 'Tech Supplies', 'Corso Italia, 789', 'tech@example.com'),
(104, 'Elettronica srl', 'Via Milano, 10', 'elettronica@example.com'),
(105, 'Computer World', 'Via Torino, 5', 'computer@example.com'),
(106, 'Accessori Plus', 'Via Napoli, 20', 'accessori@example.com'),
(107, 'Periferiche Italia', 'Corso Firenze, 15', 'periferiche@example.com'),
(108, 'ElettronicaFutura', 'Via Bologna, 30', 'futura@example.com'),
(109, 'FornitureTech', 'Corso Venezia, 25', 'forniture@example.com'),
(110, 'Elettronica Store', 'Via Genova, 40', 'store@example.com');

-- Inserimento dati di prova nella tabella Inventario
INSERT INTO Inventario (MovimentoID, ProdottoID, FornitoreID, Quantita, DataMovimento) VALUES
(1, 1, 101, 10, '2022-03-01'),
(2, 2, 102, 5, '2022-03-02'),
(3, 3, 103, 20, '2022-03-03'),
(4, 4, 104, 15, '2022-03-04'),
(5, 5, 105, 8, '2022-03-05'),
(6, 6, 106, 30, '2022-03-06'),
(7, 7, 107, 12, '2022-03-07'),
(8, 8, 108, 25, '2022-03-08'),
(9, 9, 109, 18, '2022-03-09'),
(10, 10, 110, 22, '2022-03-10');

```

**Esempi di Query:**

1. **Seleziona tutti i prodotti con il loro prezzo:**

   ```sql
   SELECT NomeProdotto, Prezzo FROM Prodotti;
   ```

2. **Trova tutti i fornitori di un prodotto specifico:**

   ```sql
   SELECT Fornitori.NomeFornitore
   FROM Fornitori
   INNER JOIN Inventario ON Fornitori.FornitoreID = Inventario.FornitoreID
   WHERE Inventario.ProdottoID = 1;
   ```

3. **Calcola il totale delle quantità di prodotti per ogni categoria:**

   ```sql
   SELECT Categoria, SUM(Quantita) AS TotaleQuantita
   FROM Prodotti
   INNER JOIN Inventario ON Prodotti.ProdottoID = Inventario.ProdottoID
   GROUP BY Categoria;
   ```

---

### Esercizi

20 esercizi SQL relativi al database del magazzino di prodotti informatici. 
Prova a risolverli per praticare le tue competenze SQL:

1. **Esercizio su Join:**
   - Trova il nome del prodotto, il fornitore e la quantità disponibile in magazzino.

2. **Esercizio su Aggregazione:**
   - Calcola il totale del valore (prezzo * quantità) di ogni prodotto in magazzino.

3. **Esercizio su Filtraggio:**
   - Trova i fornitori che hanno fornito almeno 15 unità di prodotti.

4. **Esercizio su Inserimento dati:**
   - Aggiungi un nuovo prodotto al magazzino e assegna un fornitore esistente ad esso.

5. **Esercizio su Aggiornamento dati:**
   - Modifica il prezzo di un prodotto specifico.

6. **Esercizio su Sottoquery:**
   - Trova tutti i prodotti con un prezzo superiore alla media dei prezzi.

7. **Esercizio su Group By e Having:**
   - Trova i fornitori con almeno 2 prodotti in magazzino.

8. **Esercizio su Left Join:**
   - Trova il nome di tutti i prodotti e, se disponibile, il nome del fornitore che li ha forniti.

9. **Esercizio su Distinct:**
   - Trova tutte le categorie uniche di prodotti presenti in magazzino.

10. **Esercizio su Delete:**
    - Elimina un prodotto specifico dalla tabella Prodotti e tutti i movimenti associati nella tabella Inventario.

---

11. **Esercizio su WHERE:**
    - Trova tutti i prodotti con un prezzo superiore a 100.

12. **Esercizio su LIKE:**
    - Trova i prodotti il cui nome inizia con la lettera "L".

13. **Esercizio su ORDER BY:**
    - Mostra tutti i fornitori ordinati in ordine alfabetico.

14. **Esercizio su DISTINCT:**
    - Trova tutte le categorie uniche di prodotti presenti in magazzino.

15. **Esercizio su LIMIT:**
    - Visualizza i primi 5 prodotti in magazzino.

16. **Esercizio su IN:**
    - Trova i prodotti forniti dai fornitori con ID 101 e 103.

17. **Esercizio su IS NULL:**
    - Trova i prodotti senza un valore di prezzo.

18. **Esercizio su BETWEEN:**
    - Trova i movimenti in magazzino con una quantità compresa tra 5 e 15.

19. **Esercizio su GROUP BY con COUNT:**
    - Conta il numero di prodotti in ogni categoria.

20. **Esercizio su HAVING:**
    - Trova le categorie di prodotti con almeno 2 prodotti in magazzino.


