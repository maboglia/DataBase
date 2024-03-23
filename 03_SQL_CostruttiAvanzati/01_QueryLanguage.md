# Query Language - interrogazione dei dati

### Interrogazione dei dati

#### Creazione di query di base

Abbiamo già introdotto il comando `SELECT` per visualizzare i record inseriti in una tabella.

```sql
SELECT field1, field2, field3 FROM tableName;
```

Utilizzando il carattere jolly `*`, selezioniamo tutte le colonne dei campi di dati da visualizzare.

```sql
SELECT * FROM tableName;
```

### ORDER BY

L'istruzione `ORDER BY` consente di ordinare i risultati di una query. Essa è seguita dal campo o dai campi su cui si basa l’ordinamento.

L'ordine predefinito è crescente (`ASC`). Utilizzando l'istruzione `DESC`, si ordina in modo decrescente.

Esempi:

Per ordinare per nome in modo crescente:
```sql
SELECT *
FROM studenti
ORDER BY cognome;
```

Per ordinare per nome in modo decrescente:
```sql
SELECT *
FROM studenti
ORDER BY cognome DESC;
```

Per ordinare per nome in modo decrescente e, in caso di cognomi uguali, per età in modo crescente:
```sql
SELECT *
FROM studenti
ORDER BY cognome DESC, eta;
```

### LIMIT

L'istruzione `LIMIT` consente di definire il numero massimo di record da visualizzare.

Accetta due argomenti:
- Il primo argomento, opzionale, specifica l'indice da cui iniziare per mostrare i record.
- Il secondo argomento indica la quantità di record da mostrare.

Esempi:

La seguente query mostra solo i primi 10 record della tabella `studente`:
```sql
SELECT *
FROM studenti
ORDER BY cognome
LIMIT 10;
```

La seguente query mostra 10 record della tabella `studenti` presi a partire dall'undicesimo record:
```sql
SELECT *
FROM studenti
ORDER BY cognome
LIMIT 10, 10;
```

Ricordate che l'indice parte da 0, quindi l'undicesimo record ha l'indice 10.

### SELECT e WHERE

L'istruzione `WHERE` consente di filtrare i risultati di una query, mostrando solo i record che soddisfano la condizione imposta.

Se vogliamo selezionare il nome e cognome degli studenti di genere maschile, possiamo applicare un filtro sull'attributo `genere` come condizione del `WHERE` utilizzando gli operatori.

Esempio:

```sql
SELECT nome, cognome
FROM studenti
WHERE genere = 'm';
```

Questa query selezionerà il nome e il cognome degli studenti di genere maschile dalla tabella `studenti`.

### Operatori

#### Operatori Matematici
- `+` (addizione)
- `-` (sottrazione)
- `*` (moltiplicazione)
- `/` (divisione)
- `%` (modulo)

#### Operatori di Confronto
- `=`, `<>`, `!=` (uguaglianza e disuguaglianza)
- `>` (maggiore di)
- `>=` (maggiore o uguale a)
- `<` (minore di)
- `<=` (minore o uguale a)

#### Operatori Logici
- `AND` (e logico)
- `OR` (o logico)

#### Operatori Avanzati di Confronto
- `BETWEEN` (tra due valori inclusi)
- `NOT BETWEEN` (non tra due valori inclusi)
- `IN` (presente in un elenco)
- `NOT IN` (non presente in un elenco)
- `IS NULL` (valore nullo)
- `IS NOT NULL` (valore non nullo)
- `LIKE` (corrispondenza parziale)
- `NOT LIKE` (nessuna corrispondenza parziale)
- `REGEXP` (corrispondenza con espressione regolare)

Questi operatori sono utilizzati per formulare condizioni nei comandi SQL come `SELECT`, `UPDATE`, `DELETE`, ecc.

### Operatori di confronto

Gli operatori di confronto sono utilizzati per confrontare valori e stabilire condizioni nelle query SQL. Ecco una lista di operatori di confronto comuni:

