# Limiti nella scrittura dell'espressione

La scrittura di espressioni per le colonne generate in MySQL è soggetta a diversi limiti e restrizioni che è importante tenere in considerazione durante la progettazione del database e della tabella.

---

## espressione deterministica

Un'espressione deterministica in MySQL è un'espressione il cui **risultato è sempre lo stesso** quando ha gli **stessi valori di input**, senza importare quando o dove viene eseguita. In altre parole, una funzione o un'espressione è considerata deterministica se, **date le stesse condizioni in input, produce sempre lo stesso risultato**.

---

Esempi di espressioni deterministiche includono operazioni matematiche semplici, come l'**addizione** o la **moltiplicazione**, nonché funzioni come **CONCAT**, **DATE_FORMAT** e altre che restituiscono sempre lo stesso risultato per un determinato set di input.

---

D'altra parte, le funzioni che coinvolgono l'ora corrente, come NOW() o CURDATE(), sono considerate **non deterministiche** poiché il loro risultato dipende dal momento in cui vengono eseguite. Inoltre, alcune funzioni che coinvolgono l'accesso a dati esterni o il comportamento del sistema operativo potrebbero essere considerate non deterministiche.

---

Le espressioni deterministiche sono importanti quando si utilizzano **colonne generate**, poiché tali colonne devono essere valutate in modo coerente e prevedibile ogni volta che vengono lette o aggiornate.

La scrittura di espressioni per le colonne generate in MySQL è soggetta a diversi limiti e restrizioni che è importante tenere in considerazione durante la progettazione del database e della tabella.

---

## principali limiti

Ecco un riepilogo dei principali **limiti nella scrittura delle espressioni** per le colonne generate:

1. **Valori letterali, funzioni integrate deterministiche e operatori**: È possibile utilizzare valori letterali (come stringhe o numeri), funzioni integrate deterministiche (che producono sempre lo stesso risultato per lo stesso set di input) e operatori nelle espressioni per le colonne generate.

2. **Funzioni non deterministiche non consentite**: Funzioni come CONNECTION_ID(), CURRENT_USER(), NOW(), CURDATE(), che restituiscono valori che possono variare in base al contesto di esecuzione, non sono consentite nelle espressioni per le colonne generate.

3. **Subquery non consentite**: Non è possibile utilizzare subquery nelle espressioni per le colonne generate.

4. **Riferimento a colonne generate**: Una definizione di colonna generata può fare riferimento ad altre colonne generate nella stessa tabella, ma solo a quelle definite precedentemente.

5. **Riferimento a colonne di base**: Una definizione di colonna generata può fare riferimento a qualsiasi colonna di base (non generata) nella tabella, indipendentemente dalla sua posizione nella definizione della tabella.

6. **Attributo AUTO_INCREMENT**: L'attributo AUTO_INCREMENT non può essere utilizzato direttamente in una definizione di colonna generata.

7. **Colonna AUTO_INCREMENT non utilizzabile**: Non è possibile utilizzare una colonna AUTO_INCREMENT come colonna di base in una definizione di colonna generata.

8. **Errore di valutazione dell'espressione**: Se l'evaluazione dell'espressione per una colonna generata provoca il troncamento o fornisce un input errato a una funzione, l'operazione di creazione della tabella termina con un errore.

---

## limiti

Tenendo conto di questi limiti, è possibile progettare e **definire colonne generate** in modo sicuro e efficace all'interno delle tue tabelle MySQL.

Quando si definiscono colonne generate in MySQL, è importante tenere conto del fatto che la maggior parte delle **espressioni deterministiche** e delle funzioni integrate sono **supportate**. Tuttavia, ci sono alcune funzioni integrate che potrebbero non essere supportate per motivi tecnici.

Se si tenta di utilizzare una funzione non supportata in un'espressione per una colonna generata, verrà generato un errore. Ad esempio, se si cerca di utilizzare una funzione non deterministica come **CURDATE()** in un'espressione per una colonna generata, verrà visualizzato un errore simile a quello riportato di seguito:

```
ERROR 1901 (HY000): Function or expression 'CURDATE()' cannot be used in the GENERATED
 ALWAYS AS clause
```

Questo errore indica che la funzione CURDATE() **non** può essere utilizzata nella clausola GENERATED ALWAYS AS per una colonna generata a causa della sua **natura non deterministica**.

Per evitare questo tipo di errore, è necessario assicurarsi di utilizzare solo espressioni deterministiche e funzioni integrate supportate nelle definizioni delle colonne generate. Questo garantirà che le colonne generate possano essere create correttamente e che le operazioni di inserimento, aggiornamento e query funzionino come previsto.
