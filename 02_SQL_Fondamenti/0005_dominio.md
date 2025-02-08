# dominio

In SQL, un *dominio* si riferisce a un insieme di valori validi che una colonna in una tabella può assumere. In altre parole, è un concetto che definisce i vincoli sui dati che una colonna può contenere, come il tipo di dato e altre regole (ad esempio, intervalli numerici, lunghezza del testo, valori predefiniti, ecc.).

Il dominio può essere definito attraverso:

1. **Tipo di dato**: Ad esempio, una colonna potrebbe avere un dominio di tipo `INTEGER`, `VARCHAR`, `DATE`, ecc.
2. **Vincoli**: I vincoli di integrità come `NOT NULL`, `CHECK`, `UNIQUE`, ecc. possono definire ulteriormente i valori che una colonna può avere.

Un esempio di dominio può essere definire un campo di tipo `DATE` che accetta solo date valide, o un campo `SALARY` che accetta solo valori numerici positivi.

In alcuni sistemi di gestione di basi di dati (DBMS), è anche possibile definire un *dominio* come un oggetto separato che può essere riutilizzato in più colonne di tabelle diverse, semplificando la gestione dei dati e dei vincoli.