- `=` (Uguale): Verifica se due valori sono uguali.
- `!=` o `<>` (Diverso da): Verifica se due valori non sono uguali.
- `>` (Maggiore di): Verifica se il valore a sinistra è maggiore del valore a destra.
- `<` (Minore di): Verifica se il valore a sinistra è minore del valore a destra.
- `>=` (Maggiore o uguale a): Verifica se il valore a sinistra è maggiore o uguale al valore a destra.
- `<=` (Minore o uguale a): Verifica se il valore a sinistra è minore o uguale al valore a destra.

Questi operatori sono fondamentali per filtrare i dati nelle query SQL e stabilire le condizioni di ricerca dei dati desiderati.

### Operatori di confronto nelle query SQL

Ecco alcuni esempi di utilizzo degli operatori di confronto nelle query SQL:

1. Seleziona il nome, il cognome, l'email e la data di nascita degli studenti di genere femminile, ordinati per cognome e poi per nome:
   ```sql
   SELECT nome, cognome, email, data_nascita
   FROM studenti
   WHERE genere = 'f'
   ORDER BY cognome, nome;
   ```

2. Seleziona il nome, il cognome, l'email e la data di nascita degli studenti che non vivono a Torino, ordinati per cognome e poi per nome:
   ```sql
   SELECT nome, cognome, email, data_nascita
   FROM studenti
   WHERE citta != 'torino'
   ORDER BY cognome, nome;
   ```

3. Seleziona il nome, il cognome, l'email e la data di nascita degli studenti nati dopo il 31 dicembre 1989, ordinati per data di nascita:
   ```sql
   SELECT nome, cognome, email, data_nascita
   FROM studenti
   WHERE data_nascita >= '1989-12-31'
   ORDER BY data_nascita;
   ```

Questi esempi illustrano come utilizzare gli operatori di confronto per filtrare i dati in base a determinate condizioni nelle query SQL.

### operatori logici: AND e OR

Quando si utilizza l'operatore AND, tutte le condizioni specificate devono essere vere affinché un record venga selezionato. Ad esempio:

```sql
SELECT field(s)
FROM tableName
WHERE condition1 AND condition2 AND condition3;
```

Un esempio pratico potrebbe essere:

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE genere = 'm' AND provincia = 'to';
```

In questa query, vengono selezionati i record degli studenti maschi provenienti dalla provincia di Torino.

D'altro canto, quando si utilizza l'operatore OR, almeno una delle condizioni specificate deve essere vera per selezionare un record. Ad esempio:

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE genere = 'm' OR provincia = 'to';
```

In questo caso, vengono selezionati i record degli studenti maschi e quelli che provengono dalla provincia di Torino, inclusi gli studenti di sesso femminile che possono essere presenti nella provincia di Torino.

Attraverso l’uso delle parentesi potete creare e combinare i vostri criteri di ricerca. I risultati saranno diversi:

```sql
SELECT * FROM studenti
WHERE cognome='verdi' OR cognome='rossi'
AND provincia='to';
```
In questa query, vengono selezionati i record degli studenti con il cognome "verdi" o "rossi" e che sono residenti nella provincia di Torino.

```sql
SELECT * FROM studenti
WHERE (cognome='verdi' OR cognome='rossi')
AND (provincia='to' OR provincia='al');
```
In questa query, vengono selezionati i record degli studenti con il cognome "verdi" o "rossi" e che sono residenti sia nella provincia di Torino che nella provincia di Alessandria.

Operatori di confronto avanzati: IN, NOT IN

L’operatore IN ci consente di selezionare i record indicando più valori di campo. Possiamo farlo con l'operatore OR, ma può diventare complicato quando confrontiamo molti valori. Prendiamo ad esempio l'esecuzione di una query in cui cerchiamo solo gli studenti di alcune province:

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE provincia IN ('to','cn','at','no');
```

L'operatore NOT IN funziona in modo simile a IN, mostra i record che NON contengono i valori selezionati. Così la seguente query mostrerà tutti i record di studenti che non appartengono alle province in elenco:

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE provincia NOT IN ('to','cn','at','no');
```

