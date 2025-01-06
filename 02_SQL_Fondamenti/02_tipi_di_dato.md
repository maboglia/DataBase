# I tipi di dato

I tipi di dato in un database rappresentano il formato e il tipo di informazioni che possono essere memorizzate in una colonna di una tabella. I database relazionali offrono una varietà di tipi di dato che consentono di gestire diverse informazioni. Ecco alcuni tipi di dato comuni:

---

## Interi (Integer)

1. **Interi (Integer)
   - `INT`: Numero intero.
   - `SMALLINT`: Piccolo numero intero.
   - `BIGINT`: Grande numero intero.

---

## Decimali e Numeri

2. **Decimali e Numeri a Virgola Mobile
   - `DECIMAL` o `NUMERIC`: Numero decimale o numerico.
   - `FLOAT`: Numero a virgola mobile a precisione singola.
   - `DOUBLE` o `REAL`: Numero a virgola mobile a precisione doppia.

---

## Caratteri e Stringhe

3. **Caratteri e Stringhe
   - `CHAR(n)`: Stringa di lunghezza fissa con lunghezza n.
   - `VARCHAR(n)`: Stringa di lunghezza variabile con lunghezza massima n.
   - `TEXT`: Stringa di lunghezza variabile con lunghezza massima più grande.

---

## Data e Ora

4. **Data e Ora
   - `DATE`: Data.
   - `TIME`: Ora del giorno.
   - `DATETIME` o `TIMESTAMP`: Data e ora combinate.

---

## Booleani

5. **Booleani
   - `BOOLEAN` o `BOOL`: Valore booleano (vero/falso).

---

## Bit e Byte

6. **Bit e Byte
   - `BIT`: Un singolo bit di informazione.
   - `BYTEA` (in alcuni database): Sequenza di byte.

---

## Enumerazioni e Tipi

7. **Enumerazioni e Tipi Personalizzati
   - `ENUM` (in alcuni database): Elenco di valori consentiti per una colonna.
   - Tipi personalizzati definiti dall'utente in alcuni database.

---

## Array

8. **Array
   - `ARRAY` (in alcuni database): Collezione ordinata di valori dello stesso tipo.

---

## Geospaziali

9. **Geospaziali
   - Tipi di dato specializzati per gestire dati geografici e geospaziali, come `POINT`, `LINESTRING`, `POLYGON` (in alcuni database).

---

## JSON e Documenti

10. **JSON e Documenti
    - `JSON` (in alcuni database): Per memorizzare dati in formato JSON.
    - `BSON` (in alcuni database): Formato binario di JSON.

---

## UUID

11. **UUID
    - `UUID` (Universally Unique Identifier): Identificatore univoco.

---

## Money

12. **Money
    - `MONEY`: Tipi di dato per rappresentare valori monetari.

---

Questi sono solo alcuni esempi di tipi di dato comuni. La disponibilità dei tipi di dato può variare leggermente tra i diversi database relazionali. Alcuni database forniscono anche estensioni e tipi di dato specializzati in base alle esigenze specifiche.

---

## **Tipi di Dato Generali SQL**  

- [Tipi di dato Sql Server](../07_TipiDB/30_sql_server.md)
- [Tipi di dato MySql](../07_TipiDB/27_mysql.md)

I tipi di dato in SQL definiscono il formato e le proprietà dei dati memorizzati in colonne specifiche di una tabella. Di seguito sono descritti i tipi di dato principali utilizzati nei database SQL e la loro funzionalità:

---

### **Tipi di Dato Carattere e Stringa**

| **Tipo**                                | **Descrizione**                                                                                                   |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| **`CHARACTER(n)` o `CHAR(n)`**          | Stringa di lunghezza fissa `n`.                                                                                   |
| **`CHARACTER VARYING(n)` o `VARCHAR(n)`**| Stringa di lunghezza variabile con una lunghezza massima di `n`.                                                  |
| **`BINARY(n)`**                         | Stringa binaria di lunghezza fissa `n`.                                                                           |
| **`BINARY VARYING(n)` o `VARBINARY(n)`**| Stringa binaria di lunghezza variabile con una lunghezza massima di `n`.                                          |

---

### **Tipi di Dato Booleani**

| **Tipo**      | **Descrizione**                     |
|---------------|-------------------------------------|
| **`BOOLEAN`** | Memorizza valori `TRUE` o `FALSE`. |

---

