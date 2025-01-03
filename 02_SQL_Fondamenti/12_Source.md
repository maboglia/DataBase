# Scrivere e utilizzare uno script .sql

L'istruzione `SOURCE` permette a MySQL di leggere ed eseguire istruzioni SQL salvate in un file di testo con estensione `.sql`.

Per utilizzare questa funzionalità, si utilizza l'istruzione `SOURCE` (non standard SQL) seguita dal percorso del file. È importante notare che non si deve includere il delimitatore `;` per chiudere l'istruzione.

Ad esempio, se si desidera caricare un file dalla scrivania, si scrive:

```sql
SOURCE C:\Users\UtenteCorrente\Desktop\script.sql
```

Dove `C:\Users\UtenteCorrente\Desktop\script.sql` è il percorso del file SQL da eseguire.

Se ricevete l'errore: `ERROR: Unknown command '\U'. ...'\a' ...'\D'.` (dove '\[lettera]' è l’iniziale della directory nel path inserito), potete adottare le seguenti soluzioni:

- Invertire nel path la barra rovesciata "\" con la barra "/".
- Provare ad effettuare l’escape inserendo la barra rovesciata '\/'.
- Se ci sono spazi nel nome del path, racchiudetelo tra virgolette.

Esempi:

```sql
SOURCE C:/Users/UtenteCorrente/Desktop/script.sql
SOURCE C:\/Users\/UtenteCorrente\/Desktop\/script.sql
SOURCE "C:\Users\UtenteCorrente\Desktop\script.sql"
```