BETWEEN, NOT BETWEEN

Utilizzando l'operatore BETWEEN possiamo selezionare un intervallo di valori. I valori di inizio e fine dell’intervallo sono inclusi. I valori dell’intervallo possono essere numeri, testo o date.

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE data_nascita BETWEEN '1985-01-01' AND '1994-12-31';
```

IS NULL e IS NOT NULL

L'operatore IS NULL viene utilizzato per visualizzare i record che non hanno un valore impostato per un campo. Viceversa, IS NOT NULL mostra i record che hanno un valore impostato per un campo. Questi operatori possono essere utilizzati per trovare i record che hanno bisogno di informazioni aggiuntive.

```sql
SELECT nome, cognome, email, data_nascita
FROM studenti
WHERE data_nascita IS NULL;
```

LIKE, NOT LIKE

Un operatore piuttosto "particolare" è LIKE, il quale consente di effettuare dei "paragoni di somiglianza".

```sql
SELECT * FROM studenti WHERE cognome LIKE 'v%';
SELECT * FROM studenti WHERE nome LIKE '%a';
SELECT * FROM studenti WHERE indirizzo LIKE 'via %';
SELECT * FROM studenti WHERE email LIKE '%gmail.com';
SELECT * FROM studenti WHERE nome LIKE 'paol_';
SELECT * FROM studenti WHERE nome LIKE '_a%';
```

La differenza è data dalla posizione del carattere percentuale (%), che sta ad indicare "qualsiasi carattere dopo" e "qualsiasi carattere prima".

Descrizione:
- `%`: sostituisce zero o più caratteri (wildcard)
- `_`: indica un solo carattere

Tuttavia, è consigliabile non abusare degli operatori di somiglianza, in quanto i criteri di ricerca che iniziano con caratteri jolly possono avere tempi di elaborazione più lunghi.

REGEXP_LIKE() (REGEXP e RLIKE sono sinonimi di REGEXP_LIKE())

Un operatore più potente di LIKE è REGEXP, il quale consente di utilizzare molti più simboli per ricerche più complesse.

```sql
SELECT * FROM studenti WHERE REGEXP_LIKE(nome,'ra');
SELECT * FROM studenti WHERE nome REGEXP 'ra';
SELECT * FROM studenti WHERE nome REGEXP '^mar';
SELECT * FROM studenti WHERE nome REGEXP 'co$';
SELECT * FROM studenti WHERE nome REGEXP 'mar|ara|ola';
```

Potete combinare i simboli per creare combinazioni di pattern:

```sql
SELECT * FROM studenti WHERE nome REGEXP '^mar|ara|co$';
SELECT * FROM studenti WHERE nome REGEXP '[mcp]a';
SELECT * FROM studenti WHERE nome REGEXP 'a[ero]';
SELECT * FROM studenti WHERE nome REGEXP 'l[ao]$';
SELECT * FROM studenti WHERE nome REGEXP '^[a-m]'; -- '^[n-z]'
```

Per ulteriori approfondimenti, si consiglia di consultare la documentazione ufficiale:
- [Operator REGEXP](https:/dev.mysql.com/doc/refman/8.0/en/regexp.html#operator_regexp)
- [Sintassi REGEXP](https:/dev.mysql.com/doc/refman/8.0/en/regexp.html#regexp-syntax)

Operatori matematici

MySQL supporta i classici operatori matematici tradizionali, cioè:

- **+** (addizione)
- **-** (sottrazione)
- **\*** (moltiplicazione)
- **/** (divisione)
- **%** (modulo - il resto della divisione tra due numeri)

Questi operatori risultano molto utili quando si devono svolgere dei calcoli all'interno di una SELECT. Per fare un esempio, si supponga di voler restituire il valore dato dalla sottrazione di due campi:

```sql
Potete eseguire dei calcoli matematici con SELECT:
SELECT (field1 - field2)
FROM tableName
[WHERE condition(s)];
```

Alcuni esempi di calcoli matematici:

```sql
SELECT 6 / 2; -- 3
SELECT 35 % 3; -- 2
SELECT (35 / 3) * 2; -- 11.6667
```

## Calcolo campi al volo

Utilizzando il comando SELECT possiamo aggiungere campi alla nostra query che rappresentano calcoli algebrici di base su un campo esistente. Nell'esempio che segue, la query restituirà il prezzo corrente e il prezzo con il 10% in più.

```sql
SELECT nome_prodotto, prezzo, prezzo * 1.10 AS 'prezzo_con_incremento_10%'
FROM prodotti;
```

Usare gli operatori permette di fare un calcolo per ogni campo.

Colonne generate (virtuali e persistenti / memorizzate)

Una colonna generata è una colonna in una tabella che non può essere impostata esplicitamente su un valore specifico in una query DML. Il suo valore viene invece generato automaticamente in base a un’espressione. Questa espressione potrebbe generare il valore in base ai valori di altre colonne nella tabella oppure potrebbe generare il valore chiamando funzioni incorporate o funzioni definite dall'utente (UDF).

Esistono due tipi di colonne generate:

- PERSISTENT (STORED): il valore di questo tipo è effettivamente memorizzato nella tabella.
- VIRTUAL: Il valore di questo tipo non viene memorizzato affatto. Il valore viene invece generato dinamicamente quando viene eseguita una query sulla tabella. Questo tipo è l'impostazione predefinita.

Le colonne generate sono talvolta chiamate anche colonne calcolate o colonne virtuali.

Sintassi:

```sql
<type> [GENERATED ALWAYS] AS (<expression>)
[VIRTUAL | PERSISTENT | STORED] [UNIQUE] [UNIQUE KEY] [COMMENT <text>]
```

Esempio sulla tabella studente. Creiamo un campo generato al volo che contenga il nome e il cognome dello studente:

```sql
ALTER TABLE studente
ADD fullName VARCHAR(255) AS (CONCAT(nome, ' ', cognome)) AFTER cognome;
```

Esempio sulla tabella corsi. Creiamo un campo generato al volo che calcoli il prezzo del corso compreso di IVA:

```sql
ALTER TABLE corsi
ADD prezzo_iva DECIMAL(6,2) GENERATED ALWAYS AS (prezzo * 1.10) STORED
AFTER prezzo;
```

Approfondimenti: [Documentazione MySQL - Colonne generate](https:/dev.mysql.com/doc/refman/8.0/en/create-table-generated-columns.html)

Limiti nella scrittura dell'espressione:

La maggior parte delle espressioni deterministiche legali che possono essere calcolate sono supportate nelle espressioni per le colonne generate.
La maggior parte delle funzioni integrate è supportata nelle espressioni per le colonne generate.
Tuttavia, alcune funzioni integrate non possono essere supportate per motivi tecnici. Ad esempio, se si tenta di utilizzare una funzione non supportata in un'espressione, viene generato un errore simile al seguente:

```
ERROR 1901 (HY000): Function or expression 'dayname()' cannot be used in the GENERATED
ALWAYS AS clause of `v`
```

Vediamo un esempio:

```sql
ALTER TABLE studente ADD eta TINYINT AS (TIMESTAMPDIFF(YEAR, data_nascita, CURDATE())) VIRTUAL;
```

Non si può usare l’espressione perché utilizza la funzione CURDATE() non deterministica.

Un'espressione deterministica in MySQL è un'espressione il cui risultato è sempre lo stesso quando ha gli stessi valori di input, senza importare quando o dove viene eseguita. In altre parole, una funzione o un'espressione è considerata deterministica se, date le stesse condizioni in input, produce sempre lo stesso risultato.

Esempi di espressioni deterministiche includono operazioni matematiche semplici, come l'addizione o la moltiplicazione, nonché funzioni come CONCAT, DATE_FORMAT e altre che restituiscono sempre lo stesso risultato per un determinato set di input.

D'altra parte, le funzioni che coinvolgono l'ora corrente, come NOW() o CURDATE(), sono considerate non deterministiche poiché il loro risultato dipende dal momento in cui vengono eseguite. Inoltre, alcune funzioni che coinvolgono l'accesso a dati esterni o il comportamento del sistema operativo potrebbero essere considerate non deterministiche.

Le espressioni deterministiche sono importanti quando si utilizzano colonne generate, poiché tali colonne devono essere valutate in modo coerente e prevedibile ogni volta che vengono lette o aggiornate.

La scrittura di espressioni per le colonne generate in MySQL è soggetta a diversi limiti e restrizioni che è importante tenere in considerazione durante la progettazione del database e della tabella.

Ecco un riepilogo dei principali limiti nella scrittura delle espressioni per le colonne generate:

1. **Valori letterali, funzioni integrate deterministiche e operatori**: È possibile utilizzare valori letterali (come stringhe o numeri), funzioni integrate deterministiche (che producono sempre lo stesso risultato per lo stesso set di input) e operatori nelle espressioni per le colonne generate.

2. **Funzioni non deterministiche non consentite**: Funzioni come CONNECTION_ID(), CURRENT_USER(), NOW(), CURDATE(), che restituiscono valori che possono variare in base al contesto di esecuzione, non sono consentite nelle espressioni per le colonne generate.

3. **Subquery non consentite**: Non è possibile utilizzare subquery nelle espressioni per le colonne generate.

4. **Riferimento a colonne generate**: Una definizione di colonna generata può fare riferimento ad altre colonne generate nella stessa tabella, ma solo a quelle definite precedentemente.

5. **Riferimento a colonne di base**: Una definizione di colonna generata può fare riferimento a qualsiasi colonna di base (non generata) nella tabella, indipendentemente dalla sua posizione nella definizione della tabella.

6. **Attributo AUTO_INCREMENT**: L'attributo AUTO_INCREMENT non può essere utilizzato direttamente in una definizione di colonna generata.

7. **Colonna AUTO_INCREMENT non utilizzabile**: Non è possibile utilizzare una colonna AUTO_INCREMENT come colonna di base in una definizione di colonna generata.

8. **Errore di valutazione dell'espressione**: Se l'evaluazione dell'espressione per una colonna generata provoca il troncamento o fornisce un input errato a una funzione, l'operazione di creazione della tabella termina con un errore.

Tenendo conto di questi limiti, è possibile progettare e definire colonne generate in modo sicuro e efficace all'interno delle tue tabelle MySQL.

Quando si definiscono colonne generate in MySQL, è importante tenere conto del fatto che la maggior parte delle espressioni deterministiche e delle funzioni integrate sono supportate. Tuttavia, ci sono alcune funzioni integrate che potrebbero non essere supportate per motivi tecnici.

Se si tenta di utilizzare una funzione non supportata in un'espressione per una colonna generata, verrà generato un errore. Ad esempio, se si cerca di utilizzare una funzione non deterministica come CURDATE() in un'espressione per una colonna generata, verrà visualizzato un errore simile a quello riportato di seguito:

```
ERROR 1901 (HY000): Function or expression 'CURDATE()' cannot be used in the GENERATED
 ALWAYS AS clause
