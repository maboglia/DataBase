# Le operazioni di join

Le operazioni di **JOIN in SQL** sono utilizzate per combinare le righe di due o più tabelle in base a una condizione specifica. Ci sono diversi **tipi di JOIN** che determinano come vengono selezionate le righe corrispondenti da ciascuna tabella coinvolta. Ecco una spiegazione delle differenze principali tra i tipi di JOIN più comuni:

---

1. **INNER JOIN:**
   - Restituisce solo le righe che hanno corrispondenze in entrambe le tabelle coinvolte nella JOIN.
   - Le righe che non hanno corrispondenze vengono **escluse** dai risultati.

   ```sql
   SELECT *
   FROM TabellaA
   INNER JOIN TabellaB ON TabellaA.ID = TabellaB.ID;
   ```

---

2. **LEFT JOIN (o LEFT OUTER JOIN):**
   - Restituisce tutte le righe dalla tabella a **sinistra** (prima nella clausola FROM), e le corrispondenze dalla tabella a destra.
   - Se non ci sono corrispondenze nella tabella a **destra**, vengono restituiti **NULL** per le colonne della tabella a destra.

   ```sql
   SELECT *
   FROM TabellaA
   LEFT JOIN TabellaB ON TabellaA.ID = TabellaB.ID;
   ```

---

3. **RIGHT JOIN (o RIGHT OUTER JOIN):**
   - Analogamente al LEFT JOIN, restituisce tutte le righe dalla **tabella a destra** e le corrispondenze dalla tabella a sinistra.
   - Se non ci sono corrispondenze nella tabella a sinistra, vengono restituiti NULL per le colonne della tabella a sinistra.

   ```sql
   SELECT *
   FROM TabellaA
   RIGHT JOIN TabellaB ON TabellaA.ID = TabellaB.ID;
   ```

---

4. **FULL JOIN (o FULL OUTER JOIN):**
   - Restituisce **tutte le righe** quando c'è una corrispondenza in una delle tabelle coinvolte.
   - Se non ci sono corrispondenze in una delle tabelle, vengono restituiti NULL per le colonne della tabella senza corrispondenza.

   ```sql
   SELECT *
   FROM TabellaA
   FULL JOIN TabellaB ON TabellaA.ID = TabellaB.ID;
   ```

---

5. **CROSS JOIN:**
   - Restituisce il **prodotto cartesiano** delle righe di entrambe le tabelle coinvolte.
   - Non richiede una condizione di join.

   ```sql
   SELECT *
   FROM TabellaA
   CROSS JOIN TabellaB;
   ```

Scegli il tipo di JOIN in base alle tue esigenze specifiche e alla struttura dei dati. La scelta corretta dipende dalla natura della relazione tra le tabelle e dal tipo di risultati desiderati.

---

## Join e filtraggio

La clausola **WHERE** e le operazioni di **JOIN** in SQL sono concetti **distinti**, ma spesso vengono **utilizzati insieme** per filtrare i dati in base a condizioni specifiche. Ecco le principali differenze tra la clausola WHERE e le clausole di JOIN:

---

1. **Clausola WHERE:**
   - La clausola WHERE viene utilizzata per filtrare le righe di una singola tabella in base a una **condizione specifica**.
   - Può essere utilizzata per specificare condizioni di **filtro** su colonne di una tabella.
   - La condizione viene applicata direttamente alla tabella specificata nella clausola FROM.

   Esempio:

   ```sql
   SELECT *
   FROM Tabella
   WHERE Colonna = 'Valore';
   ```

---

2. **Clausole di JOIN:**
   - Le clausole di JOIN vengono utilizzate per c**ombinare le righe di due o più tabelle** in base a una condizione di join specifica.
   - Specificano **come** le tabelle coinvolte devono essere collegate tra loro.
   - Le condizioni di join vengono specificate nelle **clausole ON**, indicando le colonne su cui basare la connessione tra le tabelle.

   Esempio di INNER JOIN:

   ```sql
   SELECT *
   FROM TabellaA
   INNER JOIN TabellaB ON TabellaA.ID = TabellaB.ID;
   ```

---

3. **Utilizzo congiunto di WHERE e JOIN:**
   - È comune utilizzare WHERE in **combinazione** con le clausole di JOIN per filtrare ulteriormente i risultati in base a condizioni specifiche dopo che le tabelle sono state combinate.
   - Le condizioni nella clausola WHERE si applicano al risultato combinato delle tabelle coinvolte nelle clausole di JOIN.

   Esempio:

   ```sql
   SELECT *
   FROM TabellaA
   INNER JOIN TabellaB ON TabellaA.ID = TabellaB.ID
   WHERE TabellaA.Colonna = 'Valore' AND TabellaB.AltraColonna = 'AltroValore';
   ```

---

In sintesi, la clausola WHERE si concentra sul **filtraggio** delle righe di una **singola tabella**, mentre le clausole di JOIN si concentrano sulla **combinazione** delle righe tra tabelle. 

L'utilizzo combinato di WHERE e JOIN consente di applicare condizioni di filtro anche dopo la combinazione delle tabelle.
