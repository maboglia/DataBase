**Esercizio:**  

---

Importa i dati per l'esercitazione

- [Tabella](../../09_data/Corsi/db_corsi.sql)
- [Dati](../../09_data/Corsi/db_corsi_dati.sql)

---

**Esercizio:**  

Scrivere le query SQL utilizzando **sintassi JOIN** per soddisfare i seguenti requisiti:  

### Docenti e Corsi  

1. **Informazioni sui docenti e i corsi che insegnano:**  
   - Cognome, Nome, Email dei docenti.  
   - Titolo del corso insegnato.  
   - Ordinare per Cognome e Nome.  

2. **Docenti e corsi economici:**  
   - Cognome, Nome, Email dei docenti.  
   - Titolo dei corsi che costano meno di 200€ (esclusi).  
   - Ordinare per Cognome e Nome.  

3. **Docente del corso HTML:**  
   - Cognome, Nome, Email del docente.  
   - Corso: HTML.  

4. **Docenti e corsi (inclusi quelli senza assegnazione):**  
   - Cognome, Nome, Email dei docenti.  
   - Titolo del corso insegnato.  
   - Mostrare anche i docenti che non hanno corsi assegnati (**outer join**).  
   - Ordinare per Titolo, Cognome e Nome.  

5. **Corsi e docenti (inclusi quelli senza assegnazione):**  
   - Cognome, Nome, Email dei docenti.  
   - Titolo dei corsi insegnati.  
   - Mostrare anche i corsi che non hanno docenti assegnati (**outer join**).  
   - Ordinare per Titolo, Cognome e Nome.  

6. **Docenti senza corsi assegnati:**  
   - Cognome, Nome, Email.  
   - Mostrare solo i docenti che non hanno corsi assegnati (**outer join**).  
   - Ordinare per Cognome e Nome.  

7. **Corsi senza docenti assegnati:**  
   - Titolo dei corsi.  
   - Mostrare solo i corsi che non hanno docenti assegnati (**outer join**).  
   - Ordinare per Titolo.  

---

### Studenti, Corsi e Iscrizioni  

8. **Studenti e corsi frequentati:**  
   - Cognome, Nome, Email degli studenti.  
   - Titolo del corso a cui sono iscritti.  
   - Ordinare per Titolo, Cognome e Nome.  

9. **Studenti iscritti al corso di Java:**  
   - Cognome, Nome, Email degli studenti.  
   - Corso: Java.  
   - Ordinare per Cognome e Nome.  

10. **Studenti e corsi costosi:**  
    - Cognome, Nome, Email degli studenti.  
    - Corsi a cui sono iscritti con un costo pari o superiore a 200€.  
    - Ordinare per Cognome e Nome.  

11. **Studenti e corsi (inclusi non iscritti):**  
    - Cognome, Nome, Email degli studenti.  
    - Titolo del corso a cui sono iscritti.  
    - Mostrare anche gli studenti che non sono iscritti a corsi (**outer join**).  
    - Ordinare per Titolo, Cognome e Nome.  

12. **Corsi e iscritti (inclusi corsi senza studenti):**  
    - Cognome, Nome, Email degli studenti.  
    - Titolo del corso a cui sono iscritti.  
    - Mostrare anche i corsi che non hanno iscritti (**outer join**).  
    - Ordinare per Titolo, Cognome e Nome.  

13. **Studenti non iscritti a corsi:**  
    - Cognome, Nome, Email.  
    - Mostrare solo gli studenti che non sono iscritti a corsi (**outer join**).  
    - Ordinare per Cognome e Nome.  

14. **Corsi senza iscritti:**  
    - Titolo dei corsi.  
    - Mostrare solo i corsi che non hanno iscritti (**outer join**).  
    - Ordinare per Titolo.  
