### **Esercitazione: Progettazione di un Database per la Gestione delle Biblioteche**  

Si vuole realizzare una base di dati per la gestione delle attività di una rete di biblioteche pubbliche.  

- **Biblioteche:**  
  Ogni biblioteca è identificata da un codice univoco e possiede un nome, un indirizzo e la città in cui si trova. Ogni biblioteca ha un elenco di numeri di telefono e un orario di apertura che varia in base al giorno della settimana.  

- **Libri:**  
  Ogni libro è identificato da un codice ISBN univoco e possiede un titolo, un autore, un genere letterario e un anno di pubblicazione. Un libro può essere presente in più copie all'interno della stessa biblioteca. Ogni copia è identificata da un numero univoco per biblioteca ed è caratterizzata dallo stato di conservazione (es. "Ottimo", "Buono", "Danneggiato").  

- **Utenti:**  
  Gli utenti della biblioteca sono identificati da un codice univoco e sono caratterizzati dal nome, cognome, data di nascita e numero di cellulare. Ogni utente può essere iscritto a più biblioteche.  

- **Prestiti:**  
  Gli utenti possono prendere in prestito i libri disponibili. Ogni prestito è identificato da un codice univoco e registra l’utente che ha preso il libro, la copia specifica del libro presa in prestito, la biblioteca di riferimento, la data di inizio prestito e la data di scadenza prevista. Quando il libro viene restituito, viene registrata anche la data di restituzione effettiva. Un utente non può prendere in prestito più di un certo numero di libri contemporaneamente (ad esempio, massimo 5).  

- **Prenotazioni:**  
  Se un libro non è disponibile, un utente può prenotarlo. Una prenotazione è identificata da un codice univoco e registra l’utente, la biblioteca presso cui è stata effettuata, il libro prenotato e la data della prenotazione. Se il libro diventa disponibile, la biblioteca notifica l'utente, che ha un tempo limitato per ritirarlo prima che venga reso nuovamente disponibile ad altri utenti.  

- **Eventi:**  
  Le biblioteche possono organizzare eventi culturali come presentazioni di libri, incontri con autori e laboratori di lettura. Ogni evento è identificato da un codice univoco e ha un titolo, una descrizione, una data e un orario. Ogni evento si tiene in una specifica biblioteca e può avere un numero massimo di partecipanti. Gli utenti possono iscriversi agli eventi fino al raggiungimento del limite massimo di posti disponibili.  

### **Obiettivo dell'esercitazione**  
Progettare il database che soddisfi questi requisiti, definendo le entità, le relazioni e i vincoli necessari per garantire la correttezza dei dati.
 
---

### **Struttura del Database**  

- **Biblioteche:**  
  - Identificate da un codice univoco.  
  - Nome, indirizzo, città.  
  - Numeri di telefono.  
  - Orari di apertura settimanali.  

- **Libri:**  
  - Identificati da codice ISBN univoco.  
  - Titolo, autore, genere, anno di pubblicazione.  
  - Ogni copia ha un codice univoco per biblioteca e uno stato di conservazione.  

- **Utenti:**  
  - Identificati da un codice univoco.  
  - Nome, cognome, data di nascita, numero di cellulare.  
  - Iscrizioni a più biblioteche.  

- **Prestiti:**  
  - Identificati da un codice univoco.  
  - Associano un utente a una copia di un libro in una biblioteca.  
  - Data di inizio, data di scadenza, data di restituzione.  
  - Un utente può avere un numero massimo di prestiti attivi.  

- **Prenotazioni:**  
  - Identificate da un codice univoco.  
  - Associano un utente a un libro in una biblioteca.  
  - Data di prenotazione.  

- **Eventi:**  
  - Identificati da un codice univoco.  
  - Titolo, descrizione, data, orario.  
  - Biblioteca in cui si svolge.  
  - Numero massimo di partecipanti.  
  - Gli utenti possono iscriversi fino al limite massimo.  

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

- **Progettazione della struttura del database (schema relazionale con tabelle e relazioni) - 10 punti**  
- **Definizione dei vincoli di integrità e chiavi - 5 punti**  
- **Popolamento del database con dati di esempio - 5 punti**  
- **Scrittura di 10 query di interrogazione significative - 10 punti**  

---

**Consegna:**  
Realizzare il database, popolandolo con dati di esempio, ed eseguire almeno 5 query di test. Inviare un report con lo schema del database, le query e i risultati ottenuti.