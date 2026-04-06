# L'Aggregazione dei dati in SQL (`GROUP BY` e `ROLLUP`)

## 💡 Obiettivo della lezione

Comprendere come raggruppare i dati in un database relazionale per estrarre informazioni riassuntive (statistiche, somme, medie) e come generare automaticamente i subtotali attraverso l'operatore `ROLLUP`.

---

## 1. La clausola `GROUP BY` (Il Raggruppamento Base)

In SQL, la clausola `GROUP BY` viene utilizzata per raccogliere i dati di più righe e raggrupparli in base ai valori di una o più colonne. Si usa quasi sempre in combinazione con le **funzioni di aggregazione** come:

* `SUM()` (Somma)
* `COUNT()` (Conta le righe)
* `AVG()` (Media)
* `MAX()` / `MIN()` (Valore massimo / minimo)

### 📌 Regola d'oro di GROUP BY

Tutte le colonne inserite nel `SELECT` che non sono racchiuse dentro una funzione di aggregazione **devono** essere inserite nella clausola `GROUP BY`.

### 📝 Esempio Pratico

Immaginiamo una tabella chiamata `Vendite`:

| ID | Regione | Prodotto | Importo |
| :--- | :--- | :--- | :--- |
| 1 | Nord | Penna | 10 |
| 2 | Nord | Matita | 5 |
| 3 | Sud | Penna | 15 |
| 4 | Sud | Penna | 20 |

Se vogliamo sapere il totale delle vendite per ogni singola **Regione**, scriveremo:

```sql
SELECT Regione, SUM(Importo) AS Totale
FROM Vendite
GROUP BY Regione;
```

**Risultato:**

| Regione | Totale |
| :--- | :--- |
| Nord | 15 |
| Sud | 35 |

---

## 2. L'operatore `ROLLUP` (Subtotali e Totale Generale)

Quando prepariamo dei report aziendali, spesso non vogliamo solo i dati raggruppati, ma abbiamo bisogno anche dei **subtotali** e del **totale complessivo**.

Invece di scrivere tante query diverse e unirle con l'operatore `UNION`, SQL ci mette a disposizione `ROLLUP`. Esso è un'estensione del `GROUP BY`.

### 🔍 Come funziona?

`ROLLUP` crea raggruppamenti gerarchici partendo da destra verso sinistra tra le colonne indicate tra parentesi, fino a produrre una riga finale con il totale generale (dove i valori di raggruppamento saranno visualizzati come `NULL`).

### 📝 Esempio Pratico con ROLLUP

Usiamo la stessa tabella `Vendite` di prima, ma questa volta raggruppiamo sia per **Regione** che per **Prodotto**, aggiungendo `ROLLUP`.

*Nota: La sintassi può variare leggermente a seconda del Database (es. `WITH ROLLUP` in MySQL oppure `GROUP BY ROLLUP(...)` in SQL Server/Oracle).*

```sql
-- Sintassi standard ISO (SQL Server, Oracle, PostgreSQL)
SELECT Regione, Prodotto, SUM(Importo) AS Totale
FROM Vendite
GROUP BY ROLLUP (Regione, Prodotto);
```

**Risultato della query:**

| Regione | Prodotto | Totale | Spiegazione della riga |
| :--- | :--- | :--- | :--- |
| Nord | Matita | 5 | Dettaglio per riga |
| Nord | Penna | 10 | Dettaglio per riga |
| **Nord** | **NULL** | **15** | **Subtotale della regione Nord** |
| Sud | Penna | 35 | Dettaglio per riga |
| **Sud** | **NULL** | **35** | **Subtotale della regione Sud** |
| **NULL** | **NULL** | **50** | **TOTALE GENERALE di tutte le righe** |

Come puoi notare, il database ha inserito delle righe extra inserendo `NULL` laddove il dato è stato "sommato" al livello superiore.

---

## 🧠 Mettiti alla prova: Esercizi

### Esercizio 1 (Livello Base)

Data una tabella `Studenti` con le colonne `Classe` e `Voto`, scrivi una query SQL per trovare la media dei voti per ogni classe.

### Esercizio 2 (Livello Avanzato)

Hai una tabella `Magazzino` con le colonne `Reparto`, `Scaffale` e `Quantita`.
Scrivi una query utilizzando `ROLLUP` per ottenere:

1. Il totale dei prodotti per ogni specifico scaffale di ogni reparto.
2. Il totale complessivo dei prodotti per ciascun reparto.
3. Il totale generale di tutti i prodotti presenti nel magazzino.

---

## 🏁 Riepilogo Concettuale

* Usiamo **`GROUP BY`** quando vogliamo dividere i dati in categorie logiche e applicare funzioni matematiche su di esse.
* Usiamo **`ROLLUP`** all'interno del `GROUP BY` quando vogliamo che il database calcoli in automatico una gerarchia di somme fino ad arrivare al totale finale di tutta la tabella.

