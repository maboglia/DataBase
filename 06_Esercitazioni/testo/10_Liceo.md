# Esercitazione Database Liceo

---

1. **Creare il database `liceo`.**

2. **Assegnare i privilegi all'utente `app_java` per questo nuovo database.**

3. **Nel database `liceo` creare 2 tabelle: `aule` e `alunni`:**
   - La tabella `aule` deve avere i seguenti attributi:
     - `nome`: nome dell’aula (obbligatorio).
     - `capienza`: numero massimo di studenti (obbligatorio).
     - `piano`: piano in cui si trova l’aula (obbligatorio).

   - La tabella `alunni` deve avere i seguenti attributi:
     - `cognome`: cognome dell’alunno (obbligatorio).
     - `nome`: nome dell’alunno (obbligatorio).
     - `genere`: genere dell’alunno.
     - `eta`: età dell’alunno.
     - `aula_id`: riferimento all’aula (chiave esterna).

4. **Inserire i record nella tabella `aule`:**
   - Le aule disponibili sono: 1A, 2A, 3A, 4A, 5A, 1B, 2B, 3B, 4B, 5B.
   - Ogni aula ha una capienza di 10 studenti.
   - I piani disponibili sono: 1° piano, 2° piano, seminterrato.

5. **Popolare la tabella `alunni` con 50 record:**
   - Copiare i dati dalla tabella `studenti` utilizzando l’istruzione `INSERT INTO ... SELECT`.
   - Aggiornare il campo `eta` con i seguenti valori:
     - 14 anni per i record con `id` da 1 a 10.
     - 15 anni per i record con `id` da 11 a 20.
     - 16 anni per i record con `id` da 21 a 30.
     - 17 anni per i record con `id` da 31 a 40.
     - 18 anni per i record con `id` da 41 a 50.

6. **Assegnare le aule agli alunni:**
   - Ogni aula deve avere 5 studenti della stessa età:
     - 5 studenti di 14 anni assegnati alla classe 1A.
     - 5 studenti di 15 anni assegnati alla classe 2A.
     - 5 studenti di 16 anni assegnati alla classe 3A.
     - 5 studenti di 17 anni assegnati alla classe 4A.
     - 5 studenti di 18 anni assegnati alla classe 5A.

7. **Dopo aver creato le tabelle e inserito i record, scrivere le query per:**
   - Selezionare il cognome, il nome, il genere e il piano aula di tutti gli studenti.
   - Selezionare il cognome, il nome, il genere e il piano aula degli studenti assegnati alle seguenti classi:
     - 1A
     - 2A
     - 3A
     - 4A
     - 5A

---

*Nota: Scrivere nel file SQL tutte le istruzioni necessarie per la creazione delle tabelle, l’inserimento dei record e le query di selezione.*
