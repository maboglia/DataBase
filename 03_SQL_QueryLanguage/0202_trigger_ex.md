# 📌 SCHEDA: TRIGGER in SQL

## 1) Cos’è un Trigger

Un **trigger** è una procedura automatica associata a una tabella (o vista) che viene eseguita **automaticamente** quando avviene un evento:

* `INSERT`
* `UPDATE`
* `DELETE`

📌 In pratica: *“quando succede X su tabella Y, fai automaticamente Z”*.

---

## 2) A cosa servono i Trigger

I trigger si usano per:

✅ controlli automatici sui dati (validazioni)
✅ logging delle modifiche (audit)
✅ aggiornare tabelle correlate
✅ bloccare operazioni non consentite
✅ mantenere consistenza (integrità) anche oltre i vincoli

---

## 3) Tipi di Trigger

### 🔹 Trigger BEFORE

Si attiva **prima** dell’operazione.

Esempio: prima di inserire un record controllo se il valore è valido.

### 🔹 Trigger AFTER

Si attiva **dopo** l’operazione.

Esempio: dopo un inserimento registro l’operazione in una tabella di log.

---

## 4) Eventi che attivano un Trigger

* `BEFORE INSERT`
* `AFTER INSERT`
* `BEFORE UPDATE`
* `AFTER UPDATE`
* `BEFORE DELETE`
* `AFTER DELETE`

---

## 5) NEW e OLD (concetto fondamentale)

Nei trigger esistono due pseudo-record:

* `NEW` → contiene i valori nuovi (in INSERT e UPDATE)
* `OLD` → contiene i valori vecchi (in DELETE e UPDATE)

📌 Esempi:

* `NEW.prezzo` → nuovo prezzo aggiornato
* `OLD.prezzo` → prezzo precedente

---

# 6) Esempio completo (MySQL)

## Tabella prodotti

```sql
CREATE TABLE prodotti (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    prezzo DECIMAL(10,2)
);
```

## Tabella log

```sql
CREATE TABLE log_prodotti (
    id INT PRIMARY KEY AUTO_INCREMENT,
    operazione VARCHAR(20),
    data_operazione DATETIME,
    descrizione VARCHAR(200)
);
```

---

## Trigger AFTER INSERT

```sql
DELIMITER $$

CREATE TRIGGER trg_insert_prodotti
AFTER INSERT ON prodotti
FOR EACH ROW
BEGIN
    INSERT INTO log_prodotti(operazione, data_operazione, descrizione)
    VALUES('INSERT', NOW(),
           CONCAT('Inserito prodotto: ', NEW.nome, ' prezzo=', NEW.prezzo));
END$$

DELIMITER ;
```

📌 Ogni volta che inserisco un prodotto → si scrive una riga in `log_prodotti`.

---

# 7) Trigger di controllo (validazione)

## Vietare prezzi negativi

```sql
DELIMITER $$

CREATE TRIGGER trg_check_prezzo
BEFORE INSERT ON prodotti
FOR EACH ROW
BEGIN
    IF NEW.prezzo < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Prezzo non può essere negativo';
    END IF;
END$$

DELIMITER ;
```

📌 `SIGNAL` genera un errore e blocca l’INSERT.

---

# 8) Trigger su UPDATE

## Log modifica prezzo

```sql
DELIMITER $$

CREATE TRIGGER trg_update_prodotti
AFTER UPDATE ON prodotti
FOR EACH ROW
BEGIN
    IF OLD.prezzo <> NEW.prezzo THEN
        INSERT INTO log_prodotti(operazione, data_operazione, descrizione)
        VALUES('UPDATE', NOW(),
               CONCAT('Prodotto ', OLD.nome,
                      ' prezzo cambiato da ', OLD.prezzo,
                      ' a ', NEW.prezzo));
    END IF;
END$$

DELIMITER ;
```

---

# 9) Trigger su DELETE

## Log cancellazione

```sql
DELIMITER $$

CREATE TRIGGER trg_delete_prodotti
AFTER DELETE ON prodotti
FOR EACH ROW
BEGIN
    INSERT INTO log_prodotti(operazione, data_operazione, descrizione)
    VALUES('DELETE', NOW(),
           CONCAT('Cancellato prodotto: ', OLD.nome));
END$$

DELIMITER ;
```

---

# 10) Vantaggi e Svantaggi

## ✅ Vantaggi

* automatizzano controlli e aggiornamenti
* ottimi per log e auditing
* garantiscono consistenza lato DB

