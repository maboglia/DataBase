# **`LOAD DATA INFILE`**  

`LOAD DATA INFILE` è un'istruzione SQL utilizzata per importare grandi quantità di dati da un file direttamente in una tabella di un database MySQL o MariaDB. Questa funzionalità è estremamente utile per operazioni di caricamento massivo, come l'importazione di dataset esterni.

---

## **Sintassi di Base**  

```sql
LOAD DATA [LOCAL] INFILE 'file_path'
INTO TABLE nome_tabella
[FIELDS
    TERMINATED BY 'delimitatore_campi'
    [OPTIONALLY] ENCLOSED BY 'carattere']
[LINES TERMINATED BY 'delimitatore_linee']
[IGNORE n LINES]
[(colonna1, colonna2, ...)];
```

---

## **Spiegazione dei Parametri**  

1. **`INFILE 'file_path'`**:  
   Specifica il percorso del file da cui leggere i dati.  
   - Il file può essere locale o presente sul server.  
   - Utilizzare l'opzione `LOCAL` se il file si trova sulla macchina client.  

2. **`INTO TABLE nome_tabella`**:  
   Indica il nome della tabella in cui inserire i dati.

3. **`FIELDS`**:  
   Specifica come i campi sono separati e delimitati.  
   - **`TERMINATED BY`**: Definisce il delimitatore tra i campi (es. `,` per CSV, `\t` per file separati da tabulazioni).  
   - **`ENCLOSED BY`**: Specifica un carattere opzionale che racchiude i campi (es. `'` o `"`).  

4. **`LINES TERMINATED BY`**:  
   Specifica come sono separate le righe (es. `\n` per newline o `\r\n` per Windows).

5. **`IGNORE n LINES`**:  
   Ignora le prime `n` righe del file (utile per saltare l'intestazione).

6. **Colonne opzionali**:  
   È possibile specificare le colonne in cui i dati devono essere inseriti (se non tutte le colonne del file corrispondono alla tabella).

---

## **Esempio 1: Importazione di un File CSV**

Supponiamo di avere un file `studenti.csv` con i seguenti dati:  

```
nome,cognome,email,eta
Mario,Rossi,mario.rossi@email.com,22
Anna,Bianchi,anna.bianchi@email.com,21
```

**Comando:**

```sql
LOAD DATA LOCAL INFILE 'studenti.csv'
INTO TABLE studenti
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nome, cognome, email, eta);
```

---

## **Esempio 2: File con Delimitatori Diversi**

Un file `studenti.txt` separato da tabulazioni:  

```
Mario Rossi mario.rossi@email.com 22
Anna Bianchi anna.bianchi@email.com 21
```

**Comando:**

```sql
LOAD DATA INFILE 'studenti.txt'
INTO TABLE studenti
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';
```

---

## **Requisiti e Limitazioni**  

1. **Permessi**:  
   L'utente deve avere il privilegio `FILE` per usare file sul server. Per file locali, è necessaria l'opzione `LOCAL`.

2. **File Path**:  
   - Per i file locali: utilizzare `LOCAL` e il percorso completo.  
   - Per i file sul server: il file deve trovarsi nella directory accessibile a MySQL, come `/var/lib/mysql/`.

3. **Formato del File**:  
   Il formato del file deve corrispondere esattamente ai delimitatori definiti nell'istruzione SQL.

4. **Sicurezza**:  
   L'uso di `LOAD DATA INFILE` può rappresentare un rischio di sicurezza. Per motivi di sicurezza, alcune configurazioni MySQL disabilitano l'opzione `LOCAL`. In tal caso, è necessario configurare il server per consentirla.

---

## **Errore Comune: `The used command is not allowed with this MySQL version`**

Questo errore indica che l'opzione `LOCAL INFILE` è disabilitata.  
**Soluzione:**

1. Abilitare `local_infile` nel file di configurazione `my.cnf`:

   ```
   [mysqld]
   local_infile=1
   ```

2. Riconnettersi con il flag `--local-infile`:

   ```
   mysql --local-infile=1 -u username -p
   ```

