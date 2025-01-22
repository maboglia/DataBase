# roadmap SQL per MySQL

---

### **1. DATABASES**  

Descrizione: Un database è un contenitore logico per le tabelle e altre strutture.  
Esempio:  

```sql
CREATE DATABASE PokemonDB;
USE PokemonDB;
```

---

### **2. TABLES**  

Descrizione: Una tabella è una struttura per memorizzare i dati in righe e colonne.  
Esempio:  

```sql
CREATE TABLE pokemon (id INT, name VARCHAR(50), type VARCHAR(20));
```

---

### **3. INSERT ROWS**  

Descrizione: Aggiungere righe di dati in una tabella.  
Esempio:  

```sql
INSERT INTO pokemon (id, name, type) VALUES (1, 'Pikachu', 'Electric');
```

---

### **4. SELECT**  

Descrizione: Recuperare dati dalle tabelle.  
Esempio:  

```sql
SELECT * FROM pokemon;
```

---

### **5. UPDATE & DELETE**  

Descrizione: Modificare o rimuovere dati.  
Esempio:  

```sql
UPDATE pokemon SET type = 'Fire' WHERE name = 'Pikachu';
DELETE FROM pokemon WHERE id = 1;
```

---

### **6. AUTOCOMMIT, COMMIT, ROLLBACK**  

Descrizione: Gestire le transazioni per mantenere l'integrità dei dati.  
Esempio:  

```sql
START TRANSACTION;
UPDATE pokemon SET type = 'Water' WHERE name = 'Pikachu';
ROLLBACK; -- Annulla l'operazione
```

---

### **7. CURRENT_DATE() & CURRENT_TIME()**  

Descrizione: Ottenere la data e l'ora correnti.  
Esempio:  

```sql
SELECT CURRENT_DATE(), CURRENT_TIME();
```

---

### **8. UNIQUE**  

Descrizione: Impedisce valori duplicati in una colonna.  
Esempio:  

```sql
CREATE TABLE pokemon (id INT UNIQUE, name VARCHAR(50));
```

---

### **9. NOT NULL**  

Descrizione: Richiede che una colonna non abbia valori NULL.  
Esempio:  

```sql
CREATE TABLE pokemon (id INT NOT NULL, name VARCHAR(50));
```

---

### **10. CHECK**  

Descrizione: Imposta una condizione sui valori della colonna.  
Esempio:  

```sql
CREATE TABLE pokemon (id INT, level INT CHECK (level > 0));
```

---

### **11. DEFAULT**  

Descrizione: Assegna un valore predefinito a una colonna.  
Esempio:  

```sql
CREATE TABLE pokemon (id INT, level INT DEFAULT 1);
```

---

### **12. PRIMARY KEYS**  

Descrizione: Un identificatore univoco per ogni riga.  
Esempio:  

```sql
CREATE TABLE pokemon (id INT PRIMARY KEY, name VARCHAR(50));
```

---

### **13. AUTO_INCREMENT**  

Descrizione: Genera automaticamente valori incrementali.  
Esempio:  

```sql
CREATE TABLE pokemon (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50));
```

---

### **14. FOREIGN KEYS**  

Descrizione: Crea una relazione tra tabelle.  
Esempio:  

```sql
CREATE TABLE trainer (id INT, pokemon_id INT, FOREIGN KEY (pokemon_id) REFERENCES pokemon(id));
```

---

### **15. JOINS**  

Descrizione: Combina dati da più tabelle.  
Esempio:  

```sql
SELECT trainer.name, pokemon.name 
FROM trainer 
JOIN pokemon ON trainer.pokemon_id = pokemon.id;
```

---

### **16. FUNCTIONS**  

Descrizione: Operazioni integrate come calcoli o manipolazioni.  
Esempio:  

```sql
SELECT UPPER(name) FROM pokemon;
```

---

### **17. AND, OR, NOT**  

Descrizione: Filtrare dati con condizioni complesse.  
Esempio:  

```sql
SELECT * FROM pokemon WHERE type = 'Electric' AND level > 5;
```

---

### **18. WILD CARDS**  

Descrizione: Filtrare dati con caratteri speciali.  
Esempio:  

```sql
SELECT * FROM pokemon WHERE name LIKE 'Pik%';
```

---

### **19. ORDER BY**  

Descrizione: Ordinare i risultati.  
Esempio:  

```sql
SELECT * FROM pokemon ORDER BY name ASC;
```

---

### **20. LIMIT**  

Descrizione: Limitare il numero di righe restituite.  
Esempio:  

```sql
SELECT * FROM pokemon LIMIT 5;
```

---

### **21. UNIONS**  

Descrizione: Combina i risultati di più query.  
Esempio:  

```sql
SELECT name FROM pokemon WHERE type = 'Fire'
UNION
SELECT name FROM pokemon WHERE type = 'Water';
```

---

### **22. SELF JOINS**  

Descrizione: Unire una tabella a sé stessa.  
Esempio:  

```sql
SELECT a.name, b.name 
FROM pokemon a, pokemon b 
WHERE a.type = b.type AND a.id != b.id;
```

---

### **23. VIEWS**  

Descrizione: Tabelle virtuali basate su query.  
Esempio:  

```sql
CREATE VIEW FirePokemon AS 
SELECT * FROM pokemon WHERE type = 'Fire';
```

---

### **24. INDEXES**  

Descrizione: Migliorano la velocità delle query.  
Esempio:  

```sql
CREATE INDEX idx_type ON pokemon(type);
```

---

### **25. SUBQUERIES**  

Descrizione: Una query nidificata dentro un'altra.  
Esempio:  

```sql
SELECT * FROM pokemon WHERE level > (SELECT AVG(level) FROM pokemon);
```

---

### **26. GROUP BY**  

Descrizione: Raggruppa righe per calcoli aggregati.  
Esempio:  

```sql
SELECT type, COUNT(*) FROM pokemon GROUP BY type;
```

---

### **27. ROLLUP**  

Descrizione: Calcola totali cumulativi.  
Esempio:  

```sql
SELECT type, COUNT(*) FROM pokemon GROUP BY type WITH ROLLUP;
```

---

### **28. ON DELETE**  

Descrizione: Azione quando una riga referenziata viene eliminata.  
Esempio:  

```sql
CREATE TABLE trainer (id INT, pokemon_id INT, 
FOREIGN KEY (pokemon_id) REFERENCES pokemon(id) ON DELETE CASCADE);
```

---

### **29. STORED PROCEDURES**  

Descrizione: Blocco riutilizzabile di codice SQL.  
Esempio:  

```sql
DELIMITER //
CREATE PROCEDURE GetFirePokemon()
BEGIN
  SELECT * FROM pokemon WHERE type = 'Fire';
END //
DELIMITER ;
CALL GetFirePokemon();
```

---

### **30. TRIGGERS**  

Descrizione: Eseguito automaticamente in risposta a eventi.  
Esempio:  

```sql
CREATE TRIGGER after_insert_pokemon 
AFTER INSERT ON pokemon 
FOR EACH ROW 
INSERT INTO log_table (action, pokemon_name) VALUES ('INSERT', NEW.name);
```

---

## Dati di esempio

- [tabella pokemon](../09_data/pokemon.sql)
- [esercitazione](../06_Esercitazioni/testo/pokemon.md)