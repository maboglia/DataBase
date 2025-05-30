

## Database

Tabella P -> Prodotti

Campi -> 
- CodP (PK)
- NomeP
- Colore
- Taglia
- Magazzino

Tabella F -> Fornitori

- CodF (PK)
- NomeF
- NSoci
- Sede

Tabella FP -> FornitoriProdotti

- CodF (FK)
- CodP (FK)
- Qta

### Esercizi

- Trovare la taglia e il nome dei prodotti di colore rosso o giallo
- Trovare la taglia e il nome dei prodotti di colore rosso e taglia maggiore di 42
- Trovare il codice dei fornitori che forniscono almeno un prodotto
- Trovare il codice dei fornitori che forniscono almeno un prodotto rosso
- Trovare il nome dei fornitori che forniscono almeno un prodotto rosso
- Trovare il nome dei fornitori di Torino che forniscono almeno un prodotto rosso
- Trovare il nome dei fornitori che forniscono almeno un prodotto diverso da P2
- Trovare il codice dei fornitori che forniscono almeno due prodotti diversi

### Soluzioni

Ecco le soluzioni agli esercizi utilizzando l'algebra relazionale:

---

### 1. Trovare la taglia e il nome dei prodotti di colore rosso o giallo
\[
\pi_{\text{Taglia, NomeP}} (\sigma_{\text{Colore = 'Rosso'} \lor \text{Colore = 'Giallo'}}(P))
\]

---

### 2. Trovare la taglia e il nome dei prodotti di colore rosso e taglia maggiore di 42
\[
\pi_{\text{Taglia, NomeP}} (\sigma_{\text{Colore = 'Rosso'} \land \text{Taglia > 42}}(P))
\]

---

### 3. Trovare il codice dei fornitori che forniscono almeno un prodotto
\[
\pi_{\text{CodF}}(FP)
\]

---

### 4. Trovare il codice dei fornitori che forniscono almeno un prodotto rosso
\[
\pi_{\text{CodF}} (\sigma_{\text{Colore = 'Rosso'}}(P) \bowtie P.\text{CodP} = FP.\text{CodP})
\]

---

### 5. Trovare il nome dei fornitori che forniscono almeno un prodotto rosso
\[
\pi_{\text{NomeF}} (\sigma_{\text{Colore = 'Rosso'}}(P) \bowtie P.\text{CodP} = FP.\text{CodP} \bowtie FP.\text{CodF} = F.\text{CodF})
\]

---

### 6. Trovare il nome dei fornitori di Torino che forniscono almeno un prodotto rosso
\[
\pi_{\text{NomeF}} (\sigma_{\text{Colore = 'Rosso'}}(P) \bowtie P.\text{CodP} = FP.\text{CodP} \bowtie FP.\text{CodF} = F.\text{CodF} \land \text{Sede = 'Torino'})
\]

---

### 7. Trovare il nome dei fornitori che forniscono almeno un prodotto diverso da \( P2 \)
\[
\pi_{\text{NomeF}} (\sigma_{P.\text{CodP} \neq 'P2'}(P) \bowtie P.\text{CodP} = FP.\text{CodP} \bowtie FP.\text{CodF} = F.\text{CodF})
\]

---

### 8. Trovare il codice dei fornitori che forniscono almeno due prodotti diversi
\[
\pi_{\text{CodF}} (\rho_{R1}(\text{FP}) \bowtie_{R1.\text{CodF} = FP.\text{CodF} \land R1.\text{CodP} \neq FP.\text{CodP}} FP)
\]  
L'operatore \(\rho_{R1}(\text{FP})\) rinomina la tabella \(FP\) in \(R1\) per eseguire un auto-join, verificando che un fornitore abbia almeno due prodotti diversi.


---

## Come si leggono

Ecco come leggere i risultati delle espressioni di algebra relazionale:

---

### 1. **Trovare la taglia e il nome dei prodotti di colore rosso o giallo**  

"Seleziona i prodotti in cui il colore è 'Rosso' oppure 'Giallo', quindi estrai le colonne 'Taglia' e 'NomeP'."

---

### 2. **Trovare la taglia e il nome dei prodotti di colore rosso e taglia maggiore di 42**  

"Seleziona i prodotti in cui il colore è 'Rosso' e la taglia è maggiore di 42, quindi estrai le colonne 'Taglia' e 'NomeP'."

---

### 3. **Trovare il codice dei fornitori che forniscono almeno un prodotto**  

"Estrai tutti i codici dei fornitori dalla tabella 'FP', che contiene le associazioni tra fornitori e prodotti."

---

### 4. **Trovare il codice dei fornitori che forniscono almeno un prodotto rosso**  

"Seleziona i prodotti di colore 'Rosso' dalla tabella 'P', uniscili ai fornitori nella tabella 'FP' in base al codice prodotto, ed estrai i codici dei fornitori."

---

### 5. **Trovare il nome dei fornitori che forniscono almeno un prodotto rosso**  

"Seleziona i prodotti di colore 'Rosso', uniscili ai fornitori nella tabella 'FP' e poi alla tabella 'F' in base ai codici corrispondenti, quindi estrai i nomi dei fornitori."

---

### 6. **Trovare il nome dei fornitori di Torino che forniscono almeno un prodotto rosso**  

"Seleziona i prodotti di colore 'Rosso', uniscili ai fornitori nella tabella 'FP' e poi alla tabella 'F', filtrando solo i fornitori con sede a Torino, ed estrai i nomi."

---

### 7. **Trovare il nome dei fornitori che forniscono almeno un prodotto diverso da \( P2 \)**  

"Seleziona i prodotti diversi da \( P2 \) dalla tabella 'P', uniscili alla tabella 'FP' e poi alla tabella 'F', quindi estrai i nomi dei fornitori."

---

### 8. **Trovare il codice dei fornitori che forniscono almeno due prodotti diversi**  

"Effettua un auto-join della tabella 'FP' su sé stessa per trovare i fornitori con almeno due prodotti diversi, confrontando i codici prodotto. Estrarre i codici dei fornitori risultanti."

