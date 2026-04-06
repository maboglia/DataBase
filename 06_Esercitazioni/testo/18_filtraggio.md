# **10 esercizi SQL sul filtraggio con clausole** 

- WHERE, AND, OR, BETWEEN, IN, LIKE, IS NULL, HAVING

---

# 📌 Tabelle (stesso scenario)

### **STUDENTI**(id_studente, nome, cognome, classe)

### **CORSI**(id_corso, nome_corso, id_docente)

### **DOCENTI**(id_docente, nome, cognome)

### **ISCRIZIONI**(id_studente, id_corso, data_iscrizione)

### **ESAMI**(id_esame, id_studente, id_corso, voto, data_esame)

---

# ✅ 10 esercizi SQL sul FILTRAGGIO

---

## **1) WHERE semplice**

Visualizzare tutti gli studenti della classe `"3A"`.

---

## **2) WHERE con AND**

Visualizzare gli studenti della classe `"4B"` con cognome `"Rossi"`.

---

## **3) WHERE con OR**

Visualizzare gli studenti che appartengono alla classe `"3A"` **oppure** `"3B"`.

---

## **4) BETWEEN**

Visualizzare tutti gli esami con voto compreso tra **18 e 24**.

---

## **5) IN**

Visualizzare gli studenti che appartengono alle classi: `"2A"`, `"2B"`, `"2C"`.

---

## **6) LIKE (ricerca parziale)**

Visualizzare gli studenti il cui cognome inizia per `"Mar"`.

---

## **7) LIKE con contenuto interno**

Visualizzare i corsi che contengono la parola `"Programmazione"` nel nome.

---

## **8) IS NULL**

Visualizzare i corsi che non hanno docente assegnato (`id_docente` nullo).

---

## **9) WHERE su data**

Visualizzare le iscrizioni effettuate dopo il `2024-01-01`.

---

## **10) HAVING (filtraggio dopo GROUP BY)**

Trovare i corsi che hanno una media voti maggiore di **26**.

📌 Serve JOIN con ESAMI + GROUP BY + HAVING.

