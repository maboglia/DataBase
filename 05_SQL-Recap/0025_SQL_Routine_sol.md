# **💡 SQL Daily Routine - Esercizi**  

Questa routine ti guiderà nella pratica SQL attraverso esercizi basati su domande.  

### **1️⃣ Creazione Database e Utente**  

1. Crea un database chiamato `EsercizioSQL`.  
2. Crea un utente chiamato `'esercizio_user'` con password `'password123'`.  
3. Assegna a questo utente tutti i permessi su `EsercizioSQL`.  
4. Ricarica i permessi per rendere effettive le modifiche.  

---

### **2️⃣ Creazione Tabelle**  

Accedi al database `EsercizioSQL` con l'utente `esercizio_user` e risolvi questi esercizi:  

5. Crea una tabella `Clienti` con le seguenti colonne:  
   - `id_cliente`: intero, chiave primaria, auto-incremento  
   - `nome`: testo (massimo 50 caratteri), non nullo  
   - `email`: testo (massimo 100 caratteri), unico e non nullo  

6. Crea una tabella `Prodotti` con le seguenti colonne:  
   - `id_prodotto`: intero, chiave primaria, auto-incremento  
   - `nome`: testo (massimo 50 caratteri), non nullo  
   - `prezzo`: numero decimale con 10 cifre totali e 2 decimali, maggiore di 0  

7. Crea una tabella `Ordini` con le seguenti colonne:  
   - `id_ordine`: intero, chiave primaria, auto-incremento  
   - `id_cliente`: intero, chiave esterna che fa riferimento a `Clienti(id_cliente)`, con eliminazione a cascata  
   - `id_prodotto`: intero, chiave esterna che fa riferimento a `Prodotti(id_prodotto)`, con eliminazione a cascata  
   - `quantita`: intero, non nullo e maggiore di 0  
   - `data_ordine`: data e ora, con valore predefinito alla data e ora corrente  

---

### **3️⃣ Inserimento Dati (DML - INSERT)**  

8. Inserisci almeno due clienti nella tabella `Clienti`.  
9. Inserisci almeno due prodotti nella tabella `Prodotti`.  
10. Inserisci almeno due ordini nella tabella `Ordini`.  

---

### **4️⃣ Query di Lettura (SELECT Avanzate)**  

11. Mostra tutti gli ordini con i dettagli del cliente e del prodotto.  
12. Conta quanti ordini ha effettuato ogni cliente.  
13. Mostra solo i clienti che hanno effettuato più di un ordine.  
14. Calcola il totale speso da ogni cliente.  

---

### **5️⃣ Update e Delete con Vincoli**  

15. Aggiorna il prezzo del prodotto `"Laptop"` portandolo a `1300.00`.  
16. Prova a eliminare un cliente che ha ordini associati. Cosa succede?  
17. Elimina un ordine specifico dalla tabella `Ordini`.  

---

### **6️⃣ Test dei Vincoli (FOREIGN KEY, CHECK)**  

18. Prova a inserire un ordine con una quantità negativa. Il database lo permette? Perché?  

---

### **7️⃣ Eliminazione Dati, Tabelle e Database**  

19. Elimina tutti gli ordini dalla tabella `Ordini`.  
20. Elimina la tabella `Ordini`, seguita dalle tabelle `Clienti` e `Prodotti`.  
21. Rimuovi l'utente `'esercizio_user'`.  
22. Elimina il database `EsercizioSQL`.  

---

### **💡 Conclusione**  

Questa routine ti aiuterà a:  
✔ Creare e gestire database e utenti  
✔ Definire tabelle con chiavi primarie ed esterne  
✔ Inserire, aggiornare ed eliminare dati con vincoli  
✔ Eseguire query avanzate con JOIN e GROUP BY  
✔ Testare vincoli di integrità referenziale  

Buon allenamento con SQL! 🚀