```

Questo errore indica che la funzione CURDATE() non può essere utilizzata nella clausola GENERATED ALWAYS AS per una colonna generata a causa della sua natura non deterministica.

Per evitare questo tipo di errore, è necessario assicurarsi di utilizzare solo espressioni deterministiche e funzioni integrate supportate nelle definizioni delle colonne generate. Questo garantirà che le colonne generate possano essere create correttamente e che le operazioni di inserimento, aggiornamento e query funzionino come previsto.

Gli alias sono utili per rinominare temporaneamente una tabella o un'intestazione di campo all'interno di una query. Possono essere utilizzati per rendere più leggibile il risultato della query o per riferirsi più facilmente a una colonna con un nome più intuitivo.

Per creare un alias per una colonna, si utilizza l'istruzione AS seguita dal nuovo nome desiderato per la colonna. Tuttavia, l'uso di AS è facoltativo e può essere omesso.

Ecco un esempio di utilizzo di alias per rinominare una colonna nella query:

```sql
SELECT data_nascita AS `Data di nascita`
FROM studente;
```

In questo caso, la colonna `data_nascita` viene rinominata temporaneamente come `Data di nascita` utilizzando l'alias. L'uso del backtick (`) attorno al nuovo nome è opzionale, ma può essere utile se il nome contiene spazi o caratteri speciali.

