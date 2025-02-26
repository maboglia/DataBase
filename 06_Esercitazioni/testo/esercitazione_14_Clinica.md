### **Esercitazione: Progettazione di un Database per la Gestione di una Clinica Medica**  

Si vuole realizzare una base di dati per la gestione di una clinica medica, comprendente medici, pazienti, appuntamenti, trattamenti e fatturazione.  

---

### **📌 Specifiche del Database**

#### **🔹 1. Medici**  

Ogni medico è identificato da un codice univoco e possiede un nome, cognome, specializzazione, numero di telefono e indirizzo email.  
**Attributi:**  

- **Codice medico** (univoco)  
- **Nome**  
- **Cognome**  
- **Specializzazione**  
- **Numero di telefono**  
- **Email**  

📌 **Tabella Relazionale:**  
**Orari di disponibilità**  

- **Codice medico** (chiave esterna)  
- **Giorno della settimana**  
- **Orario di inizio**  
- **Orario di fine**  

---

#### **🔹 2. Pazienti**  

Ogni paziente è identificato da un codice univoco e possiede nome, cognome, data di nascita, numero di telefono e indirizzo.  
**Attributi:**  

- **Codice paziente** (univoco)  
- **Nome**  
- **Cognome**  
- **Data di nascita**  
- **Numero di telefono**  
- **Indirizzo**  

📌 **Tabella Relazionale:**  
**Cartella clinica**  

- **Codice paziente** (chiave esterna)  
- **Diagnosi**  
- **Trattamenti prescritti**  
- **Note mediche**  

---

#### **🔹 3. Appuntamenti**  

I pazienti possono prenotare appuntamenti con i medici. Ogni appuntamento è identificato da un codice univoco e registra il medico, il paziente, la data e l’ora dell’appuntamento e lo stato dell’appuntamento (es. "Prenotato", "Completato", "Annullato").  
**Attributi:**  

- **Codice appuntamento** (univoco)  
- **Codice paziente** (chiave esterna)  
- **Codice medico** (chiave esterna)  
- **Data e ora appuntamento**  
- **Stato appuntamento**  

---

#### **🔹 4. Trattamenti**  

Ogni trattamento medico eseguito è identificato da un codice univoco e possiede un nome, una descrizione, un costo e la durata prevista.  
**Attributi:**  

- **Codice trattamento** (univoco)  
- **Nome trattamento**  
- **Descrizione**  
- **Costo**  
- **Durata (minuti)**  

📌 **Tabella Relazionale:**  
**Trattamenti eseguiti**  

- **Codice appuntamento** (chiave esterna)  
- **Codice trattamento** (chiave esterna)  
- **Note aggiuntive**  

---

#### **🔹 5. Fatturazione**  

Ogni appuntamento completato genera una fattura. Ogni fattura è identificata da un codice univoco e registra il paziente, l'importo totale e la modalità di pagamento.  
**Attributi:**  

- **Codice fattura** (univoco)  
- **Codice paziente** (chiave esterna)  
- **Data emissione**  
- **Importo totale**  
- **Metodo di pagamento** (es. Contanti, Carta di Credito, Bonifico)  
- **Stato pagamento** (es. "Pagato", "In sospeso")  

---

#### **🔹 6. Farmaci prescritti**  

Durante un appuntamento, il medico può prescrivere farmaci a un paziente.  
**Attributi:**  

- **Codice prescrizione** (univoco)  
- **Codice paziente** (chiave esterna)  
- **Codice medico** (chiave esterna)  
- **Nome farmaco**  
- **Dosaggio**  
- **Durata della terapia**  

---

### **📌 Relazioni tra le Tabelle**

| **Tabella** | **Relazioni** |
|------------|-------------|
| **Medici** | Possono avere più appuntamenti e prescrivere farmaci |
| **Pazienti** | Possono avere più appuntamenti, cartelle cliniche e fatture |
| **Appuntamenti** | Collegano medici e pazienti, possono includere trattamenti e generare fatture |
| **Trattamenti** | Possono essere eseguiti in più appuntamenti |
| **Fatturazione** | È associata a un appuntamento completato e a un paziente |
| **Farmaci prescritti** | Sono associati a un medico e un paziente |

---

### **📌 Considerazioni Finali**

- **Chiavi primarie** per identificare in modo univoco ogni record (es. codice medico, codice paziente, codice appuntamento).  
- **Chiavi esterne** per collegare le tabelle tra loro (es. codice medico negli appuntamenti, codice paziente nelle fatture).  
- **Tabelle di relazione** per gestire cartelle cliniche, trattamenti e farmaci prescritti.  

📌 **Questo schema garantisce un sistema efficiente per la gestione delle prenotazioni, delle visite mediche e della fatturazione!**  

---

### **Fase Operativa**

1. **Progettazione della struttura del database**: Definire le tabelle, le chiavi primarie e le relazioni tra le entità.  
2. **Vincoli di integrità**: Assicurarsi che i vincoli (ad es. disponibilità del medico, stato del pagamento, durata dei trattamenti) siano rispettati.  
3. **Popolamento del database**: Inserire dati di esempio per testare il funzionamento del database.  

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

### **Query di Test**

1. **Elencare tutti i medici con la loro specializzazione e orari di disponibilità**.  
2. **Trovare tutti gli appuntamenti futuri prenotati per un determinato paziente**.  
3. **Visualizzare il numero di appuntamenti completati da ciascun medico negli ultimi 3 mesi**.  
4. **Elencare tutti i trattamenti eseguiti in un determinato intervallo di tempo**.  
5. **Verificare i pazienti con fatture non ancora pagate**.  
6. **Elencare i farmaci prescritti da un determinato medico**.  
7. **Trovare il totale incassato dalla clinica in un determinato periodo**.  
8. **Elencare i pazienti che hanno effettuato più visite nell'ultimo anno**.  
9. **Visualizzare i trattamenti più frequentemente eseguiti**.  
10. **Trovare i medici con il maggior numero di appuntamenti prenotati per il mese corrente**.  

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