[Focalizza l'apprendimento su ROLLUP e CUBE in SQL](https://www.youtube.com/watch?v=2SMZD0Aw378)

Questo video ti mostrerà visivamente come passaggi di query complessi per generare report con subtotali vengano ridotti a poche righe di codice grazie all'uso di estensioni come ROLLUP.

---

## Raggruppamento e funzioni built-in

Esempi di query SQL che utilizzano **funzioni** implicite (già definite e disponibili) e raggruppamenti:

---

1. **Conteggio delle righe:**
   - Trova il numero totale di prodotti presenti in magazzino.

   ```sql
   SELECT COUNT(*) AS NumeroProdotti
   FROM Prodotti;
   ```

---

2. **Somma dei valori:**
   - Calcola la somma totale del valore degli ordini.

   ```sql
   SELECT SUM(Valore) AS SommaValoreOrdini
   FROM Ordini;
   ```

---

3. **Media dei valori:**
   - Calcola la media dei prezzi dei prodotti nella categoria "Elettronica".

   ```sql
   SELECT AVG(Prezzo) AS MediaPrezzoElettronica
   FROM Prodotti
   WHERE Categoria = 'Elettronica';
   ```

---

4. **Valore massimo:**
   - Trova il prezzo massimo tra tutti i prodotti.

   ```sql
   SELECT MAX(Prezzo) AS PrezzoMassimo
   FROM Prodotti;
   ```

---

5. **Valore minimo:**
   - Trova il prezzo minimo tra tutti i prodotti.

   ```sql
   SELECT MIN(Prezzo) AS PrezzoMinimo
   FROM Prodotti;
   ```

---

6. **Raggruppamento con COUNT:**
   - Conta il numero di prodotti disponibili in ciascuna categoria.

   ```sql
   SELECT Categoria, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY Categoria;
   ```

---

7. **Raggruppamento con SUM:**
   - Calcola il valore totale degli ordini per ciascun cliente.

   ```sql
   SELECT ClienteID, SUM(Valore) AS ValoreTotaleOrdini
   FROM Ordini
   GROUP BY ClienteID;
   ```

---

8. **Raggruppamento con AVG:**
   - Calcola la media delle valutazioni per ciascun fornitore.

   ```sql
   SELECT ID_Fornitore, AVG(Valutazione) AS MediaValutazione
   FROM Fornitori
   GROUP BY ID_Fornitore;
   ```

---

9. **Raggruppamento con HAVING:**
   - Trova le categorie con un numero minimo di prodotti.

   ```sql
   SELECT Categoria, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY Categoria
   HAVING COUNT(*) >= 5;
   ```

---

10. **Utilizzo di funzioni di data:**

- Trova la data dell'ordine più recente.

   ```sql
   SELECT MAX(DataOrdine) AS UltimaDataOrdine
   FROM Ordini;
   ```

Questi sono esempi di come puoi utilizzare **funzioni aggregate e clausole di raggruppamento** nelle tue query SQL per ottenere informazioni aggregate e statistiche dai dati del tuo database.

---

## Altri esempi più complessi

Esempi di utilizzo delle funzioni di raggruppamento (**GROUP BY**) e della clausola **HAVING**:

---

1. **Raggruppamento e Conteggio:**
   - Conta quanti prodotti ci sono in ciascuna categoria.

   ```sql
   SELECT Categoria, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY Categoria;
   ```

---

2. **Raggruppamento e Somma:**
   - Calcola la somma delle quantità disponibili per ciascun fornitore.

   ```sql
   SELECT ID_Fornitore, SUM(Quantità_Disponibile) AS SommaQuantità
   FROM Prodotti
   GROUP BY ID_Fornitore;
   ```

---

3. **Raggruppamento e Media con Filtraggio:**
   - Calcola la media dei prezzi solo per i prodotti con valutazione superiore a 4.

   ```sql
   SELECT Categoria, AVG(Prezzo) AS MediaPrezzo
   FROM Prodotti
   WHERE Valutazione > 4
   GROUP BY Categoria;
   ```

---

4. **Raggruppamento e Minimo/Massimo:**
   - Trova il prezzo minimo e massimo per ciascuna categoria.

   ```sql
   SELECT Categoria, MIN(Prezzo) AS PrezzoMinimo, MAX(Prezzo) AS PrezzoMassimo
   FROM Prodotti
   GROUP BY Categoria;
   ```

---

5. **Filtraggio con HAVING:**
   - Trova le categorie con una media di valutazione superiore a 3.

   ```sql
   SELECT Categoria, AVG(Valutazione) AS MediaValutazione
   FROM Prodotti
   GROUP BY Categoria
   HAVING AVG(Valutazione) > 3;
   ```

---

6. **Filtraggio con HAVING e Conteggio:**
   - Trova i fornitori con più di 5 prodotti in magazzino.

   ```sql
   SELECT ID_Fornitore, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY ID_Fornitore
   HAVING COUNT(*) > 5;
   ```

---

7. **Raggruppamento su più colonne:**
   - Conta il numero di prodotti per ciascun fornitore in ogni categoria.

   ```sql
   SELECT ID_Fornitore, Categoria, COUNT(*) AS NumeroProdotti
   FROM Prodotti
   GROUP BY ID_Fornitore, Categoria;
   ```

Questi esempi mostrano come utilizzare GROUP BY e HAVING per eseguire operazioni di raggruppamento, filtraggio e calcoli aggregati in SQL.