Gli alias possono essere utilizzati anche per creare un alias per una formula o un'espressione calcolata. Ad esempio:

```sql
SELECT (campo1 - campo2) AS risultato
FROM nome_tabella
[WHERE condizione];
```

Qui l'espressione `(campo1 - campo2)` viene calcolata e rinominata come `risultato` utilizzando l'alias.

Ricorda che gli alias possono essere utilizzati anche con altre clausole come GROUP BY, ORDER BY o HAVING per riferirsi più facilmente alle colonne nei risultati della query.

Gli alias per le tabelle sono utilizzati per abbreviare i nomi delle tabelle all'interno di una query, rendendo così la query più semplice da scrivere e leggere.

Per definire un alias per una tabella, si utilizza l'istruzione AS seguita dal nuovo nome desiderato per la tabella. Tuttavia, anche in questo caso, l'uso di AS è facoltativo e può essere omesso.

Ecco un esempio di utilizzo degli alias per le tabelle in una query:

```sql
SELECT d.nome, d.cognome, d.email, c.titolo AS `Titolo Corso`
FROM docenti AS d, corsi AS c
WHERE d.id = c.docente_id
ORDER BY `Titolo Corso`;
```

In questo esempio, le tabelle `docenti` e `corsi` vengono rinominate rispettivamente come `d` e `c` utilizzando gli alias. L'alias `d` viene utilizzato per riferirsi alla tabella `docenti`, mentre l'alias `c` viene utilizzato per riferirsi alla tabella `corsi`.

