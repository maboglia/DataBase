### **Esercitazione: Progettazione di un Database per la Gestione di un Sistema di Vendita e Clienti**  

Si vuole realizzare una base di dati per la gestione delle attività di un sistema di vendita che include prodotti, clienti, ordini e fornitori.  

---

### **📌 Specifiche del Database**

#### **🔹 1. Prodotti**  

Ogni prodotto è identificato da un codice univoco e possiede un nome, una descrizione, un prezzo e una quantità disponibile in magazzino. Inoltre, ogni prodotto appartiene a una categoria.  
**Attributi:**  

- **Codice prodotto** (univoco)  
- **Nome**  
- **Descrizione**  
- **Prezzo**  
- **Quantità disponibile**  
- **Codice categoria** (chiave esterna)  

📌 **Tabella Relazionale:**  
**Categorie**  

- **Codice categoria** (univoco)  
- **Nome categoria**  

---

#### **🔹 2. Clienti**  

I clienti sono identificati da un codice univoco e sono caratterizzati dal nome, cognome, email, numero di telefono e indirizzo.  
**Attributi:**  

- **Codice cliente** (univoco)  
- **Nome**  
- **Cognome**  
- **Email**  
- **Numero di telefono**  
- **Indirizzo**  

---

#### **🔹 3. Ordini**  

I clienti possono effettuare ordini per acquistare prodotti. Ogni ordine è identificato da un codice univoco e registra il cliente, la data dell’ordine e il totale dell'importo. Un ordine può contenere più prodotti con quantità specifiche.  
**Attributi:**  

- **Codice ordine** (univoco)  
- **Codice cliente** (chiave esterna)  
- **Data ordine**  
- **Totale importo**  

📌 **Tabella Relazionale:**  
**Dettaglio Ordini**  

- **Codice ordine** (chiave esterna)  
- **Codice prodotto** (chiave esterna)  
- **Quantità**  
- **Prezzo unitario**  

---

#### **🔹 4. Fornitori**  

I fornitori forniscono prodotti all’azienda. Ogni fornitore è identificato da un codice univoco e possiede un nome, un indirizzo, una città, un numero di telefono e un'email.  
**Attributi:**  

- **Codice fornitore** (univoco)  
- **Nome**  
- **Indirizzo**  
- **Città**  
- **Numero di telefono**  
- **Email**  

📌 **Tabella Relazionale:**  
**Prodotti forniti**  

- **Codice fornitore** (chiave esterna)  
- **Codice prodotto** (chiave esterna)  
- **Prezzo di acquisto**  

---

#### **🔹 5. Pagamenti**  

I clienti possono pagare gli ordini con diverse modalità. Ogni pagamento è identificato da un codice univoco e registra l’ordine associato, l’importo e il metodo di pagamento utilizzato.  
**Attributi:**  

- **Codice pagamento** (univoco)  
- **Codice ordine** (chiave esterna)  
- **Importo pagato**  
- **Metodo di pagamento** (es. Carta di credito, PayPal, Bonifico)  
- **Data pagamento**  

---

#### **🔹 6. Spedizioni**  

Una volta effettuato un ordine, l’azienda organizza la spedizione del pacco. Ogni spedizione è identificata da un codice univoco e registra l’ordine associato, il corriere, il codice di tracciamento e la data di consegna prevista.  
**Attributi:**  

- **Codice spedizione** (univoco)  
- **Codice ordine** (chiave esterna)  
- **Corriere**  
- **Codice di tracciamento**  
- **Data prevista di consegna**  
- **Data effettiva di consegna** (può essere NULL se il pacco non è stato ancora consegnato)  

---

### **📌 Relazioni tra le Tabelle**

| **Tabella** | **Relazioni** |
|------------|-------------|
| **Prodotti** | Appartengono a una categoria, possono essere forniti da più fornitori e possono comparire in più ordini |
| **Clienti** | Possono effettuare più ordini |
| **Ordini** | Sono associati a un cliente e contengono più prodotti |
| **Fornitori** | Possono fornire più prodotti |
| **Pagamenti** | Sono associati a un ordine |
| **Spedizioni** | Sono associate a un ordine e a un corriere |

