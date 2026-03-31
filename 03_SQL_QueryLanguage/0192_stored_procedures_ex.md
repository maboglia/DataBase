# 📌 SCHEDA: STORED PROCEDURES (Procedure Memorizzate)

## 1) Cosa sono le Stored Procedures

Una **Stored Procedure** è un insieme di istruzioni SQL salvate nel database, eseguibili tramite un comando.

📌 In pratica: una *funzione/procedura lato DB* che permette di automatizzare operazioni ripetitive.

---

## 2) A cosa servono

Le stored procedures servono per:

✅ raggruppare query complesse in un’unica chiamata
✅ ridurre codice lato applicazione
✅ migliorare la sicurezza (accesso controllato ai dati)
✅ riutilizzare logica SQL
✅ gestire transazioni (commit/rollback)
✅ aumentare prestazioni (meno traffico tra app e DB)

---

## 3) Differenza tra Procedure e Funzioni

### 🔹 Stored Procedure

* può fare INSERT/UPDATE/DELETE
* può restituire risultati (SELECT)
* può avere parametri IN/OUT/INOUT
* può non restituire un valore

### 🔹 Function

* deve restituire un valore
* spesso usata dentro query (`SELECT funzione(...)`)

---

# 4) Sintassi base (MySQL)

## Creazione procedura semplice

```sql
DELIMITER $$

CREATE PROCEDURE saluta()
BEGIN
    SELECT 'Ciao dal DB!' AS messaggio;
END$$

DELIMITER ;
```

### Esecuzione

```sql
CALL saluta();
```

---

# 5) Procedure con parametri IN

## Esempio: cerca studente per id

```sql
DELIMITER $$

CREATE PROCEDURE trova_studente(IN p_id INT)
BEGIN
    SELECT * 
    FROM studenti
    WHERE id = p_id;
END$$

DELIMITER ;
```

Esecuzione:

```sql
CALL trova_studente(3);
```

---

# 6) Parametri OUT

I parametri OUT permettono di restituire valori.

## Esempio: contare studenti

```sql
DELIMITER $$

CREATE PROCEDURE conta_studenti(OUT totale INT)
BEGIN
    SELECT COUNT(*) INTO totale
    FROM studenti;
END$$

DELIMITER ;
```

Esecuzione:

```sql
CALL conta_studenti(@x);
SELECT @x;
```

---

# 7) Parametri INOUT

Un parametro INOUT è sia input che output.

## Esempio: aumento stipendio

```sql
DELIMITER $$

CREATE PROCEDURE aumenta(INOUT stipendio DECIMAL(10,2), IN percentuale INT)
BEGIN
    SET stipendio = stipendio + (stipendio * percentuale / 100);
END$$

DELIMITER ;
```

Esecuzione:

```sql
SET @s = 1200;
CALL aumenta(@s, 10);
SELECT @s;
```

---

# 8) Variabili interne e SET

```sql
DELIMITER $$

CREATE PROCEDURE esempio_variabili()
BEGIN
    DECLARE x INT DEFAULT 10;
    SET x = x + 5;
    SELECT x AS risultato;
END$$

DELIMITER ;
```

---

# 9) IF / ELSE

```sql
DELIMITER $$

CREATE PROCEDURE valuta(IN voto INT)
BEGIN
    IF voto >= 6 THEN
        SELECT 'Promosso' AS esito;
    ELSE
        SELECT 'Bocciato' AS esito;
    END IF;
END$$

DELIMITER ;
```

---

# 10) Cicli (LOOP, WHILE)

## WHILE

```sql
DELIMITER $$

CREATE PROCEDURE conta_fino(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= n DO
        SELECT i;
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;
```

---

# 11) Stored procedure con transazioni

Esempio tipico: bonifico bancario.

```sql
DELIMITER $$

CREATE PROCEDURE bonifico(IN mittente INT, IN destinatario INT, IN importo DECIMAL(10,2))
BEGIN
    START TRANSACTION;

    UPDATE conti
    SET saldo = saldo - importo
    WHERE id = mittente;

    UPDATE conti
    SET saldo = saldo + importo
    WHERE id = destinatario;

    COMMIT;
END$$

DELIMITER ;
```

📌 Se vuoi robustezza: aggiungere controlli e rollback.

---

# 12) Gestione errori (MySQL HANDLER)

```sql
DELIMITER $$

CREATE PROCEDURE bonifico_sicuro(IN mittente INT, IN destinatario INT, IN importo DECIMAL(10,2))
BEGIN
    DECLARE errore BOOL DEFAULT FALSE;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET errore = TRUE;

    START TRANSACTION;

    UPDATE conti
    SET saldo = saldo - importo
    WHERE id = mittente;

    UPDATE conti
    SET saldo = saldo + importo
    WHERE id = destinatario;

    IF errore THEN
        ROLLBACK;
        SELECT 'Errore: transazione annullata' AS msg;
    ELSE
        COMMIT;
        SELECT 'Bonifico eseguito' AS msg;
    END IF;
END$$

DELIMITER ;
```

