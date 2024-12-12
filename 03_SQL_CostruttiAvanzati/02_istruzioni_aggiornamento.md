# Le istruzioni di aggiornamento

Le istruzioni di aggiornamento in SQL vengono utilizzate per modificare i dati esistenti nelle tabelle. Le due istruzioni principali per l'aggiornamento sono `UPDATE` e `ALTER TABLE`. Ecco come vengono utilizzate:

---

1. **UPDATE:**
   - L'istruzione `UPDATE` viene utilizzata per modificare i valori esistenti in una o più colonne di una tabella.

   ```sql
   UPDATE nome_tabella
   SET colonna1 = valore1, colonna2 = valore2, ...
   WHERE condizione;
   ```

   - Esempio:

     ```sql
     UPDATE Studenti
     SET Voto = 90
     WHERE Matricola = 12345;
     ```

     Questo esempio modifica il valore della colonna "Voto" a 90 per uno studente con matricola 12345.

---

2. **ALTER TABLE:**
   - L'istruzione `ALTER TABLE` può essere utilizzata per modificare la struttura di una tabella, inclusa la modifica di colonne esistenti.

   ```sql
   ALTER TABLE nome_tabella
   ALTER COLUMN nome_colonna NUOVO_TIPO_DATO;
   ```

   - Esempio:

     ```sql
     ALTER TABLE Studenti
     ALTER COLUMN Nome VARCHAR(100);
     ```

     Questo esempio modifica il tipo di dati della colonna "Nome" nella tabella "Studenti" a VARCHAR(100).

---

3. **Sintassi combinata (UPDATE con JOIN):**
   - È possibile utilizzare la clausola `UPDATE` in combinazione con `JOIN` per eseguire aggiornamenti basati su condizioni che coinvolgono più tabelle.

   ```sql
   UPDATE tabella1
   SET tabella1.colonna1 = valore
   FROM tabella1
   JOIN tabella2 ON condizione;
   ```

Assicurati sempre di utilizzare la clausola `WHERE` in un'istruzione `UPDATE` per specificare quali righe devono essere modificate. Inoltre, fai attenzione a eseguire le operazioni di aggiornamento in modo responsabile, poiché possono avere un impatto significativo sui dati nel database.
