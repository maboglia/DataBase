# Introduzione alla Clausola `WHERE` in SQL

La clausola **`WHERE`** viene utilizzata in SQL per filtrare i dati su cui operare. È applicabile non solo alle query di selezione (**`SELECT`**), ma anche alle operazioni di aggiornamento (**`UPDATE`**) e cancellazione (**`DELETE`**). Grazie a questa clausola, puoi specificare le condizioni che determinano quali righe includere o modificare.

---

### **Sintassi Base**

- **`SELECT`**:

  ```sql
  SELECT colonne
  FROM tabella
  WHERE condizione;
  ```

- **`UPDATE`**:

  ```sql
  UPDATE tabella
  SET colonna = valore
  WHERE condizione;
  ```

- **`DELETE`**:

  ```sql
  DELETE FROM tabella
  WHERE condizione;
  ```

---

### **Esempi**

#### **1. Selezione Condizionata**

Ottenere tutti i prodotti con prezzo superiore a 100:

```sql
SELECT * 
FROM prodotti
WHERE Prezzo > 100;
```

#### **2. Aggiornamento Condizionato**

Aggiornare il prezzo dei prodotti nella categoria "Casa":

```sql
UPDATE prodotti
SET Prezzo = Prezzo * 1.1
WHERE Categoria = 'Casa';
```

#### **3. Cancellazione Condizionata**

Eliminare prodotti con prezzo inferiore a 20:

```sql
DELETE FROM prodotti
WHERE Prezzo < 20;
```

---

### **Note Importanti**

1. **Condizioni Multiple**: Puoi combinare condizioni con **`AND`**, **`OR`** e parentesi per la priorità.
2. **Valori Null**: Usa **`IS NULL`** o **`IS NOT NULL`** per filtrare valori mancanti.
3. **Prestazioni**: Aggiungere indici sui campi usati in **`WHERE`** migliora le prestazioni delle query.

La clausola **`WHERE`** è essenziale per operare in modo mirato sui dati, evitando modifiche o selezioni su intere tabelle.

---

# Le operazioni di filtraggio dei dati

Ecco alcuni **esempi** di operazioni di filtraggio usando la clausola WHERE in SQL:

---

1. **Filtro su un Valore Specifico:**
   - Restituisci tutte le righe dove la colonna "Nome" è uguale a 'Mario'.

   ```sql
   SELECT *
   FROM Tabella
   WHERE Nome = 'Mario';
   ```

---

2. **Filtro con Operatori di Confronto:**
   - Restituisci le righe dove la colonna "Quantità" è maggiore di 10.

   ```sql
   SELECT *
   FROM Magazzino
   WHERE Quantità > 10;
   ```

---

3. **Filtro con Operatori Logici:**
   - Restituisci le righe dove la colonna "Categoria" è 'Elettronica' e la colonna "Prezzo" è inferiore a 500.

   ```sql
   SELECT *
   FROM Prodotti
   WHERE Categoria = 'Elettronica' AND Prezzo < 500;
   ```

---

4. **Filtro con Operatori di Stringa:**
   - Restituisci le righe che contengono la parola 'Java' nella colonna "Linguaggio".

   ```sql
   SELECT *
   FROM Corsi
   WHERE Linguaggio LIKE '%Java%';
   ```

---

5. **Filtro con IN:**
   - Restituisci le righe dove la colonna "Colore" è 'Rosso' o 'Blu'.

   ```sql
   SELECT *
   FROM Auto
   WHERE Colore IN ('Rosso', 'Blu');
   ```

---

6. **Filtro con IS NULL:**
   - Restituisci le righe dove la colonna "Note" è NULL.

   ```sql
   SELECT *
   FROM Ordini
   WHERE Note IS NULL;
   ```

---

7. **Filtro con BETWEEN:**
   - Restituisci le righe dove la colonna "Punteggio" è compresa tra 70 e 90 inclusi.

   ```sql
   SELECT *
   FROM Studenti
   WHERE Punteggio BETWEEN 70 AND 90;
   ```