L'uso degli alias per le tabelle diventa particolarmente utile quando si devono scrivere query complesse che coinvolgono più tabelle, rendendo la query più concisa e leggibile. 

È importante notare che quando si utilizzano alias per le tabelle e ci sono attributi con lo stesso nome in diverse tabelle coinvolte nella query, è necessario utilizzare il nuovo nome della tabella definito come alias per richiamare i campi in modo non ambiguo nella clausola SELECT.

Questa query estrae l'elenco completo delle informazioni sui corsi utilizzando alias per le tabelle coinvolte. Le informazioni richieste sono ottenute dalle tabelle `studenti`, `docenti`, `corsi` e `iscrizioni`. Ecco la query:

```sql
SELECT
   s.nome AS `Nome studente`,
   s.cognome AS `Cognome studente`,
   s.email AS `Contatto studente`,
   c.titolo AS `Corso`,
   d.cognome AS `Cognome docente`,
   d.nome AS `Nome docente`
FROM studenti AS s, corsi AS c, iscrizioni AS i, docenti AS d
WHERE s.id = i.studente_id
AND c.id = i.corso_id
AND d.id = c.docente_id;
```

In questa query:
- Le tabelle `studenti`, `corsi`, `iscrizioni` e `docenti` vengono rinominate rispettivamente come `s`, `c`, `i` e `d` utilizzando gli alias.
- Viene selezionato il nome, il cognome e l'email dello studente dalla tabella `studenti` utilizzando l'alias `s`.
- Viene selezionato il titolo del corso dalla tabella `corsi` utilizzando l'alias `c`.
- Viene selezionato il cognome e il nome del docente dalla tabella `docenti` utilizzando l'alias `d`.
- La clausola WHERE specifica le condizioni di join tra le tabelle `studenti`, `corsi`, `iscrizioni` e `docenti` utilizzando gli alias definiti.


