### **Esercitazione: Progettazione di un Database per la Gestione delle Biblioteche**  

Si vuole realizzare una base di dati per la gestione delle attività di una rete di biblioteche pubbliche.  

- **Biblioteche:**  
  Ogni biblioteca è identificata da un codice univoco e possiede un nome, un indirizzo e la città in cui si trova. Ogni biblioteca ha un elenco di numeri di telefono e un orario di apertura che varia in base al giorno della settimana. Occorre predisporre le tabelle relazionali per gestire numeri di telefono e orari di apertura delle varie biblioteche.

- **Libri:**  
  Ogni libro è identificato da un codice ISBN univoco e possiede un titolo, un autore, un genere letterario e un anno di pubblicazione. Un libro può essere presente in più copie all'interno della stessa biblioteca. Ogni copia è identificata da un numero univoco per biblioteca ed è caratterizzata dallo stato di conservazione (es. "Ottimo", "Buono", "Danneggiato"). Occorre predisporre le tabelle relazionali per gestire le copie dei libri nelle biblioteche permettendo di avere più copie nella stessa biblioteca e di segnalare lo stato di conservazione.

- **Utenti:**  
  Gli utenti della biblioteca sono identificati da un codice univoco e sono caratterizzati dal nome, cognome, data di nascita e numero di cellulare. Ogni utente può essere iscritto a più biblioteche. Occorre predisporre le tabelle relazionali.

- **Prestiti:**  
  Gli utenti possono prendere in prestito i libri disponibili. Ogni prestito è identificato da un codice univoco e registra l’utente che ha preso il libro, la copia specifica del libro presa in prestito, la biblioteca di riferimento, la data di inizio prestito e la data di scadenza prevista. Quando il libro viene restituito, viene registrata anche la data di restituzione effettiva. Un utente non può prendere in prestito più di un certo numero di libri contemporaneamente (ad esempio, massimo 5). Gestire il limite di 5 prestiti attivi usando i trigger.

- **Prenotazioni:**  
  Se un libro non è disponibile, un utente può prenotarlo. Una prenotazione è identificata da un codice univoco e registra l’utente, la biblioteca presso cui è stata effettuata, il libro prenotato e la data della prenotazione. Se il libro diventa disponibile, la biblioteca notifica l'utente, che ha un tempo limitato per ritirarlo prima che venga reso nuovamente disponibile ad altri utenti.  

- **Eventi:**  
  Le biblioteche possono organizzare eventi culturali come presentazioni di libri, incontri con autori e laboratori di lettura. Ogni evento è identificato da un codice univoco e ha un titolo, una descrizione, una data e un orario. Ogni evento si tiene in una specifica biblioteca e può avere un numero massimo di partecipanti. Gli utenti possono iscriversi agli eventi fino al raggiungimento del limite massimo di posti disponibili.  

### **Obiettivo dell'esercitazione**  
Progettare il database che soddisfi questi requisiti, definendo le entità, le relazioni e i vincoli necessari per garantire la correttezza dei dati.
 
---

### **Struttura del Database**  

## **📌 Struttura del Database "Gestione Biblioteche"**  

Il database è strutturato per gestire biblioteche, libri, utenti, prestiti, prenotazioni ed eventi. Ogni entità è rappresentata da una tabella con i relativi attributi e relazioni.  

---

### **🔹 1. Biblioteche**  

Questa tabella memorizza le informazioni sulle biblioteche.  
**Attributi:**  

- **Codice biblioteca** (univoco)  
- **Nome**  
- **Indirizzo**  
- **Città**  

📌 **Tabelle Relazionali:**  

1. **Numeri di telefono biblioteca**  
   - Codice biblioteca (chiave esterna)  
   - Numero di telefono  

2. **Orari di apertura**  
   - Codice biblioteca (chiave esterna)  
   - Giorno della settimana  
   - Orario di apertura  
   - Orario di chiusura  

---

### **🔹 2. Libri**  

Questa tabella contiene le informazioni sui libri.  
**Attributi:**  

- **Codice ISBN** (univoco)  
- **Titolo**  
- **Autore**  
- **Genere letterario**  
- **Anno di pubblicazione**  

📌 **Tabella Relazionale:**  
**Copie dei libri**  

- **Codice copia** (univoco per biblioteca)  
- **Codice ISBN** (chiave esterna)  
- **Codice biblioteca** (chiave esterna)  
- **Stato di conservazione** ("Ottimo", "Buono", "Danneggiato")  

---

### **🔹 3. Utenti**  

Gli utenti iscritti alle biblioteche.  
**Attributi:**  

- **Codice utente** (univoco)  
- **Nome**  
- **Cognome**  
- **Data di nascita**  
- **Numero di cellulare**  

📌 **Tabella Relazionale:**  
**Iscrizioni alle biblioteche**  

- **Codice utente** (chiave esterna)  
- **Codice biblioteca** (chiave esterna)  

---

### **🔹 4. Prestiti**  