### **Tipi di Dato Numerico**

| **Tipo**               | **Descrizione**                                                                                                                                             |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **`INTEGER(p)`**       | Numeri interi con precisione `p`.                                                                                                                          |
| **`SMALLINT`**         | Numeri interi con precisione fino a 5 cifre.                                                                                                                |
| **`INTEGER`**          | Numeri interi con precisione fino a 10 cifre.                                                                                                               |
| **`BIGINT`**           | Numeri interi con precisione fino a 19 cifre.                                                                                                               |
| **`DECIMAL(p,s)`**     | Numeri decimali esatti con precisione totale `p` e scala `s` (es. `DECIMAL(6,2)` significa 4 cifre prima del punto decimale e 2 dopo).                      |
| **`NUMERIC(p,s)`**     | Stesso comportamento di `DECIMAL`.                                                                                                                          |
| **`FLOAT(p)`**         | Numeri a virgola mobile con precisione approssimativa, controllata da `p` (es. `FLOAT(10)` definisce la precisione minima del numero).                      |
| **`REAL`**             | Numeri a virgola mobile con precisione di 7 cifre.                                                                                                          |
| **`DOUBLE PRECISION`** | Numeri a virgola mobile con precisione di 16 cifre.                                                                                                         |

---

### **Tipi di Dato per Data e Ora**

| **Tipo**      | **Descrizione**                                                                                          |
|---------------|----------------------------------------------------------------------------------------------------------|
| **`DATE`**    | Memorizza una data composta da giorno, mese e anno (`YYYY-MM-DD`).                                       |
| **`TIME`**    | Memorizza un'ora composta da secondi, minuti e ore (`HH:MM:SS`).                                         |
| **`TIMESTAMP`**| Memorizza data e ora complete (`YYYY-MM-DD HH:MM:SS`).                                                  |
| **`INTERVAL`** | Rappresenta un periodo di tempo composto da valori numerici come giorni, mesi, ore o secondi.           |

---

### **Tipi di Dato per Raccolte**

| **Tipo**     | **Descrizione**                                                                                      |
|--------------|------------------------------------------------------------------------------------------------------|
| **`ARRAY`**  | Una collezione ordinata di elementi con una lunghezza definita.                                      |
| **`MULTISET`**| Una collezione non ordinata di elementi con lunghezza variabile.                                    |

---

### **Tipi di Dato XML**

| **Tipo** | **Descrizione**                                                                 |
|----------|---------------------------------------------------------------------------------|
| **`XML`**| Utilizzato per memorizzare dati in formato XML fino a 2GB.                     |

---

## **Riferimenti alle Differenze tra Database**

Sebbene i tipi di dato abbiano nomi simili, i loro comportamenti e limiti possono variare tra i diversi sistemi di database. Di seguito sono riportati i tipi comuni mappati su database popolari:

| **Tipo di Dato**       | **Access**   | **SQL Server**   | **Oracle**     | **MySQL**       | **PostgreSQL**   |
|------------------------|--------------|-------------------|----------------|-----------------|------------------|
| **Booleano**           | `Yes/No`    | `Bit`             | `Byte`         | N/A             | `Boolean`        |
| **Intero**             | `Number`    | `Int`             | `Number`       | `Int`           | `Integer`        |
| **Float**              | `Number`    | `Float`           | `Number`       | `Float`         | `Numeric`        |
| **Stringa (Fissa)**    | N/A         | `Char`            | `Char`         | `Char`          | `Char`           |
| **Stringa (Variabile)**| `Text`      | `Varchar`         | `Varchar2`     | `Varchar`       | `Varchar`        |
| **Oggetto Binario**    | `OLE Object`| `Binary`/`Image`  | `Blob`         | `Blob`/`Text`   | `Binary`         |

---

## **Riassunto**

1. I tipi di dato definiscono la natura dei dati memorizzati nelle colonne SQL.
2. Ogni colonna deve essere associata a un tipo di dato al momento della creazione della tabella.
3. Tipi di dato comuni includono stringhe (`CHAR`, `VARCHAR`), numeri (`INT`, `FLOAT`, `DECIMAL`), e tipi temporali (`DATE`, `TIMESTAMP`).
4. Tipi di dato avanzati come `ARRAY`, `MULTISET` o `XML` sono specifici per casi d'uso particolari.
5. Diversi database possono implementare gli stessi tipi di dato in modo differente.
