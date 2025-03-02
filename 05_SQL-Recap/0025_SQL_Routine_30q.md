# **💪 SQL Daily Routine - Esercizi (30 punti)**  

Questa routine ti guiderà passo dopo passo nella pratica SQL, dalla creazione del database fino a query avanzate con stored procedure, funzioni e trigger.  

---

### **1️⃣ Creazione Database e Utente**  

1. Crea un database chiamato `EsercizioSQL`.  
2. Crea un utente chiamato `esercizio_user` con password `'password123'`.  
3. Assegna tutti i permessi all'utente sul database `EsercizioSQL`.  
4. Ricarica i permessi con il comando appropriato.  

---

### **2️⃣ Creazione Tabelle**  

5. Crea la tabella `Clienti` con chiave primaria e vincoli di unicità.  
6. Crea la tabella `Prodotti` con il vincolo `CHECK` sul prezzo (maggiore di 0).  
7. Crea la tabella `Ordini` con chiavi esterne e vincoli `ON DELETE CASCADE`.  

---

### **3️⃣ Inserimento Dati (DML - INSERT)**  

8. Inserisci almeno 2 clienti nella tabella `Clienti`.  
9. Inserisci almeno 2 prodotti nella tabella `Prodotti`.  
10. Inserisci almeno 2 ordini nella tabella `Ordini`.  

---

### **4️⃣ Query di Lettura (SELECT Avanzate)**  

11. Elenca tutti gli ordini con i dettagli del cliente e del prodotto utilizzando i `JOIN`.  
12. Conta quanti ordini ha effettuato ogni cliente.  
13. Mostra solo i clienti che hanno effettuato più di un ordine.  
14. Calcola il totale speso da ogni cliente.  

---

### **5️⃣ Update e Delete con Vincoli**  

15. Aggiorna il prezzo del prodotto `"Laptop"` portandolo a `1300.00`.  
16. Prova a eliminare un cliente con ordini associati. Cosa succede?  
17. Elimina un ordine specifico utilizzando la chiave primaria.  

---

### **6️⃣ Test dei Vincoli (FOREIGN KEY, CHECK)**  

18. Prova a inserire un ordine con quantità negativa. Il database lo permette? Perché?  

---

### **7️⃣ Query con Subquery**  

19. Trova il nome e l'email di tutti i clienti che hanno effettuato almeno un ordine.  
20. Mostra i prodotti che sono stati acquistati più di una volta.  
21. Trova il nome del cliente che ha speso di più in totale.  
22. Mostra l'elenco dei prodotti che non sono mai stati ordinati.  

---

### **8️⃣ Stored Procedure**  

23. Crea una **stored procedure** chiamata `AggiungiOrdine` che accetta:  

- id_cliente  
- id_prodotto  
- quantità  

La procedura deve inserire un nuovo ordine solo se il prodotto è disponibile in giacenza.

---

### **9️⃣ Funzione Custom**  

24. Crea una funzione chiamata `CalcolaTotaleOrdine(id_ordine)` che restituisce il totale dell'ordine come quantità × prezzo unitario.  

---

### **🔟 Trigger**  

25. Crea un **trigger** che aggiorna la giacenza del prodotto ogni volta che viene inserito un nuovo ordine.  
Il trigger deve sottrarre la quantità ordinata dalla giacenza nella tabella `Prodotti`.  

---

### **1️⃣1️⃣ Query Avanzate con JOIN e Subquery**  

26. Mostra i clienti che hanno ordinato più prodotti diversi (utilizza una subquery).  
27. Trova il cliente che ha effettuato l'ordine di importo più alto.  
28. Conta il numero di prodotti diversi acquistati da ogni cliente.  
29. Elenca i prodotti disponibili con una quantità in giacenza inferiore alla quantità totale ordinata.  

---

### **1️⃣2️⃣ Eliminazione Dati, Tabelle e Database**  

30. Elimina:  

- Tutti gli ordini  
- Le tabelle  
- L'utente  
- Il database  

---

### **💪 Conclusione**  

Questa routine ora copre:  

✅ Creazione di database e utenti  
✅ Definizione di chiavi primarie e esterne  
✅ Operazioni DML  
✅ Vincoli di integrità referenziale  
✅ Query avanzate con `JOIN`, `GROUP BY`, `HAVING`, e subquery  
✅ Stored procedure, funzioni e trigger  
✅ Eliminazione sicura di dati e struttura  

---

### 🔥 BONUS  

👉 Crea una **view** che mostra il riepilogo degli ordini con:  

- Nome cliente  
- Nome prodotto  
- Quantità  
- Totale ordine  

---

### 💡 Suggerimento di Studio

- Prima di creare una stored procedure o funzione, assicurati di attivare il **DELIMITER** se il DB lo richiede.  
- Usa il comando `SHOW CREATE TABLE nome_tabella;` per visualizzare la struttura delle tabelle.

---

### 🏆 Se risolvi **tutti i 30 punti**, hai coperto circa il **70%** delle competenze richieste per una posizione junior SQL  

