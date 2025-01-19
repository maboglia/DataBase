# Update: istruzioni per modificare i dati

L'istruzione `UPDATE` viene utilizzata per aggiornare i record in una tabella. Questa istruzione modifica il valore presente in una colonna di un record già esistente. Viene utilizzata insieme all’istruzione `SET`.

```sql
UPDATE tableName
SET field1 = value1, field2 = value2
WHERE field3 = value3;
```

---

Dopo `UPDATE`, indichiamo quale tabella è interessata. Con `SET`, specifichiamo quali colonne modificare e quali valori assegnare. Con `WHERE` (opzionale), stabiliamo le condizioni che determinano quali righe saranno interessate dalle modifiche. Attenzione: se non specifichiamo una condizione, tutte le righe saranno modificate.

---

- Per operare simultaneamente su più campi, è sufficiente suddividere le coppie chiave/valore con una virgola.
- Quando si inseriscono i dati in una tabella, è importante considerare sempre come sono stati definiti gli attributi per evitare errori di inserimento.
- Se si inserisce un valore troppo lungo o non compreso dalla definizione dell’attributo, MySQL restituirà un errore e non effettuerà alcuna modifica.

---

Ad esempio, consideriamo il seguente comando di aggiornamento:

```sql
UPDATE studenti SET genere = 's' WHERE id = 1;
```

Se il campo `genere` della tabella `studenti` è definito come `ENUM('m','f')`, accetta solo i valori 'm' o 'f'. Nel caso sopra riportato, stiamo tentando di inserire un valore non ammesso ('s'), il che provocherà un errore come questo:

```
ERROR 1265 (01000): Data truncated for column 'genere' at row 1
```

---

Questo errore indica che il valore inserito è stato troncato perché non è conforme alla definizione dell'attributo.

È importante notare che il comportamento dipende dall'impostazione della variabile globale `@@sql_mode`: di default, MySQL lavora in strict mode.

---

## **Sintassi combinata (UPDATE con JOIN):**
   - È possibile utilizzare la clausola `UPDATE` in combinazione con `JOIN` per eseguire aggiornamenti basati su condizioni che coinvolgono più tabelle.

   ```sql
   UPDATE tabella1
   SET tabella1.colonna1 = valore
   FROM tabella1
   JOIN tabella2 ON condizione;
   ```

Assicurati sempre di utilizzare la clausola `WHERE` in un'istruzione `UPDATE` per specificare quali righe devono essere modificate. Inoltre, fai attenzione a eseguire le operazioni di aggiornamento in modo responsabile, poiché possono avere un impatto significativo sui dati nel database.
