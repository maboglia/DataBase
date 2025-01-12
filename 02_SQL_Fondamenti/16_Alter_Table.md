# **`ALTER TABLE`** per modificare una tabella esistente

---

### **1. Aggiungere una colonna**

Aggiunge una nuova colonna alla tabella.

```sql
ALTER TABLE utenti
ADD data_nascita DATE;
```

*Aggiunge una colonna `data_nascita` di tipo `DATE` alla tabella `utenti`.*

---

### **2. Modificare una colonna**

Modifica il tipo di dati o altre proprietà di una colonna esistente.

```sql
ALTER TABLE utenti
MODIFY COLUMN nome VARCHAR(100);
```

*Modifica la lunghezza della colonna `nome` a 100 caratteri.*

---

### **3. Rinominare una colonna**

Rinomina una colonna esistente.

```sql
ALTER TABLE utenti
CHANGE COLUMN nome nome_completo VARCHAR(100);
```

*Rinomina la colonna `nome` in `nome_completo` e modifica il tipo a `VARCHAR(100)`.*

---

### **4. Eliminare una colonna**

Rimuove una colonna dalla tabella.

```sql
ALTER TABLE utenti
DROP COLUMN indirizzo;
```

*Elimina la colonna `indirizzo` dalla tabella `utenti`.*

---

### **5. Aggiungere una chiave primaria**

Imposta una colonna esistente come chiave primaria.

```sql
ALTER TABLE utenti
ADD PRIMARY KEY (id);
```

*Imposta la colonna `id` come chiave primaria della tabella `utenti`.*

---

### **6. Aggiungere un vincolo di chiave esterna**

Collega una colonna con un'altra tabella tramite un vincolo di chiave esterna.

```sql
ALTER TABLE ordini
ADD CONSTRAINT fk_cliente
FOREIGN KEY (cliente_id)
REFERENCES clienti(id);
```

*Aggiunge un vincolo di chiave esterna `fk_cliente` per collegare `cliente_id` di `ordini` alla colonna `id` della tabella `clienti`.*

---

### **7. Eliminare un vincolo**

Rimuove un vincolo, ad esempio una chiave esterna.

```sql
ALTER TABLE ordini
DROP FOREIGN KEY fk_cliente;
```

*Elimina il vincolo di chiave esterna `fk_cliente` dalla tabella `ordini`.*

---

### **8. Rinominare una tabella**

Rinomina la tabella a un nuovo nome.

```sql
ALTER TABLE utenti
RENAME TO clienti;
```

*Rinomina la tabella `utenti` in `clienti`.*

---

### **9. Aggiungere un indice**

Crea un indice su una colonna per migliorare le prestazioni delle query.

```sql
ALTER TABLE utenti
ADD INDEX idx_nome (nome);
```

*Aggiunge un indice sulla colonna `nome` della tabella `utenti`.*

---

### **10. Rimuovere un indice**

Elimina un indice esistente.

```sql
ALTER TABLE utenti
DROP INDEX idx_nome;
```

*Rimuove l'indice `idx_nome` dalla tabella `utenti`.*

---

## Spostare una colonna

In SQL, non esiste una funzione diretta per spostare un campo all'interno di una tabella. Tuttavia, è possibile ottenere questo risultato utilizzando una combinazione di comandi `ALTER TABLE`, `DROP COLUMN` e `ADD COLUMN`

Spostare un campo di una tabella richiede in genere i seguenti passaggi:

### **Passi per spostare un campo:**

1. **Aggiungere una nuova colonna con il tipo di dato desiderato e il valore della colonna da spostare**.
2. **Copiare i valori dalla vecchia colonna nella nuova colonna**.
3. **Eliminare la vecchia colonna**.
4. **Rinominare la colonna nuova, se necessario**.

### **Esempio pratico:**

Immagina di voler spostare il campo `telefono` dalla posizione successiva a `email` a una posizione subito dopo il campo `cognome`.

### 1. **Aggiungi una nuova colonna (che è la copia del campo da spostare):**

```sql
ALTER TABLE clienti
ADD telefono_temp VARCHAR(20) AFTER cognome;
```

### 2. **Copia i valori dalla vecchia colonna (`telefono`) nella nuova colonna (`telefono_temp`):**

```sql
UPDATE clienti
SET telefono_temp = telefono;
```

### 3. **Elimina la vecchia colonna (`telefono`):**

```sql
ALTER TABLE clienti
DROP COLUMN telefono;
```

### 4. **Rinomina la nuova colonna (`telefono_temp`) in `telefono`:**

```sql
ALTER TABLE clienti
CHANGE telefono_temp telefono VARCHAR(20);
```

### **Nota:**  

- Il comando `AFTER` viene utilizzato per specificare la posizione della nuova colonna, ma dipende dal sistema di gestione del database. In alcune versioni di MySQL (ad esempio, alcune versioni più recenti) il comando `AFTER` potrebbe non essere supportato.
- In alcuni DBMS, come PostgreSQL, non è possibile cambiare l'ordine delle colonne, quindi questo approccio non funzionerebbe senza altre soluzioni (come creare una nuova tabella e copiare i dati).

---

Questo è un esempio di base per spostare un campo in una tabella. Ogni sistema di gestione dei database (MySQL, PostgreSQL, SQL Server, ecc.) ha sintassi e limiti che potrebbero variare, quindi assicurati di consultare la documentazione specifica se hai bisogno di adattare questa procedura.

---

Nel caso di MySQL, l'istruzione `ALTER TABLE ... MODIFY` non ti consente direttamente di spostare una colonna, ma solo di modificarne il tipo di dato, la lunghezza o altre proprietà.

Tuttavia, **non puoi** spostare la posizione di una colonna tramite `MODIFY`, e quindi non è possibile spostare una colonna all'inizio o in una posizione specifica usando questa sintassi.

Per spostare una colonna all'inizio o in una posizione specifica della tabella, puoi utilizzare il comando `ALTER TABLE` insieme a `MODIFY` e `FIRST` o `AFTER`, ma solo in una specifica sintassi:

### Sintassi per spostare una colonna all'inizio (usando `MODIFY` e `FIRST`)

```sql
ALTER TABLE nome_tabella
MODIFY colonna_nome tipo_dato FIRST;
```

Questo sposterà la colonna al primo posto della tabella.

### Sintassi per spostare una colonna dopo un'altra (usando `MODIFY` e `AFTER`)

```sql
ALTER TABLE nome_tabella
MODIFY colonna_nome tipo_dato AFTER colonna_riferimento;
```

Questo sposterà la colonna `colonna_nome` subito dopo `colonna_riferimento`.

### Esempio pratico

Immagina di avere una tabella `clienti` con le colonne `id`, `nome`, `cognome`, `telefono`, e vuoi spostare la colonna `telefono` all'inizio della tabella.

```sql
ALTER TABLE clienti
MODIFY telefono VARCHAR(20) FIRST;
```

Questo comando sposterà la colonna `telefono` al primo posto della tabella `clienti`.

### Nota

- L'operazione di spostamento delle colonne è supportata solo da alcuni DBMS, come MySQL, e potrebbe non essere supportata da altri, come PostgreSQL.
- La sintassi `MODIFY` permette solo di cambiare il tipo di dato di una colonna, ma non di rinominarla o spostarla senza cambiarne le proprietà. Per cambiarne la posizione senza alterarne altre proprietà, devi usare `FIRST` o `AFTER` come mostrato sopra.
