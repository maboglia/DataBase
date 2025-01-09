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

