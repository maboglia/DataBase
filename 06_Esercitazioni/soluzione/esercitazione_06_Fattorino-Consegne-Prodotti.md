# Esercitazione 06

## Esercitazione SQL sull'argomento "Fattorino, Consegne, Prodotti"

Scenario:
Immagina di essere il responsabile di un'azienda di consegna di cibo a domicilio. La tua azienda ha un database relazionale per gestire i fattorini, le consegne e i prodotti. Il database contiene le seguenti tabelle:

1. `Fattorini`:
   - `id` (identificatore unico)
   - `nome` (nome del fattorino)
   - `cognome` (cognome del fattorino)
   - `data_assunzione` (data di assunzione del fattorino)

2. `Consegne`:
   - `id` (identificatore unico)
   - `id_fattorino` (chiave esterna che fa riferimento all'id del fattorino che ha effettuato la consegna)
   - `data_consegna` (data e ora della consegna)
   - `importo_totale` (importo totale dell'ordine)
   - `destinazione` (indirizzo di consegna)

3. `Prodotti`:
   - `id` (identificatore unico)
   - `nome` (nome del prodotto)
   - `prezzo` (prezzo del prodotto)
   - `disponibilità` (quantità disponibile del prodotto)

**Obiettivo dell'esercizio:** Scrivere query SQL per estrarre informazioni utili relative ai fattorini, alle consegne e ai prodotti.

---

### dati di prova

Ecco degli esempi di istruzioni `INSERT` per inserire dati di prova nelle tabelle `Fattorini`, `Consegne`, e `Prodotti`:

```sql
-- Inserimento dati di prova per la tabella Fattorini
INSERT INTO Fattorini (nome, cognome, data_assunzione)
VALUES 
    ('Mario', 'Rossi', '2019-05-15'),
    ('Luigi', 'Bianchi', '2020-02-10'),
    ('Giovanna', 'Verdi', '2018-11-20'),
    ('Anna', 'Neri', '2017-08-25');

-- Inserimento dati di prova per la tabella Prodotti
INSERT INTO Prodotti (nome, prezzo, disponibilità)
VALUES 
    ('Pizza Margherita', 8.50, 20),
    ('Pasta al Pesto', 9.00, 15),
    ('Hamburger', 7.00, 25),
    ('Insalata mista', 6.50, 10),
    ('Gelato al Cioccolato', 3.50, 30);

-- Inserimento dati di prova per la tabella Consegne
INSERT INTO Consegne (id_fattorino, data_consegna, importo_totale, destinazione)
VALUES 
    (1, '2024-03-01 12:30:00', 20.50, 'Via Roma, 1'),
    (2, '2024-03-02 19:00:00', 15.00, 'Via Garibaldi, 5'),
    (3, '2024-03-03 13:45:00', 12.00, 'Piazza Vittoria, 3'),
    (4, '2024-03-04 20:30:00', 18.50, 'Corso Italia, 10'),
    (1, '2024-03-05 18:15:00', 25.00, 'Via Dante, 15'),
    (2, '2024-03-06 12:00:00', 10.50, 'Piazza Duomo, 8'),
    (3, '2024-03-07 21:00:00', 22.00, 'Via Verdi, 6'),
    (4, '2024-03-08 19:45:00', 17.50, 'Corso Vittorio Emanuele, 20'),
    (1, '2024-03-09 14:20:00', 30.00, 'Via Milano, 12'),
    (2, '2024-03-10 20:10:00', 16.50, 'Corso Garibaldi, 30');
```

Queste istruzioni `INSERT` inseriscono dati di prova nelle tabelle `Fattorini`, `Prodotti`, e `Consegne`, creando un piccolo set di dati per eseguire query di esempio. Assicurati di adattare questi dati di prova alle tue esigenze specifiche se necessario.

---

Esercitazione:

1. Trova tutti i fattorini assunti prima del 2020.

2. Mostra l'elenco di tutti i prodotti disponibili ordinati per prezzo crescente.

3. Calcola l'importo totale delle consegne effettuate da ciascun fattorino.

4. Trova il fattorino che ha effettuato il maggior numero di consegne.

5. Aggiorna la quantità disponibile di un prodotto dopo una consegna.

6. Trova il prodotto più costoso disponibile.

7. Conta quanti prodotti diversi sono stati consegnati in totale.

Soluzione:

1. 
```sql
SELECT * FROM Fattorini WHERE data_assunzione < '2020-01-01';
```

2. 
```sql
SELECT * FROM Prodotti ORDER BY prezzo ASC;
```

3. 
```sql
SELECT 
    f.id, 
    f.nome, 
    SUM(c.importo_totale) AS totale_consegne
FROM 
    Fattorini f
JOIN Consegne c ON f.id = c.id_fattorino
GROUP BY 
    f.id, f.nome;
```

4. 
```sql
SELECT 
    id_fattorino,
    COUNT(*) AS num_consegne
FROM 
    Consegne
GROUP BY 
    id_fattorino
ORDER BY 
    num_consegne DESC
LIMIT 1;
```

5. 
```sql
UPDATE Prodotti
SET disponibilità = disponibilità - [quantità_consegnata]
WHERE id = [id_prodotto];
```

6. 
```sql
SELECT * FROM Prodotti ORDER BY prezzo DESC LIMIT 1;
```

7. 
```sql
SELECT COUNT(DISTINCT id_prodotto) AS num_prodotti_consegnati FROM Consegne;
```

Questi esempi di query SQL dovrebbero aiutarti a esercitarti sull'uso delle operazioni di base del linguaggio SQL applicate al contesto di un'azienda di consegna.