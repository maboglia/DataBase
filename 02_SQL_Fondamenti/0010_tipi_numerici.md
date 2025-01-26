# i tipi di dati numerici

In MySQL, i tipi di dati numerici sono utilizzati per memorizzare valori numerici, come interi e numeri con virgola decimale. Essi si dividono in due categorie principali: **numeri interi** e **numeri a virgola mobile o decimali**. Ecco una panoramica:

---

### **1. Tipi numerici interi**

Questi tipi sono utilizzati per memorizzare numeri interi (senza decimali).

| Tipo         | Dimensione in byte | Intervallo (SIGNED)                     | Intervallo (UNSIGNED)                  |
|--------------|--------------------|------------------------------------------|-----------------------------------------|
| **TINYINT**  | 1                  | -128 a 127                               | 0 a 255                                 |
| **SMALLINT** | 2                  | -32,768 a 32,767                         | 0 a 65,535                              |
| **MEDIUMINT**| 3                  | -8,388,608 a 8,388,607                   | 0 a 16,777,215                          |
| **INT**      | 4                  | -2,147,483,648 a 2,147,483,647           | 0 a 4,294,967,295                       |
| **BIGINT**   | 8                  | -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807 | 0 a 18,446,744,073,709,551,615 |

- **SIGNED**: Valore predefinito, supporta numeri positivi e negativi.
- **UNSIGNED**: Utilizza solo valori positivi, raddoppiando l'intervallo massimo.

#### Esempio

```sql
CREATE TABLE NumeriInteri (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    valore TINYINT NOT NULL
);
```

---

### **2. Tipi numerici a virgola mobile**

Utilizzati per memorizzare numeri con parti decimali. Si dividono in:

| Tipo      | Precisione       | Dimensione in byte | Uso principale             |
|-----------|------------------|--------------------|----------------------------|
| **FLOAT** | Precisione singola (~7 cifre) | 4                  | Numeri con decimali, meno preciso |
| **DOUBLE** o **REAL** | Precisione doppia (~16 cifre) | 8 | Numeri con decimali più precisi |
| **DECIMAL** o **NUMERIC** | Precisione definita dall'utente | Variabile (dipende dalla lunghezza) | Precisione fissa per numeri finanziari |

- **FLOAT** e **DOUBLE** sono più veloci ma meno precisi perché i valori sono approssimati.
- **DECIMAL/NUMERIC** memorizzano i valori esattamente come definiti, ideali per applicazioni che richiedono alta precisione (es. contabilità).

#### Esempio

```sql
CREATE TABLE NumeriDecimali (
    prezzo DECIMAL(10, 2), -- Max 10 cifre totali, di cui 2 decimali
    punteggio FLOAT
);
```

---

### **3. Opzioni comuni per i tipi numerici**

- **ZEROFILL**: Riempie i numeri con zeri a sinistra fino alla lunghezza definita.
- **AUTO_INCREMENT**: Incrementa automaticamente il valore intero per le chiavi primarie.
- **UNSIGNED**: Permette solo valori positivi.

#### Esempio con ZEROFILL e UNSIGNED

```sql
CREATE TABLE OpzioniNumeriche (
    id INT UNSIGNED ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    valore SMALLINT NOT NULL
);
```

---

### **4. Considerazioni**

- Scegli il tipo di dato in base alla **dimensione** e alla **precisione** richieste.
- Usa tipi interi quando non hai bisogno di decimali.
- Usa `DECIMAL` per calcoli finanziari o dove la precisione è fondamentale.
- Usa `FLOAT` o `DOUBLE` per dati scientifici o approssimati.