---

8. **Filtro con LIKE e ESCAPE:**
   - Restituisci le righe che iniziano con 'A' e contengono una seconda lettera che può essere 'r' o 't'.

   ```sql
   SELECT *
   FROM Parole
   WHERE Parola LIKE 'A%[rt]%';
   ```

Sperimenta con questi esempi per comprendere come la clausola WHERE può essere utilizzata per filtrare dati in base a diverse condizioni.

---

## Esercizi con la clausola WHERE

Basandoti sulla struttura della tabella `prodotti` (che ha le colonne `prodotto`, `prezzo` e `categoria`), ecco 10 esercizi dal più semplice a quello leggermente più avanzato.

[Tabella prodotti](../09_data/prodotti.sql)

---

### Esercizi SQL: La Clausola WHERE

1. **Filtro Categoria:** Seleziona tutti i prodotti che appartengono alla categoria 'Informatica'.
2. **Prezzo Alto:** Trova il nome e il prezzo di tutti i prodotti che costano più di 500 euro.
3. **Piccoli Prezzi:** Visualizza tutti i prodotti che hanno un prezzo inferiore a 50 euro.
4. **Ricerca per Nome:** Trova tutti i prodotti che si chiamano esattamente 'Smartphone'.
5. **Inizio Parola:** Seleziona tutti i prodotti il cui nome inizia con la lettera 'S' (usa l'operatore `LIKE`).
6. **Doppia Condizione (AND):** Trova i prodotti della categoria 'Abbigliamento' che costano meno di 30 euro.
7. **Scelta Multipla (OR):** Visualizza i prodotti che appartengono alla categoria 'Telefonia' oppure alla categoria 'Elettrodomestici'.
8. **Intervallo di Prezzo:** Trova tutti i prodotti che hanno un prezzo compreso tra 100 e 500 euro (usa l'operatore `BETWEEN`).
9. **Esclusione:** Seleziona tutti i prodotti che **non** appartengono alla categoria 'Sport'.
10. **Contiene Testo:** Trova tutti i prodotti che contengono la parola 'Gaming' all'interno del nome.

---

### Un piccolo aiuto: Come si scrive la query?

Ecco uno schema di base che puoi usare come trucco:

```sql
SELECT * FROM prodotti 
WHERE colonna = 'valore';

```

> **Nota:** Ricorda che per i **testi** devi usare gli apici singoli (`'testo'`), mentre per i **numeri** (come i prezzi) non servono.

---

### Le Soluzioni (per controllare il tuo lavoro)

| Es.    | Query Suggerita                                                                           |
| ------ | ----------------------------------------------------------------------------------------- |
| **1**  | `SELECT * FROM prodotti WHERE categoria = 'Informatica';`                                 |
| **2**  | `SELECT prodotto, prezzo FROM prodotti WHERE prezzo > 500;`                               |
| **3**  | `SELECT * FROM prodotti WHERE prezzo < 50;`                                               |
| **4**  | `SELECT * FROM prodotti WHERE prodotto = 'Smartphone';`                                   |
| **5**  | `SELECT * FROM prodotti WHERE prodotto LIKE 'S%';`                                        |
| **6**  | `SELECT * FROM prodotti WHERE categoria = 'Abbigliamento' AND prezzo < 30;`               |
| **7**  | `SELECT * FROM prodotti WHERE categoria = 'Telefonia' OR categoria = 'Elettrodomestici';` |
| **8**  | `SELECT * FROM prodotti WHERE prezzo BETWEEN 100 AND 500;`                                |
| **9**  | `SELECT * FROM prodotti WHERE categoria != 'Sport';`                                      |
| **10** | `SELECT * FROM prodotti WHERE prodotto LIKE '%Gaming%';`                                  |

---

## Aggiungiamo la clausola ORDER BY

Se la clausola `WHERE` serve a filtrare (come scegliere solo i prodotti di una marca), la clausola **`ORDER BY`** serve a mettere in ordine i risultati. È come quando sul tuo telefono decidi di ordinare i messaggi dal più recente o i contatti dalla A alla Z.

[Scheda su ordinamento dei dati](0034_ORDER_BY.md)

---

Ecco come funziona in breve:

* **`ASC`**: (Ascending) dal più piccolo al più grande (A-Z, 1-10). È il valore predefinito.
* **`DESC`**: (Descending) dal più grande al più piccolo (Z-A, 10-1).

---

### Esercizi SQL: Ordinare i dati con ORDER BY

Prova a risolvere questi 10 esercizi (alcuni combinano anche il `WHERE` che abbiamo visto prima):

1. **Ordine Alfabetico:** Mostra tutti i prodotti ordinati per nome, dalla A alla Z.
2. **Dal più economico:** Elenca tutti i prodotti ordinati per prezzo, dal più basso al più alto.
3. **Il più caro prima:** Visualizza tutti i prodotti ordinati per prezzo, dal più costoso al più economico.
4. **Informatica ordinata:** Seleziona solo i prodotti della categoria 'Informatica' e ordinali dal più economico al più caro.
5. **Z-A:** Mostra i nomi dei prodotti in ordine alfabetico inverso (dalla Z alla A).
6. **Top di gamma:** Trova i prodotti che costano più di 100 euro e ordinali dal più caro al più economico.
7. **Doppio Ordine:** Ordina i prodotti prima per **categoria** (A-Z) e, all'interno di ogni categoria, per **prezzo** (dal più basso al più alto).
8. **Ricerca specifica:** Trova tutti i prodotti che contengono la parola 'Pro' e ordinali per nome.
9. **Sconto in vista:** Mostra i prodotti che costano meno di 50 euro, ordinandoli per prezzo decrescente.
10. **Ultime lettere:** Seleziona i prodotti della categoria 'Elettronica' e ordinali in ordine alfabetico inverso.

---

### Soluzioni per il controllo

Ecco le query corrette per verificare se hai fatto centro:

| Es.    | Query Suggerita                                                                  |
| ------ | -------------------------------------------------------------------------------- |
| **1**  | `SELECT * FROM prodotti ORDER BY prodotto ASC;`                                  |
| **2**  | `SELECT * FROM prodotti ORDER BY prezzo ASC;`                                    |
| **3**  | `SELECT * FROM prodotti ORDER BY prezzo DESC;`                                   |
| **4**  | `SELECT * FROM prodotti WHERE categoria = 'Informatica' ORDER BY prezzo ASC;`    |
| **5**  | `SELECT * FROM prodotti ORDER BY prodotto DESC;`                                 |
| **6**  | `SELECT * FROM prodotti WHERE prezzo > 100 ORDER BY prezzo DESC;`                |
| **7**  | `SELECT * FROM prodotti ORDER BY categoria ASC, prezzo ASC;`                     |
| **8**  | `SELECT * FROM prodotti WHERE prodotto LIKE '%Pro%' ORDER BY prodotto ASC;`      |
| **9**  | `SELECT * FROM prodotti WHERE prezzo < 50 ORDER BY prezzo DESC;`                 |
| **10** | `SELECT * FROM prodotti WHERE categoria = 'Elettronica' ORDER BY prodotto DESC;` |

> **Trucco da pro:** Ricorda che se scrivi `ORDER BY prezzo` senza aggiungere altro, il database lo ordinerà automaticamente in modo crescente (`ASC`).

---

## Raggruppare i risultati per effettuare operazioni complesse

Il **`GROUP BY`** è uno dei comandi più potenti di SQL. Se `WHERE` filtra e `ORDER BY` ordina, `GROUP BY` serve a **fare statistiche**.

Immagina di avere un sacco di mattoncini LEGO di vari colori: con `GROUP BY` puoi dividerli in mucchietti per colore e poi contare quanti ce ne sono in ogni mucchietto, o vedere qual è il pezzo più grande di ogni gruppo.

[Scheda su raggruppamento dei dati](0038_Raggruppamento.md)

---

### I "Superpoteri" del GROUP BY (Funzioni di Aggregazione)

Per usare il `GROUP BY`, hai bisogno di alcune funzioni speciali:

* **`COUNT()`**: Conta quanti elementi ci sono.
* **`SUM()`**: Somma i valori (es. quanto costano tutti i prodotti insieme).
* **`AVG()`**: Fa la media (Average).
* **`MAX()` / `MIN()**`: Trova il valore più alto o più basso.

---

### Esercizi SQL: Raggruppare i dati con GROUP BY

Ecco 10 sfide per diventare un esperto di dati:

1. **Quanti prodotti?** Conta quanti prodotti ci sono in ogni categoria.
2. **Prezzo medio:** Calcola il prezzo medio dei prodotti per ogni categoria.
3. **Il più caro per categoria:** Trova il prezzo massimo per ogni categoria.
4. **Il più economico per categoria:** Trova il prezzo minimo per ogni categoria.
5. **Valore totale:** Somma i prezzi di tutti i prodotti, raggruppati per categoria.
6. **Filtra e raggruppa:** Conta quanti prodotti ci sono per ogni categoria, ma considera solo quelli che costano più di 50 euro.
7. **Classifica categorie:** Mostra il numero di prodotti per categoria, ordinando il risultato dal più numeroso al meno numeroso.
8. **Media ordinata:** Mostra la media dei prezzi per categoria, ordinata dalla media più alta alla più bassa.
9. **Il Filtro dei Gruppi (HAVING):** Mostra solo le categorie che hanno più di 3 prodotti (Suggerimento: usa `HAVING COUNT(*) > 3`).
10. **Riepilogo completo:** Per ogni categoria, mostra il numero di prodotti, il prezzo minimo e il prezzo massimo.

---

### Schema della Query

La struttura diventa un po' più lunga, ma segue sempre questo ordine:

```sql
SELECT colonna_gruppo, FUNZIONE(colonna_calcolo)
FROM prodotti
WHERE ... (se serve filtrare prima)
GROUP BY colonna_gruppo
HAVING ... (se serve filtrare il risultato del gruppo)
ORDER BY ... (se serve ordinare)

```

---

### Soluzioni per il controllo

| Es.    | Query Suggerita                                                                             |
| ------ | ------------------------------------------------------------------------------------------- |
| **1**  | `SELECT categoria, COUNT(*) FROM prodotti GROUP BY categoria;`                              |
| **2**  | `SELECT categoria, AVG(prezzo) FROM prodotti GROUP BY categoria;`                           |
| **3**  | `SELECT categoria, MAX(prezzo) FROM prodotti GROUP BY categoria;`                           |
| **4**  | `SELECT categoria, MIN(prezzo) FROM prodotti GROUP BY categoria;`                           |
| **5**  | `SELECT categoria, SUM(prezzo) FROM prodotti GROUP BY categoria;`                           |
| **6**  | `SELECT categoria, COUNT(*) FROM prodotti WHERE prezzo > 50 GROUP BY categoria;`            |
| **7**  | `SELECT categoria, COUNT(*) FROM prodotti GROUP BY categoria ORDER BY COUNT(*) DESC;`       |
| **8**  | `SELECT categoria, AVG(prezzo) FROM prodotti GROUP BY categoria ORDER BY AVG(prezzo) DESC;` |
| **9**  | `SELECT categoria, COUNT(*) FROM prodotti GROUP BY categoria HAVING COUNT(*) > 3;`          |
| **10** | `SELECT categoria, COUNT(*), MIN(prezzo), MAX(prezzo) FROM prodotti GROUP BY categoria;`    |

> **Attenzione:** Se usi `GROUP BY categoria`, nella parte `SELECT` puoi mettere solo la colonna `categoria` o delle funzioni (come `COUNT`, `SUM`, ecc.). Non puoi chiedere il nome del singolo prodotto, perché il database non saprebbe quale farti vedere di tutto il gruppo!

