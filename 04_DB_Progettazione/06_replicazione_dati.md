---
header: Fondamenti di basi di dati
marp: true
footer: Mauro Bogliaccino
---

# Replicazione dei Dati

La replicazione è una tecnica che coinvolge la creazione e la gestione di copie coerenti dei dati su più server, consentendo la distribuzione delle risorse e l'ottimizzazione delle prestazioni.

---

### Cos'è la Replicazione dei Dati

1. **Cos'è la Replicazione dei Dati
   - La replicazione è il processo di creazione e gestione di copie identiche di un database su più server o nodi. Questo consente di distribuire i dati su diverse posizioni geografiche o server, migliorando la disponibilità e le prestazioni.

---

### Scenari Comuni di Replicazione

2. **Scenari Comuni di Replicazione
   - **Replicazione di Lettura:** In questo scenario, una copia del database viene utilizzata principalmente per le operazioni di lettura, alleggerendo il carico di lavoro sul server principale dedicato alle scritture. È utile quando la maggior parte delle operazioni coinvolge la lettura dei dati.
   - **Replicazione di Bilanciamento del Carico:** La replicazione può essere utilizzata per distribuire il carico tra server, migliorando le prestazioni e garantendo una maggiore scalabilità.
   - **Replicazione Geografica:** Per garantire la disponibilità in caso di guasti o catastrofi, i dati possono essere replicati su server geograficamente distribuiti.

---

### Tipi di Replicazione

3. **Tipi di Replicazione
   - **Replicazione Snapshot:** Una copia completa del database viene replicata periodicamente su un server di destinazione. È adatta a scenari in cui le modifiche ai dati sono relativamente basse e la coerenza immediata non è una priorità.
   - **Replicazione Transazionale:** Vengono replicate solo le transazioni effettuate sul server di origine. Questo garantisce una maggiore coerenza ma può richiedere una connettività più affidabile tra i server.
   - **Replicazione di Merge:** Combina modifiche da più server in una copia consolidata del database. È utile in scenari in cui i dati vengono modificati su più server e successivamente consolidati.

---

### Consistenza e Coerenza

4. **Consistenza e Coerenza
   - È importante considerare il livello di consistenza e coerenza richiesto per i dati replicati. In alcuni casi, la coerenza immediata può essere essenziale, mentre in altri scenari la coerenza differita può essere accettabile.

---

### Gestione dei Conflitti

5. **Gestione dei Conflitti
   - Quando si replicano dati su più server, possono verificarsi conflitti, ad esempio quando più server cercano di modificare lo stesso dato contemporaneamente. È necessario implementare strategie per gestire questi conflitti, come l'applicazione di regole di risoluzione dei conflitti.

---

### Sicurezza nella Replicazione

6. **Sicurezza nella Replicazione
   - La sicurezza dei dati replicati è fondamentale. Deve essere garantito che le repliche siano accessibili solo da utenti autorizzati e che i dati siano trasferiti in modo sicuro tra i server.

---

### Monitoraggio e Manutenzione

7. **Monitoraggio e Manutenzione
   - La replicazione richiede monitoraggio continuo per garantire che tutte le repliche siano sincronizzate e che eventuali problemi siano rilevati e risolti tempestivamente. La manutenzione regolare può essere necessaria per ottimizzare le prestazioni del sistema di replicazione.

La replicazione dei dati è una potente strategia per migliorare la disponibilità, la scalabilità e le prestazioni dei database. Tuttavia, la sua implementazione richiede una pianificazione accurata e la considerazione di vari aspetti, come la coerenza, la sicurezza e la gestione dei conflitti.
