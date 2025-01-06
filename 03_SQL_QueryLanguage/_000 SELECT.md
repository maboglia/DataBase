# Read: Mostrare i Record di una Tabella

È possibile visualizzare i record di una tabella utilizzando l’istruzione `SELECT`. Per visualizzare tutti i record da una tabella, si usa il carattere jolly `*`. Dobbiamo anche utilizzare l’istruzione `FROM` per identificare la tabella che vogliamo interrogare. Di solito si visualizzano campi specifici, piuttosto che l'intera tabella. Dopo l’istruzione `SELECT`, elencare i campi che interessano, separati da una virgola.

---

```sql
SELECT fieldName, fieldName2, fieldName3 FROM tableName;
```


```sql
SELECT field1, field2, field3 FROM tableName;
```

Utilizzando il carattere jolly `*`, selezioniamo tutte le colonne dei campi di dati da visualizzare.

```sql
SELECT * FROM tableName;
```

---

## Combinare INSERT INTO e SELECT

È possibile inserire i dati prendendoli da un’altra tabella utilizzando l'istruzione `INSERT INTO ... SELECT`:

```sql
INSERT INTO amici (nome, cognome)
SELECT nome, cognome
FROM studenti;
```

---

Nell'esempio qui sopra, abbiamo immaginato di popolare la tabella `amici` inserendo automaticamente i dati già presenti nella tabella `studenti`.

È importante notare che i campi nelle due tabelle devono contenere lo stesso tipo di dato e che la tabella `amici` deve esistere.

---

## CREATE TABLE ... SELECT

Si possono creare delle tabelle già popolate di dati mediante l'uso congiunto delle istruzioni `CREATE TABLE` e `SELECT`. 

`CREATE TABLE` crea la nuova tabella, mentre `SELECT` carica i dati prelevandoli da un’altra tabella. Il suo funzionamento, in pratica, è analogo a quello di `INSERT INTO ... SELECT`.

```sql
CREATE TABLE parenti (
    id INT AUTO_INCREMENT,
    nome VARCHAR(20),
    cognome VARCHAR(30),
    PRIMARY KEY(id)
) SELECT nome, cognome FROM amici;
```

Nell'esempio qui sopra, abbiamo creato la tabella `parenti` con la stessa struttura della tabella `amici`, popolandola con i dati prelevati dalla tabella `amici`.

---

## Duplicare Tabelle e Contenuti

Se abbiamo necessità di copiare il contenuto di una tabella in un'altra tabella, possiamo utilizzare l'istruzione `CREATE TABLE` combinata con `LIKE` e le istruzioni `SELECT`.

Per duplicare esattamente una tabella (con indici e chiavi) e i suoi contenuti, bisogna usare due istruzioni separate:

```sql
CREATE TABLE studenti_bk LIKE studenti;
INSERT INTO studenti_bk SELECT * FROM studenti;
```

---

Si può anche utilizzare un'unica istruzione. In questo caso, gli indici non vengono ricreati, cioè le strutture delle tabelle sono diverse:

```sql
CREATE TABLE studenti_bk2 AS SELECT * FROM studenti;
```

Nell'esempio sopra, abbiamo duplicato la tabella `studenti` nella tabella `studenti_bk` mantenendo la struttura e i dati.
