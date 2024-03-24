# Identificazione delle n-uple

Nel contesto dei database relazionali, un'**n-upla** è una serie ordinata di valori che rappresenta una riga in una tabella. Ogni n-upla contiene valori per ciascuna colonna della tabella, seguendo l'ordine definito dalle specifiche dello schema.

L'**identificazione delle n-uple** è il processo di individuare univocamente una riga o un insieme di righe all'interno di una tabella. Questo è particolarmente importante in operazioni come l'aggiornamento, l'eliminazione o il recupero di dati specifici da una tabella.

Per identificare in modo univoco le n-uple, si fa spesso riferimento alle **chiavi primarie**. Una chiave primaria è un attributo (o un insieme di attributi) in una tabella il cui valore è garantito essere univoco per ogni n-upla. Di conseguenza, può essere utilizzato per identificare in modo univoco ciascuna riga nella tabella. Ad esempio, un ID utente univoco potrebbe essere utilizzato come chiave primaria in una tabella degli utenti.

Inoltre, è possibile utilizzare **vincoli di unicità** o **altre chiavi**, come le **chiavi esterne**, per identificare le n-uple in base a criteri specifici.

L'identificazione accurata delle n-uple è fondamentale per garantire l'integrità e l'efficienza dei database relazionali, consentendo alle operazioni di interrogazione e manipolazione dei dati di essere eseguite in modo corretto e coerente.