## ❌ Svantaggi

* possono rendere difficile il debug
* se abusati rallentano le operazioni
* logica nascosta (non visibile nell’applicazione)

---

# 11) Comandi utili

## Vedere trigger esistenti

```sql
SHOW TRIGGERS;
```

## Eliminare un trigger

```sql
DROP TRIGGER nome_trigger;
```

---

# 🧪 ESERCIZI SUI TRIGGER (con traccia)

---

## ESERCIZIO 1 (Base)

Crea una tabella `studenti(id, nome, eta)` e un trigger che impedisce l’inserimento di studenti con `eta < 14`.

---

## ESERCIZIO 2 (Base)

Crea una tabella `dipendenti(id, nome, stipendio)` e un trigger che impedisce UPDATE se lo stipendio diventa negativo.

---

## ESERCIZIO 3 (Logging)

Crea tabella `ordini(id, cliente, totale)` e tabella `log_ordini`.
Scrivere un trigger AFTER INSERT che registra:

* operazione
* data
* totale inserito

---

## ESERCIZIO 4 (UPDATE con OLD e NEW)

Su tabella `ordini`, scrivere un trigger AFTER UPDATE che registra nel log solo se cambia il valore `totale`.

---

## ESERCIZIO 5 (DELETE)

Crea tabella `clienti(id,nome,email)` e una tabella `clienti_eliminati`.
Scrivere un trigger AFTER DELETE che copia i dati del cliente cancellato dentro `clienti_eliminati`.

---

## ESERCIZIO 6 (Magazzino)

Crea:

* `prodotti(id,nome,giacenza)`
* `vendite(id,id_prodotto,qta,data)`

Scrivere un trigger AFTER INSERT su `vendite` che decrementa la giacenza del prodotto venduto.

---

## ESERCIZIO 7 (Controllo disponibilità)

Sulla stessa struttura dell’esercizio 6, creare un trigger BEFORE INSERT su `vendite` che impedisce la vendita se la giacenza non è sufficiente.

---

## ESERCIZIO 8 (Trigger doppio)

Sempre con prodotti e vendite:

* trigger BEFORE INSERT per controllo
* trigger AFTER INSERT per aggiornare giacenza
* trigger AFTER DELETE su vendite per ripristinare giacenza

---

# ✅ SOLUZIONI (per verifica)

---

## Soluzione Esercizio 1

```sql
DELIMITER $$

CREATE TRIGGER trg_eta_studenti
BEFORE INSERT ON studenti
FOR EACH ROW
BEGIN
    IF NEW.eta < 14 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Età minima 14 anni';
    END IF;
END$$

DELIMITER ;
```

---

## Soluzione Esercizio 5 (clienti eliminati)

```sql
CREATE TABLE clienti_eliminati (
    id INT,
    nome VARCHAR(50),
    email VARCHAR(50),
    data_eliminazione DATETIME
);
```

```sql
DELIMITER $$

CREATE TRIGGER trg_delete_clienti
AFTER DELETE ON clienti
FOR EACH ROW
BEGIN
    INSERT INTO clienti_eliminati(id,nome,email,data_eliminazione)
    VALUES(OLD.id, OLD.nome, OLD.email, NOW());
END$$

DELIMITER ;
```

---

## Soluzione Esercizio 6 (vendite aggiornano giacenza)

```sql
DELIMITER $$

CREATE TRIGGER trg_vendita_update_giacenza
AFTER INSERT ON vendite
FOR EACH ROW
BEGIN
    UPDATE prodotti
    SET giacenza = giacenza - NEW.qta
    WHERE id = NEW.id_prodotto;
END$$

DELIMITER ;
```

---

## Soluzione Esercizio 7 (controllo giacenza)

```sql
DELIMITER $$

CREATE TRIGGER trg_check_giacenza
BEFORE INSERT ON vendite
FOR EACH ROW
BEGIN
    DECLARE g INT;

    SELECT giacenza INTO g
    FROM prodotti
    WHERE id = NEW.id_prodotto;

    IF g < NEW.qta THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giacenza insufficiente';
    END IF;
END$$

DELIMITER ;
```

---

# 📌 DOMANDE TEORICHE (ripasso)

1. Differenza tra trigger BEFORE e AFTER?
2. Quando si usa `OLD` e quando `NEW`?
3. Perché un trigger può rallentare un database?
4. Qual è la differenza tra vincoli (CHECK/FOREIGN KEY) e trigger?
5. Cosa significa `FOR EACH ROW`?

