# **10 esercizi su SQL JOIN** 

---

## **Scenario (tabelle)**

Immagina queste tabelle:

### **STUDENTI**

* id_studente (PK)
* nome
* cognome
* classe

### **CORSI**

* id_corso (PK)
* nome_corso
* id_docente (FK)

### **DOCENTI**

* id_docente (PK)
* nome
* cognome

### **ISCRIZIONI**

* id_studente (FK)
* id_corso (FK)
* data_iscrizione

### **ESAMI**

* id_esame (PK)
* id_studente (FK)
* id_corso (FK)
* voto
* data_esame

---

# ✅ 10 Esercizi SQL JOIN

---

## **1) INNER JOIN semplice**

Visualizzare l’elenco degli studenti con i corsi a cui sono iscritti.

📌 Output: nome studente, cognome, nome corso.

---

## **2) INNER JOIN con 3 tabelle**

Visualizzare per ogni iscrizione:

* nome studente
* nome corso
* data iscrizione

(usando STUDENTI + ISCRIZIONI + CORSI)

---

## **3) JOIN con DOCENTI**

Elencare tutti i corsi con il docente associato.

📌 Output: nome corso, nome docente, cognome docente.

---

## **4) JOIN con filtro**

Elencare tutti gli studenti iscritti al corso "Database".

---

## **5) LEFT JOIN**

Elencare tutti gli studenti, anche quelli che **non sono iscritti a nessun corso**.

📌 Output: nome, cognome, nome corso (se presente).

---

## **6) RIGHT JOIN (o alternativa con LEFT JOIN)**

Elencare tutti i corsi, anche quelli che non hanno iscritti.

📌 Output: nome corso, nome studente (se presente).

---

## **7) Conteggio con JOIN + GROUP BY**

Contare quanti studenti sono iscritti a ciascun corso.

📌 Output: nome corso, numero iscritti.

---

## **8) JOIN + ESAMI**

Visualizzare tutti gli esami sostenuti con:

* studente
* corso
* voto
* data esame

---

## **9) JOIN con condizione su voto**

Visualizzare gli studenti che hanno preso un voto >= 28, indicando corso e voto.

---

## **10) Query completa (JOIN + GROUP BY + HAVING)**

Trovare i corsi che hanno **almeno 5 iscritti**.

📌 Output: nome corso, numero iscritti.

