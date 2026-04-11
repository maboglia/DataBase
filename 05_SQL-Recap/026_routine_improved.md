# Esercitazione SQL: Pipeline Completa

## NOTE

Per affrontare questa routine SQL in modo professionale, non basta scrivere i comandi a caso: serve un **workflow strutturato**.

Ecco la sequenza logica delle operazioni e la guida su come consegnare il lavoro preservando tutto lo storico, anche dopo aver "distrutto" il database.

---

## 🛠 Sequenza Logica di Esecuzione

Per completare l'esercizio con successo, segui questo ordine (che raggruppa i tuoi 30 punti in fasi operative):

1. **Ambiente e Accessi (Punti 1-4):** Setup iniziale del database e creazione dell'utente amministratore dell'esercizio.
2. **Architettura e Schema (Punti 5-7):** Definizione delle tabelle. È fondamentale creare prima `Clienti` e `Prodotti`, e solo dopo `Ordini` (che dipende dalle altre due).
3. **Popolamento e Test Vincoli (Punti 8-10, 18):** Inserimento dati "sani" e test intenzionale di errori (es. quantità negativa) per verificare che i `CHECK` funzionino.
4. **Logica Programmabile (Punti 23-25):** Creazione di Trigger, Funzioni e Procedure. **Nota:** Crea queste componenti *prima* delle query avanzate, così potrai usarle per popolare o analizzare i dati.
5. **Analisi Dati (Punti 11-14, 19-22, 26-29, Bonus):** Esecuzione di SELECT, JOIN, Subquery e creazione della View.
6. **Manutenzione e Cleanup (Punti 15-17, 30):** Modifica dati, test della `ON DELETE CASCADE` e, infine, distruzione delle strutture.

---

## 📝 Come consegnare (Salvare Query e Risultati)

Se esegui `DROP DATABASE`, i dati spariscono, ma il tuo lavoro deve restare. Per creare un **unico file di testo** che contenga tutto, segui il metodo del **"Log Script"**.

### Metodo A: Utilizzo del terminale (Consigliato)

Se usi MySQL/MariaDB da terminale, puoi usare il comando `tee`. Questo comando salva in un file sia ciò che scrivi, sia ciò che il database risponde.

1. Apri il terminale e connettiti a MySQL.
2. Digita: `tee esercitazione_sql_cognome.txt;`
3. Esegui tutte le tue query (dalla 1 alla 30).
4. Alla fine digita: `notee;`

Il file `esercitazione_sql_cognome.txt` conterrà l'intera sessione: comandi, tabelle di output e messaggi di errore.

### Metodo B: Redazione Manuale (Editor di testo)

Se usi interfacce grafiche (come Workbench o DBeaver), crea un file `.sql` o `.txt` strutturato così:

```sql
-- ****************************************************
-- ESERCITAZIONE SQL ROUTINE - Nome Cognome
-- ****************************************************

-- 1. Creazione Database
CREATE DATABASE EsercizioSQL;
-- Risultato: Query OK, 1 row affected

-- ... (tutte le altre query) ...

-- 30. Cleanup finale
DROP DATABASE EsercizioSQL;
DROP USER 'esercizio_user'@'localhost';
```

---

## 💡 Suggerimenti Tecnici per i punti critici

### Il Trigger e la Giacenza (Punto 25)

Ricorda che il trigger deve agire **AFTER INSERT** sulla tabella `Ordini`.

### La Stored Procedure (Punto 23)

Ecco un esempio di logica per la procedura:

```sql
DELIMITER //
CREATE PROCEDURE AggiungiOrdine(IN p_id_cliente INT, IN p_id_prodotto INT, IN p_quantita INT)
BEGIN
    DECLARE v_giacenza INT;
    SELECT giacenza INTO v_giacenza FROM Prodotti WHERE id = p_id_prodotto;
    
    IF v_giacenza >= p_quantita THEN
        INSERT INTO Ordini(id_cliente, id_prodotto, quantita) VALUES (p_id_cliente, p_id_prodotto, p_quantita);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Giacenza insufficiente!';
    END IF;
END //
DELIMITER ;
```

### Il test del DELETE CASCADE (Punto 16)

Quando proverai a eliminare un cliente (punto 16), se hai impostato correttamente `ON DELETE CASCADE` sulla chiave esterna di `Ordini`, il database **non darà errore**: eliminerà automaticamente tutti gli ordini di quel cliente. Se non avessi messo il cascade, il DB ti bloccherebbe per proteggere l'integrità dei dati.

Hai tutto ciò che ti serve per iniziare! Se hai dubbi su una specifica query della lista, chiedi pure.

