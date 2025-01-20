# Funzioni per gestire le stringhe
---

1. **ASCII**  
Restituisce il valore numerico ASCII del primo carattere di una stringa.  
Esempio:  

```sql
SELECT ASCII('A'); -- Risultato: 65
```

---

2. **CHAR_LENGTH**  
Conta il numero di caratteri in una stringa, indipendentemente dalla codifica.  
Esempio:  

```sql
SELECT CHAR_LENGTH('SQL Tutorial'); -- Risultato: 11
```

---

3. **CONCAT**  
Unisce più stringhe in una singola stringa.  
Esempio:  

```sql
SELECT CONCAT('Hello', ' ', 'World!'); -- Risultato: Hello World!
```

---

4. **CONCAT_WS**  
Concatena stringhe separandole con un delimitatore specifico.  
Esempio:  

```sql
SELECT CONCAT_WS('-', '2024', '12', '30'); -- Risultato: 2024-12-30
```

---

5. **INSERT**  
Sostituisce parte di una stringa con un'altra, a partire da una posizione specifica e per un certo numero di caratteri.  
Esempio:  

```sql
SELECT INSERT('SQL Tutorial', 5, 7, 'Example'); -- Risultato: SQL Example
```

---

6. **LCASE/LOWER**  
Converte tutti i caratteri di una stringa in minuscolo.  
Esempio:  

```sql
SELECT LOWER('HELLO'); -- Risultato: hello
```

---

7. **LEFT**  
Estrae i primi N caratteri di una stringa, partendo da sinistra.  
Esempio:  

```sql
SELECT LEFT('Database', 4); -- Risultato: Data
```

---

8. **LENGTH**  
Calcola la lunghezza della stringa in termini di byte (utile per stringhe con codifiche multibyte).  
Esempio:  

```sql
SELECT LENGTH('SQL'); -- Risultato: 3
```

---

9. **REPLACE**  
Sostituisce tutte le occorrenze di una sottostringa con un'altra.  
Esempio:  

```sql
SELECT REPLACE('Hello World', 'World', 'SQL'); -- Risultato: Hello SQL
```

---

10. **UPPER**  
Converte tutti i caratteri di una stringa in maiuscolo.  
Esempio:  

```sql
SELECT UPPER('hello'); -- Risultato: HELLO
```

---

## Elenco funzioni

[MySql 8.4](https://dev.mysql.com/doc/refman/8.4/en/string-functions.html)

Name|Description
---|---
ASCII()|Return numeric value of left-most character
BIN()|Return a string containing binary representation of a number
BIT_LENGTH()|Return length of argument in bits
CHAR()|Return the character for each integer passed
CHAR_LENGTH()|Return number of characters in argument
CHARACTER_LENGTH()|Synonym for CHAR_LENGTH()
CONCAT()|Return concatenated string
CONCAT_WS()|Return concatenate with separator
ELT()|Return string at index number
EXPORT_SET()|Return a string such that for every bit set in the value bits, you get an on string and for every unset bit, you get an off string
FIELD()|Index (position) of first argument in subsequent arguments
FIND_IN_SET()|Index (position) of first argument within second argument
FORMAT()|Return a number formatted to specified number of decimal places
HEX()|Hexadecimal representation of decimal or string value
INSERT()|Insert substring at specified position up to specified number of characters
INSTR()|Return the index of the first occurrence of substring
LCASE()|Synonym for LOWER()
LEFT()|Return the leftmost number of characters as specified
LENGTH()|Return the length of a string in bytes
LIKE Simple pattern matching
LOAD_FILE()|Load the named file
LOCATE()|Return the position of the first occurrence of substring
LOWER()|Return the argument in lowercase
LPAD()|Return the string argument, left-padded with the specified string
LTRIM()|Remove leading spaces
MAKE_SET()|Return a set of comma-separated strings that have the corresponding bit in bits set
MATCH()|Perform full-text search
MID()|Return a substring starting from the specified position
NOT LIKE Negation of simple pattern matching
NOT REGEXP Negation of REGEXP
OCT()|Return a string containing octal representation of a number
OCTET_LENGTH()|Synonym for LENGTH()
ORD()|Return character code for leftmost character of the argument
POSITION()|Synonym for LOCATE()
QUOTE()|Escape the argument for use in an SQL statement
REGEXP Whether string matches regular expression
REGEXP_INSTR()|Starting index of substring matching regular expression
REGEXP_LIKE()|Whether string matches regular expression
REGEXP_REPLACE()|Replace substrings matching regular expression
REGEXP_SUBSTR()|Return substring matching regular expression
REPEAT()|Repeat a string the specified number of times
REPLACE()|Replace occurrences of a specified string
REVERSE()|Reverse the characters in a string
RIGHT()|Return the specified rightmost number of characters
RLIKE Whether string matches regular expression
RPAD()|Append string the specified number of times
RTRIM()|Remove trailing spaces
SOUNDEX()|Return a soundex string
SOUNDS LIKE Compare sounds
SPACE()|Return a string of the specified number of spaces
STRCMP()|Compare two strings
SUBSTR()|Return the substring as specified
SUBSTRING()|Return the substring as specified
SUBSTRING_INDEX()|Return a substring from a string before the specified number of occurrences of the delimiter
TRIM()|Remove leading and trailing spaces
UCASE()|Synonym for UPPER()
UNHEX()|Return a string containing hex representation of a number
UPPER()|Convert to uppercase
WEIGHT_STRING()|Return the weight string for a string
