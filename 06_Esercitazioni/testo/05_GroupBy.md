**Esercizio:**  

---

Importa i dati per l'esercitazione

- [Tabella](../../09_data/Studenti/studenti_table.sql)
- [Dati](../../09_data/Studenti/studenti_record.sql)

---

Scrivere le query SQL per ottenere i seguenti risultati:  

### **Database "Studenti"**  

1. **Conteggio degli studenti per genere:**  
   - Attributi della tabella risultante:  
     - `Genere`, `Quanti`.  

2. **Conteggio degli studenti per genere nella provincia di Alessandria:**  
   - Attributi della tabella risultante:  
     - `Genere`, `Quanti`.  

3. **Conteggio degli studenti per regione:**  
   - Attributi della tabella risultante:  
     - `Regione`, `Quanti`.  

4. **Conteggio degli studenti per regione e per genere:**  
   - Attributi della tabella risultante:  
     - `Regione`, `Genere`, `Quanti`.  

5. **Conteggio degli studenti per regione e per genere con totali aggregati:**  
   - Utilizzare la funzione `GROUPING()` e l'istruzione `WITH ROLLUP`.  
   - Attributi della tabella risultante (includere righe aggiuntive per subtotali e totale):  
     - `Regione`, `Genere`, `Quanti`.  

6. **Conteggio degli impiegati per ruolo:**  
   - Attributi della tabella risultante:  
     - `Ruolo`, `Quanti`.  

---

Importa i dati per l'esercitazione

- [Tabelle e dati](../../09_data/libreria)

---

### **Database "Libro"**  

8. **Conteggio degli autori per nazionalità:**  
   - Attributi della tabella risultante:  
     - `Nazionalità`, `Quanti`.  

9. **Conteggio dei libri per editore e valore totale dei libri:**  
   - Ordinare per `Editore`.  
   - Attributi della tabella risultante:  
     - `Editore`, `Quanti`, `Valore`.  
