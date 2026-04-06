# **10 esercizi su SQL GROUP BY** 

---

# 📌 Tabelle disponibili

### **STUDENTI**

* id_studente
* nome
* cognome
* classe

### **CORSI**

* id_corso
* nome_corso
* id_docente

### **DOCENTI**

* id_docente
* nome
* cognome

### **ISCRIZIONI**

* id_studente
* id_corso
* data_iscrizione

### **ESAMI**

* id_esame
* id_studente
* id_corso
* voto
* data_esame

---

# ✅ 10 esercizi SQL su GROUP BY

---

## **1) Conteggio studenti per classe**

Contare quanti studenti ci sono in ogni classe.

📌 Output: classe, numero_studenti

---

## **2) Numero di corsi per docente**

Contare quanti corsi insegna ogni docente.

📌 Output: docente, numero_corsi

---

## **3) Numero iscritti per corso**

Contare quanti studenti sono iscritti a ciascun corso.

📌 Output: nome_corso, numero_iscritti

---

## **4) Media voti per studente**

Calcolare la media dei voti ottenuti da ciascuno studente.

📌 Output: studente, media_voti

---

## **5) Media voti per corso**

Calcolare la media dei voti per ciascun corso.

📌 Output: nome_corso, media_voti

---

## **6) Voto massimo per corso**

Trovare il voto massimo ottenuto in ogni corso.

📌 Output: nome_corso, voto_massimo

---

## **7) Numero esami sostenuti per studente**

Contare quanti esami ha sostenuto ogni studente.

📌 Output: studente, numero_esami

---

## **8) Numero iscrizioni per anno**

Contare quante iscrizioni sono state fatte per ogni anno.

📌 Suggerimento: usare YEAR(data_iscrizione)

📌 Output: anno, numero_iscrizioni

---

## **9) Studenti con almeno 3 esami sostenuti (HAVING)**

Trovare gli studenti che hanno sostenuto almeno 3 esami.

📌 Output: studente, numero_esami

⚠️ Richiede `HAVING`.

---

## **10) Classi con media voti superiore a 25**

Calcolare la media dei voti per ogni classe e mostrare solo quelle con media > 25.

📌 Output: classe, media_voti

⚠️ Richiede JOIN tra STUDENTI ed ESAMI + GROUP BY + HAVING.