---

# 13) Eliminare una stored procedure

```sql
DROP PROCEDURE nome_procedura;
```

---

# 14) Visualizzare stored procedures (MySQL)

```sql
SHOW PROCEDURE STATUS;
```

---

# 🧪 ESERCIZI SULLE STORED PROCEDURES (Tracce)

---

## ESERCIZIO 1 (Base)

Crea una stored procedure `elenco_studenti()` che restituisce tutti gli studenti.

---

## ESERCIZIO 2 (IN)

Crea una stored procedure `studenti_per_classe(p_classe)` che mostra gli studenti di una classe.

---

## ESERCIZIO 3 (IN)

Crea una stored procedure `aggiungi_studente(nome, classe, eta)` che inserisce un nuovo studente.

---

## ESERCIZIO 4 (OUT)

Crea una stored procedure `numero_studenti(OUT totale)` che restituisce il numero totale di studenti.

---

## ESERCIZIO 5 (UPDATE)

Crea una stored procedure `aumenta_prezzo(p_id, p_percentuale)` che aumenta il prezzo di un prodotto.

---

## ESERCIZIO 6 (IF)

Crea una stored procedure `valuta_esame(p_voto)` che restituisce:

* "Insufficiente" se <6
* "Sufficiente" se 6
* "Buono" se 7-8
* "Ottimo" se 9-10

---

## ESERCIZIO 7 (Transazione)

Crea una stored procedure `acquisto(cliente, prodotto, quantita)` che:

* scala la giacenza del prodotto
* inserisce un ordine
* inserisce una riga ordine_dettaglio

📌 Tutto deve avvenire con transazione.

---

## ESERCIZIO 8 (WHILE)

Crea una stored procedure `genera_numeri(n)` che inserisce nella tabella `numeri(valore)` i numeri da 1 a n.

---

## ESERCIZIO 9 (IN + OUT)

Crea una stored procedure `calcola_media_studente(p_id, OUT media)` che calcola la media voti dello studente.

---

## ESERCIZIO 10 (Gestione errori)

Crea una stored procedure `bonifico_controllato(mittente, destinatario, importo)` che:

* verifica che il saldo del mittente sia sufficiente
* se non lo è, annulla e restituisce un messaggio

---

# ✅ SOLUZIONI (alcune)

---

## Soluzione Esercizio 3

Tabella esempio:

```sql
CREATE TABLE studenti(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    classe VARCHAR(10),
    eta INT
);
```

Procedura:

```sql
DELIMITER $$

CREATE PROCEDURE aggiungi_studente(IN p_nome VARCHAR(50), IN p_classe VARCHAR(10), IN p_eta INT)
BEGIN
    INSERT INTO studenti(nome, classe, eta)
    VALUES(p_nome, p_classe, p_eta);
END$$

DELIMITER ;
```

---

## Soluzione Esercizio 4

```sql
DELIMITER $$

CREATE PROCEDURE numero_studenti(OUT totale INT)
BEGIN
    SELECT COUNT(*) INTO totale
    FROM studenti;
END$$

DELIMITER ;
```

Esecuzione:

```sql
CALL numero_studenti(@tot);
SELECT @tot;
```

---

## Soluzione Esercizio 6

```sql
DELIMITER $$

CREATE PROCEDURE valuta_esame(IN p_voto INT)
BEGIN
    IF p_voto < 6 THEN
        SELECT 'Insufficiente' AS esito;
    ELSEIF p_voto = 6 THEN
        SELECT 'Sufficiente' AS esito;
    ELSEIF p_voto BETWEEN 7 AND 8 THEN
        SELECT 'Buono' AS esito;
    ELSE
        SELECT 'Ottimo' AS esito;
    END IF;
END$$

DELIMITER ;
```

---

## Soluzione Esercizio 8

```sql
CREATE TABLE numeri(
    valore INT
);
```

```sql
DELIMITER $$

CREATE PROCEDURE genera_numeri(IN n INT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= n DO
        INSERT INTO numeri(valore) VALUES(i);
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;
```

---

# 📌 DOMANDE TEORICHE (Ripasso)

1. Qual è la differenza tra stored procedure e query normale?
2. Differenza tra parametri IN, OUT, INOUT?
3. Perché usare una stored procedure migliora la sicurezza?
4. Come si esegue una stored procedure in MySQL?
5. Perché sono utili le transazioni dentro una procedura?

