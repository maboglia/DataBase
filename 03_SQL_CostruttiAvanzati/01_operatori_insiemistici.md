# Gli operatori insiemistici

Gli operatori insiemistici sono utilizzati nelle query SQL per eseguire operazioni su insiemi di dati, spesso all'interno di clausole `SELECT`. Questi operatori consentono di combinare, confrontare e ottenere risultati distinti da insiemi di dati. Ecco alcuni degli operatori insiemistici più comuni:

---

1. **UNION:**
   - L'operatore `UNION` combina i risultati di due o più query restituendo un insieme di righe unico e distinto.

   ```sql
   SELECT colonna FROM tabella1
   UNION
   SELECT colonna FROM tabella2;
   ```

---

2. **INTERSECT:**
   - L'operatore `INTERSECT` restituisce le righe che sono presenti in entrambi i risultati delle query.

   ```sql
   SELECT colonna FROM tabella1
   INTERSECT
   SELECT colonna FROM tabella2;
   ```

---

3. **EXCEPT (o MINUS):**
   - L'operatore `EXCEPT` restituisce le righe che sono presenti nel primo risultato della query ma non nel secondo.

   ```sql
   SELECT colonna FROM tabella1
   EXCEPT
   SELECT colonna FROM tabella2;
   ```

   In alcune implementazioni, come in Oracle, l'operatore corrispondente è `MINUS` al posto di `EXCEPT`.

---

4. **UNION ALL:**
   - L'operatore `UNION ALL` combina i risultati di due o più query, inclusi i duplicati.

   ```sql
   SELECT colonna FROM tabella1
   UNION ALL
   SELECT colonna FROM tabella2;
   ```

---

5. **EXISTS:**
   - L'operatore `EXISTS` viene utilizzato per verificare l'esistenza di almeno una riga in un sottoinsieme di risultati di una query correlata.

   ```sql
   SELECT colonna FROM tabella1
   WHERE EXISTS (SELECT colonna FROM tabella2 WHERE condizione);
   ```

---

Questi operatori insiemistici forniscono un modo flessibile per eseguire operazioni su insiemi di dati e sono utili in diverse situazioni durante la scrittura di query SQL complesse.
