# Collation in SQL

**Collation** è un insieme di regole che definisce come i caratteri sono confrontati e ordinati in un database. Ogni collation specifica:

1. **Confronto dei caratteri**: Determina se due caratteri sono considerati uguali.
2. **Ordinamento**: Specifica l'ordine in cui i caratteri vengono ordinati (ad esempio, alfabeticamente o in modo specifico per una lingua).

---

## Collation e Charset

Un collation è sempre associato a un **charset** (set di caratteri). Il charset definisce quali caratteri sono supportati, mentre il collation definisce come quei caratteri vengono confrontati e ordinati.

- **Esempio di Charset**: `utf8`, `latin1`, `ascii`.
- **Esempio di Collation**: `utf8_general_ci`, `latin1_swedish_ci`.

---

## Componenti di un Collation

Un collation ha solitamente tre parti:

1. **Charset**: Specifica il set di caratteri (ad esempio, `utf8`).
2. **Regole linguistiche**: Influiscono su come i caratteri sono ordinati e confrontati.
3. **Sensibilità a maiuscole/minuscole e accenti**:
   - `ci`: **Case Insensitive** (non distingue maiuscole da minuscole).
   - `cs`: **Case Sensitive** (distingue maiuscole da minuscole).
   - `ai`: **Accent Insensitive** (ignora gli accenti).
   - `as`: **Accent Sensitive** (considera gli accenti).

---

## Esempi di Collation Comuni

- `utf8_general_ci`:
  - Charset: `utf8`.
  - Case Insensitive.
  - Accent Insensitive.
- `utf8_bin`:
  - Charset: `utf8`.
  - Case Sensitive.
  - Accent Sensitive.
- `latin1_swedish_ci`:
  - Charset: `latin1`.
  - Case Insensitive (usato come collation predefinito per `latin1`).

---

## Come Verificare o Modificare un Collation

### 1. **Verificare il Collation Corrente**
   - Per un database:
     ```sql
     SHOW CREATE DATABASE NomeDatabase;
     ```
   - Per una tabella:
     ```sql
     SHOW TABLE STATUS WHERE Name = 'NomeTabella';
     ```
   - Per una colonna:
     ```sql
     SHOW FULL COLUMNS FROM NomeTabella;
     ```

### 2. **Impostare un Collation**
   - Per un database:
     ```sql
     CREATE DATABASE NomeDatabase
     CHARACTER SET utf8
     COLLATE utf8_general_ci;
     ```
   - Per una tabella:
     ```sql
     CREATE TABLE NomeTabella (
         col1 VARCHAR(50)
     ) CHARACTER SET utf8 COLLATE utf8_general_ci;
     ```
   - Per una colonna:
     ```sql
     ALTER TABLE NomeTabella
     MODIFY col1 VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci;
     ```

---

## Differenza tra Collation `utf8_general_ci` e `utf8_unicode_ci`

| **Caratteristica**      | **utf8_general_ci** | **utf8_unicode_ci** |
|-------------------------|---------------------|---------------------|
| **Prestazioni**         | Più veloce         | Più lento           |
| **Precisione linguistica** | Meno accurato      | Più accurato         |
| **Esempio di differenza** | `ß` = `ss`         | `ß` ≠ `ss`          |

- **`utf8_general_ci`**: È meno accurato in alcune regole linguistiche ma più veloce.
- **`utf8_unicode_ci`**: Segue regole linguistiche più precise.

---

## Quando Usare Collation Diversi

- **Case Insensitive (`ci`)**:
  - Per ricerche che non devono distinguere maiuscole e minuscole.
  - Esempio: Ricerca di nomi o parole chiave.
- **Case Sensitive (`cs`)**:
  - Per valori sensibili alle maiuscole, come password o codici.
- **Accent Sensitive (`as`)**:
  - Per lingue che usano accenti distintivi, come il francese o lo spagnolo.

---

## Esempi Pratici

### Ordinamento Case Insensitive
```sql
SELECT Nome
FROM Utenti
ORDER BY Nome COLLATE utf8_general_ci;
```

### Confronto Case Sensitive
```sql
SELECT *
FROM Utenti
WHERE Nome = 'Mario' COLLATE utf8_bin;
```

### Ignorare Accenti
```sql
SELECT *
FROM Utenti
WHERE Nome = 'José' COLLATE utf8_general_ci;
```

---

## Considerazioni sul Collation

1. **Coerenza**: Usa lo stesso charset e collation per database, tabelle e colonne correlate per evitare errori.
2. **Prestazioni**: Collation più complessi, come `utf8_unicode_ci`, possono influire sulle prestazioni.
3. **Compatibilità**: Quando scambi dati tra database, verifica che il charset e il collation siano compatibili.