Registra i libri presi in prestito dagli utenti.  
**Attributi:**  

- **Codice prestito** (univoco)  
- **Codice utente** (chiave esterna)  
- **Codice copia** (chiave esterna)  
- **Codice biblioteca** (chiave esterna)  
- **Data inizio prestito**  
- **Data di scadenza prevista**  
- **Data di restituzione effettiva** (può essere NULL se il libro non è stato ancora restituito)  

📌 **Regole di gestione:**  

- Un utente può avere massimo **5 prestiti contemporanei** (controllato con trigger).  

---

### **🔹 5. Prenotazioni**  

Permette agli utenti di prenotare libri non disponibili.  
**Attributi:**  

- **Codice prenotazione** (univoco)  
- **Codice utente** (chiave esterna)  
- **Codice biblioteca** (chiave esterna)  
- **Codice ISBN** (chiave esterna)  
- **Data della prenotazione**  

📌 **Regole di gestione:**  

- Quando il libro diventa disponibile, la biblioteca notifica l'utente.  
- L'utente ha un tempo limitato per ritirarlo prima che venga reso disponibile ad altri.  

---

### **🔹 6. Eventi**  

Gestisce gli eventi organizzati nelle biblioteche.  
**Attributi:**  

- **Codice evento** (univoco)  
- **Titolo**  
- **Descrizione**  
- **Data**  
- **Orario**  
- **Codice biblioteca** (chiave esterna)  
- **Numero massimo di partecipanti**  

📌 **Tabella Relazionale:**  
**Iscrizioni agli eventi**  

- **Codice utente** (chiave esterna)  
- **Codice evento** (chiave esterna)  

📌 **Regole di gestione:**  

- Un evento può avere un numero massimo di partecipanti.  

---

## **📌 Relazioni tra le Tabelle**

| **Tabella** | **Relazioni** |
|------------|-------------|
| **Biblioteche** | Ha più numeri di telefono e orari di apertura |
| **Libri** | Possono essere presenti in più copie in una biblioteca |
| **Copie dei libri** | Appartengono a una biblioteca e a un libro specifico |
| **Utenti** | Possono essere iscritti a più biblioteche |
| **Prestiti** | Collegano utenti, biblioteche e copie di libri |
| **Prenotazioni** | Collegano utenti, biblioteche e libri |
| **Eventi** | Collegati a una biblioteca e agli utenti iscritti |

---

## **📌 Considerazioni Finali**

- **Chiavi primarie** per identificare in modo univoco ogni record (es. codice biblioteca, codice utente, codice prestito).  
- **Chiavi esterne** per collegare le tabelle tra loro (es. codice biblioteca nelle copie dei libri, codice utente nei prestiti).  
- **Tabelle di relazione** per gestire le iscrizioni alle biblioteche, le copie dei libri, i prestiti, le prenotazioni e le iscrizioni agli eventi.  

📌 **Questo schema garantisce una gestione efficiente delle biblioteche, dei libri e delle attività connesse!** 

---

### **Fase Operativa**  

1. **Progettazione della struttura del database**: Definire le tabelle, le chiavi primarie e le relazioni tra le entità.  
2. **Vincoli di integrità**: Assicurarsi che i vincoli (ad es. massimo numero di prestiti per utente, disponibilità delle copie, capienza eventi) siano rispettati.  
3. **Popolamento del database**: Inserire dati di esempio per testare il funzionamento del database.  

---

### **Query di Test**  

1. **Elencare tutti i libri disponibili in una specifica biblioteca**.  
  
2. **Trovare gli utenti con più di 3 libri in prestito attualmente**.  

3. **Elencare i prestiti attivi di un determinato utente**.  

4. **Elencare tutti gli eventi in una specifica biblioteca ordinati per data**.  

5. **Verificare quali libri hanno il maggior numero di prenotazioni**.  

6. **Trovare i libri più frequentemente prestati nell’ultimo anno**.  

7. **Elencare le biblioteche con il maggior numero di prestiti attivi**.  

8. **Visualizzare gli utenti iscritti a più di una biblioteca**.  

9. **Trovare i libri danneggiati presenti in una biblioteca specifica**.  

10. **Trovare gli eventi con più iscritti e verificare se hanno ancora posti disponibili**.  

---

### **Valutazione dell’esercitazione (30 punti totali)**  

- **Implementazione della struttura del database - 10 punti**  
- **Popolamento del database con dati di esempio - 5 punti**  
- **Definizione dei constraints: vincoli di integrità, check e chiavi - 5 punti**  
- **Scrittura di 10 query di interrogazione significative - 10 punti**  

---

**Riepilogo Consegna:**  

- Implementare il database come da specifiche
- popolare le tabelle con dati di esempio
- eseguire le query di test
- sono possibili modifiche motivate della struttura dati
- consegnare un file di testo/sql con tutte le istruzioni eseguite: verifica_cognome.sql
- consegnare un file compresso (zip) con il dump di struttura e dati del db: dump_database_cognome.sql