---

### **📌 Considerazioni Finali**

- **Chiavi primarie** per identificare univocamente ogni record (es. codice prodotto, codice ordine, codice cliente).  
- **Chiavi esterne** per collegare le tabelle tra loro (es. codice cliente negli ordini, codice ordine nei pagamenti).  
- **Tabelle di relazione** per gestire prodotti forniti, dettagli ordini e spedizioni.  

📌 **Questo schema garantisce un sistema efficiente per la gestione dei prodotti, clienti, ordini e fornitori!**  

---

### **Fase Operativa**

1. **Progettazione della struttura del database**: Definire le tabelle, le chiavi primarie e le relazioni tra le entità.  
2. **Vincoli di integrità**: Assicurarsi che i vincoli (ad es. quantità disponibile, importo pagato, data di consegna) siano rispettati.  
3. **Popolamento del database**: Inserire dati di esempio per testare il funzionamento del database.  

---

### **Query di Test**

1. **Elencare tutti i prodotti disponibili con relativa categoria e quantità in magazzino**.  
2. **Trovare tutti gli ordini effettuati da un determinato cliente negli ultimi 6 mesi**.  
3. **Visualizzare i prodotti più venduti negli ultimi 3 mesi**.  
4. **Elencare tutti i fornitori che forniscono un determinato prodotto**.  
5. **Verificare quali ordini non sono ancora stati pagati**.  
6. **Elencare gli ordini che hanno subito ritardi nella consegna**.  
7. **Trovare il totale speso da un cliente in un determinato intervallo di tempo**.  
8. **Elencare tutti i clienti che hanno effettuato più di 5 ordini nell’ultimo anno**.  
9. **Visualizzare il numero di ordini per ogni categoria di prodotto**.  
10. **Trovare i clienti che hanno acquistato il maggior numero di prodotti diversi**.  

---

### **🔹 Test dei Vincoli di Integrità**  

Definire **5 query di test** per verificare il corretto funzionamento dei vincoli di integrità del database. Le query devono coprire i seguenti aspetti:  

1. **Verifica delle chiavi primarie e univocità**: Inserire un record duplicato e controllare che venga bloccato dal database.  
2. **Vincoli di chiave esterna**: Provare a inserire un record che faccia riferimento a un valore inesistente in una chiave esterna e verificare che l’operazione fallisca.  
3. **Restrizioni su valori specifici (CHECK constraints)**: Tentare di inserire o aggiornare un campo con un valore non consentito (es. stato di un prestito, orario di disponibilità, importo negativo) e verificare il blocco dell’operazione.  
4. **Vincoli di cardinalità (LIMIT constraints)**: Eseguire operazioni che superano i limiti impostati, come il numero massimo di prestiti attivi, il numero di partecipanti a un evento o il limite di appuntamenti per medico in un giorno.  
5. **Restrizioni di eliminazione e aggiornamento (ON DELETE/ON UPDATE constraints)**: Provare a eliminare o aggiornare un record referenziato in altre tabelle e verificare il comportamento del database (cascata, restrizione, impostazione a NULL).  

📌 **Obiettivo**: Assicurarsi che i vincoli di integrità proteggano la consistenza dei dati e impediscano operazioni errate.

---

### **Valutazione dell’Esercitazione (30 punti totali)**  

- **Implementazione della struttura del database - 10 punti**  
- **Popolamento del database con dati di esempio - 5 punti**  
- **Definizione dei constraints: vincoli di integrità, check e chiavi - 5 punti**  
- **Scrittura di 10 query di interrogazione significative - 10 punti**  

---

### **Riepilogo Consegna**  

- Implementare il database come da specifiche.  
- Popolare le tabelle con dati di esempio.  
- Eseguire le query di test.  
- Sono possibili modifiche motivate della struttura dati.  
- Consegnare un file di testo/sql con tutte le istruzioni eseguite: **verifica_cognome.sql**  
- Consegnare un file compresso (zip) con il dump di struttura e dati del db: **dump_database_cognome.sql**  
