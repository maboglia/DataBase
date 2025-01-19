# **Numeric Functions**

---

1. **ABS**  
Restituisce il valore assoluto di un numero.  

```sql
SELECT ABS(-5); -- Risultato: 5
```

---

2. **ROUND**  
Arrotonda un numero al numero di decimali specificato.  

```sql
SELECT ROUND(123.456, 2); -- Risultato: 123.46
```

---

3. **CEIL/CEILING**  
Arrotonda un numero al valore intero più vicino verso l’alto.  

```sql
SELECT CEIL(10.3); -- Risultato: 11
```

---

4. **FLOOR**  
Arrotonda un numero al valore intero più vicino verso il basso.  

```sql
SELECT FLOOR(10.7); -- Risultato: 10
```

---

5. **SQRT**  
Calcola la radice quadrata.  

```sql
SELECT SQRT(16); -- Risultato: 4
```

---

6. **PI**  
Restituisce il valore di π.  

```sql
SELECT PI(); -- Risultato: 3.141593
```

---

7. **POWER**  
Eleva un numero a una potenza.  

```sql
SELECT POWER(2, 3); -- Risultato: 8
```

---

8. **MOD**  
Restituisce il resto della divisione.  

```sql
SELECT MOD(10, 3); -- Risultato: 1
```

---

9. **RAND**  
Genera un numero casuale compreso tra 0 e 1.  

```sql
SELECT RAND(); -- Risultato: Numero casuale
```

---

10. **SUM**  
Restituisce la somma di una colonna numerica.  

```sql
SELECT SUM(Prezzo) FROM Prodotti;
```

---

## MySQLNumeric functions

[MySQL 8.4](https://dev.mysql.com/doc/refman/8.4/en/numeric-functions.html)

Name|Description
---|---
`%`|MOD Modulo operator
`*`|Multiplication operator
`+`|Addition operator
`-`|Minus operator
`*`|Change the sign of the argument
`/`|Division operator
ABS()|Return the absolute value
ACOS()|Return the arc cosine
ASIN()|Return the arc sine
ATAN()|Return the arc tangent
ATAN2(), ATAN()|Return the arc tangent of the two arguments
CEIL()|Return the smallest integer value not less than the argument
CEILING()|Return the smallest integer value not less than the argument
CONV()|Convert numbers between different number bases
COS()|Return the cosine
COT()|Return the cotangent
CRC32()|Compute a cyclic redundancy check value
DEGREES()|Convert radians to degrees
DIV Integer division
EXP()|Raise to the power of
FLOOR()|Return the largest integer value not greater than the argument
LN()|Return the natural logarithm of the argument
LOG()|Return the natural logarithm of the first argument
LOG10()|Return the base-10 logarithm of the argument
LOG2()|Return the base-2 logarithm of the argument
MOD()|Return the remainder
PI()|Return the value of pi
POW()|Return the argument raised to the specified power
POWER()|Return the argument raised to the specified power
RADIANS()|Return argument converted to radians
RAND()|Return a random floating-point value
ROUND()|Round the argument
SIGN()|Return the sign of the argument
SIN()|Return the sine of the argument
SQRT()|Return the square root of the argument
TAN()|Return the tangent of the argument
TRUNCATE()|Truncate to specified number of decimal places