---

## Lista dei task

Ecco la lista dei task riorganizzata secondo la sequenza logica di esecuzione che ti ho suggerito, pronta per essere copiata nel tuo file di testo/script come commenti per guidare lo svolgimento dell'esercitazione.

---

### **📋 Check-list Operativa SQL Routine**

#### **Fase 1: Setup Ambiente (DCL)**

- [ ] **Task 1:** Crea database `EsercizioSQL`.
- [ ] **Task 2:** Crea utente `esercizio_user` con password `'password123'`.
- [ ] **Task 3:** Assegna tutti i privilegi all'utente sul DB creato.
- [ ] **Task 4:** Esegui il `FLUSH PRIVILEGES` per rendere effettive le modifiche.

#### **Fase 2: Definizione Struttura (DDL)**

- [ ] **Task 5:** Crea tabella `Clienti` (PK, Unique constraints).
- [ ] **Task 6:** Crea tabella `Prodotti` (PK, `CHECK` su prezzo > 0, colonna `giacenza` necessaria per i task successivi).
- [ ] **Task 7:** Crea tabella `Ordini` (PK, FK verso clienti e prodotti, `ON DELETE CASCADE`).

#### **Fase 3: Logica Programmabile (Trigger, Funzioni, Procedure)**

- [ ] **Task 24:** Crea funzione `CalcolaTotaleOrdine(id_ordine)` (Quantità × Prezzo).
- [ ] **Task 25:** Crea **Trigger** per decrementare la giacenza in `Prodotti` dopo ogni `INSERT` su `Ordini`.
- [ ] **Task 23:** Crea **Stored Procedure** `AggiungiOrdine` (inserisce solo se la giacenza è sufficiente).

#### **Fase 4: Popolamento e Test Vincoli (DML)**

- [ ] **Task 8:** Inserisci almeno 2 clienti.
- [ ] **Task 9:** Inserisci almeno 2 prodotti.
- [ ] **Task 10:** Inserisci almeno 2 ordini (usa la procedura o INSERT manuale).
- [ ] **Task 18:** **Test Vincolo:** Prova a inserire un ordine con quantità negativa (deve fallire).

#### **Fase 5: Analisi e Query (DQL)**

- [ ] **Task 11:** Query `JOIN` completa (Clienti + Prodotti + Ordini).
- [ ] **Task 12:** `COUNT` ordini per ogni cliente.
- [ ] **Task 13:** Filtro `HAVING` (clienti con più di un ordine).
- [ ] **Task 14:** Calcolo totale speso per cliente.
- [ ] **Task 19:** Subquery: Clienti che hanno fatto almeno un ordine.
- [ ] **Task 20:** Prodotti acquistati più di una volta.
- [ ] **Task 21:** Nome del cliente "Top Spender".
- [ ] **Task 22:** Prodotti mai ordinati (`LEFT JOIN` o `NOT IN`).
- [ ] **Task 26:** Clienti con più prodotti diversi (Subquery).
- [ ] **Task 27:** Cliente con l'ordine singolo più alto.
- [ ] **Task 28:** Conteggio prodotti distinti per cliente.
- [ ] **Task 29:** Prodotti sottoscorta (giacenza < totale ordinato).
- [ ] **Bonus:** Crea una `VIEW` riepilogativa completa.

#### **Fase 6: Modifica e Integrità**

- [ ] **Task 15:** `UPDATE` prezzo del Laptop a 1300.00.
- [ ] **Task 16:** **Test Integrità:** Elimina un cliente con ordini (osserva l'effetto del CASCADE).
- [ ] **Task 17:** `DELETE` di un ordine specifico tramite ID.

#### **Fase 7: Cleanup Finale**

- [ ] **Task 30:** Operazioni di eliminazione totale:
  - [ ] Svuota dati (Ordini).
  - [ ] Elimina tabelle (`DROP TABLE`).
  - [ ] Elimina utente (`DROP USER`).
  - [ ] Elimina database (`DROP DATABASE`).

---

### **💡 Consiglio per il file di consegna:**

Inizia il file con l'elenco dei task e segna ogni blocco di codice con il numero del task corrispondente. Esempio:

```sql
-- [TASK 1] Creazione Database
CREATE DATABASE EsercizioSQL;

-- [TASK 2] Creazione Utente
CREATE USER 'esercizio_user'@'localhost' IDENTIFIED BY 'password123';
...
```

In questo modo, il docente (o chi corregge) vedrà chiaramente la tua capacità di seguire una specifica tecnica e organizzare il lavoro.
