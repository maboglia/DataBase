# Enum

In MySQL, il tipo **ENUM** è un tipo di dato speciale che consente di memorizzare una **serie predefinita di valori possibili** per una colonna. È utile per rappresentare campi che accettano solo un set limitato di opzioni, come stati, categorie o tipi.

---

### **Caratteristiche principali**

1. **Definizione**:
   - L'ENUM è una lista di valori **predefiniti** specificata al momento della creazione della tabella.
   - Una colonna di tipo ENUM può contenere solo uno dei valori definiti o NULL (se consentito).

2. **Lunghezza massima**:
   - Può contenere **fino a 65.535 valori distinti**.
   - Ogni valore è memorizzato internamente come un **numero intero** basato sull'ordine dei valori definiti (es. il primo valore è mappato a `1`, il secondo a `2`, e così via).

3. **Ordinamento**:
   - L'ordinamento dei dati segue l'ordine definito nella lista ENUM, non l'ordine alfabetico.

4. **Archiviazione**:
   - Occupa 1 byte per un massimo di 255 valori.
   - Occupa 2 byte se i valori superano 255.

---

### **Vantaggi**

- **Efficienza**: Grazie alla rappresentazione interna come numeri, ENUM è più efficiente rispetto a una colonna VARCHAR.
- **Validazione integrata**: Impedisce l'inserimento di valori non presenti nella lista ENUM.

---

### **Svantaggi**

- **Rigidità**: I valori possibili devono essere definiti al momento della creazione della tabella, e modificarli richiede l'uso di `ALTER TABLE`.
- **Compatibilità**: ENUM è specifico di MySQL; potrebbe non essere supportato o comportarsi diversamente in altri database.

---

### **Sintassi**

#### **Creazione**

```sql
CREATE TABLE Ordini (
    Stato ENUM('In attesa', 'In lavorazione', 'Completato', 'Annullato') NOT NULL
);
```

#### **Inserimento**

```sql
INSERT INTO Ordini (Stato) VALUES ('In lavorazione'), ('Completato');
```

#### **Visualizzazione**

```sql
SELECT * FROM Ordini WHERE Stato = 'Completato';
```

---

### **Esempio con ENUM**

#### Scenario: Stato di un ordine

```sql
CREATE TABLE Ordini (
    CodOrdine INT AUTO_INCREMENT PRIMARY KEY,
    Stato ENUM('In attesa', 'In lavorazione', 'Completato', 'Annullato') NOT NULL
);
```

#### Inserimento dei dati

```sql
INSERT INTO Ordini (Stato) VALUES ('In attesa'), ('Completato'), ('Annullato');
```

#### Risultato

| CodOrdine | Stato          |
|-----------|----------------|
| 1         | In attesa      |
| 2         | Completato     |
| 3         | Annullato      |

---

### **Gestione e Modifica**

#### Modifica dei valori ENUM (aggiungere o rimuovere)

Per aggiungere un nuovo stato, si usa `ALTER TABLE`:

```sql
ALTER TABLE Ordini MODIFY Stato ENUM('In attesa', 'In lavorazione', 'Completato', 'Annullato', 'Restituito');
```

---

### **Note importanti**

1. **Default**: Una colonna ENUM può avere un valore predefinito.

   ```sql
   Stato ENUM('Attivo', 'Inattivo') DEFAULT 'Attivo'
   ```

2. **Valore non valido**: Se si tenta di inserire un valore non valido, MySQL restituisce un errore (a meno che la modalità strict non sia disabilitata, nel qual caso viene inserito un valore vuoto `''`).

3. **Controllo dell'ordine**:
   - L'ordine dei valori è importante; `ORDER BY` seguirà l'ordine specificato:

   ```sql
   SELECT * FROM Ordini ORDER BY Stato;
   ```

4. **Valore numerico**: Puoi ottenere il valore numerico interno associato a un valore ENUM:

   ```sql
   SELECT Stato + 0 AS StatoNumerico FROM Ordini;
   ```

---

### **Quando usare ENUM**

- Campi con valori limitati e statici (es. stato ordine, genere, categoria).
- Quando vuoi assicurarti che i valori siano controllati e validati automaticamente.  
Se i valori cambiano frequentemente o sono troppi, considera invece l'uso di una **tabella relazionale**.
