### **Guida Completa ad Amazon DynamoDB**
**Database NoSQL serverless per applicazioni scalabili**

---

Amazon DynamoDB è uno dei servizi di database NoSQL offerti da AWS, progettato per applicazioni altamente scalabili e performanti. Si tratta di un servizio **serverless**, completamente gestito, che offre una **bassa latenza**, alta disponibilità e funzionalità avanzate come la replica globale e la scalabilità automatica.

In questo articolo approfondiremo:
- Cos'è DynamoDB e come funziona
- Architettura e concetti di base
- Configurazione su AWS
- CRUD con DynamoDB (con esempi PHP e Node.js)
- Vantaggi e limiti
- Best practices
- Confronto con altri database NoSQL

---

## 🔑 **Cos'è Amazon DynamoDB?**

Amazon DynamoDB è un database **NoSQL documentale e key-value** offerto da AWS, progettato per applicazioni ad alte prestazioni e con grandi volumi di dati.

✅ **Principali Caratteristiche:**
- Database completamente gestito (serverless)
- Scalabilità automatica in lettura e scrittura
- Replica automatica su più zone di disponibilità
- Latenza <10 ms in lettura/scrittura
- Sicurezza integrata con AWS IAM
- Backup automatici e point-in-time recovery
- Supporto per transazioni ACID (dal 2018)
- Eventi di stream per l'integrazione con **AWS Lambda**

---

### **Quando Usare DynamoDB?**

| Caso d'uso                    | DynamoDB è adatto? |
|--------------------------------|------------------|
| Applicazioni web serverless    | ✅ Sì            |
| Microservizi                  | ✅ Sì            |
| Cache persistente             | ✅ Sì            |
| IoT e Big Data                | ✅ Sì            |
| Transazioni finanziarie        | ⚠️ Limitato (solo semplici) |
| Applicazioni con query complesse | ❌ No            |
| Applicazioni OLAP             | ❌ No            |

---

## **Architettura di DynamoDB**

DynamoDB è un database **Key-Value e Document-Based**, simile a MongoDB o Redis.

### Concetti di Base
| Concetto        | Descrizione                     |
|----------------|--------------------------------|
| **Tabella**    | Collezione di oggetti (simile a una tabella SQL) |
| **Elemento**   | Ogni riga della tabella (JSON document) |
| **Chiave primaria** | Identificatore univoco per ogni elemento |
| **Partition Key** | Valore univoco che determina la distribuzione fisica dei dati |
| **Sort Key**   | Campo opzionale che permette di ordinare i dati nella stessa partizione |
| **Attribute**  | Ogni campo del documento |

---

### Struttura di una Tabella
Esempio di tabella **Clienti**:

| Partition Key | Sort Key | Nome  | Email          | Città    |
|--------------|----------|-------|---------------|----------|
| cliente123   | -        | Mario | mario@email.com | Roma     |
| cliente124   | -        | Anna  | anna@email.com  | Milano   |

---

### Tipi di Chiavi Primarie
| Tipo               | Descrizione             | Esempio      |
|------------------|------------------------|-------------|
| Partition Key    | Chiave univoca semplice | `user_id`    |
| Partition + Sort Key | Chiave composta | `ordine_id + data_ordine` |

---

### **Replica e Scalabilità**
DynamoDB distribuisce automaticamente i dati su più partizioni fisiche.

- Scalabilità **orizzontale** automatica
- Le tabelle possono avere **replica globale** su più regioni AWS
- Ogni partizione può contenere fino a **10 GB** di dati

---

## ⚙️ **Configurazione DynamoDB su AWS**

### 1. Creazione Tabella
1. Accedi alla Console AWS → **DynamoDB**
2. Clicca su **Create Table**
3. Definisci:
   - Nome Tabella
   - Partition Key (es. `user_id`)
   - Sort Key (facoltativa)
   - Modalità di capacità (On-Demand o Provisioned)
4. Clicca su **Create**

---

### 2. Installazione AWS SDK

#### PHP
```bash
composer require aws/aws-sdk-php
```

#### Node.js
```bash
npm install aws-sdk
```

---

### 3. Configurazione delle Credenziali AWS
Crea il file **.env** con le tue credenziali:
```env
AWS_ACCESS_KEY_ID=XXXXXXX
AWS_SECRET_ACCESS_KEY=YYYYYYY
AWS_REGION=us-east-1
```

---

## 📌 **CRUD con DynamoDB**

---

### **Inserimento di un Elemento (PutItem)**
#### PHP
```php
use Aws\DynamoDb\DynamoDbClient;

$client = new DynamoDbClient([
    'region' => 'us-east-1',
    'version' => 'latest'
]);

$result = $client->putItem([
    'TableName' => 'Clienti',
    'Item' => [
        'user_id' => ['S' => 'cliente123'],
        'nome' => ['S' => 'Mario'],
        'email' => ['S' => 'mario@email.com'],
        'città' => ['S' => 'Roma']
    ]
]);
```

---

### **Lettura di un Elemento (GetItem)**
#### PHP
```php
$result = $client->getItem([
    'TableName' => 'Clienti',
    'Key' => [
        'user_id' => ['S' => 'cliente123']
    ]
]);

print_r($result['Item']);
```

---

### **Aggiornamento di un Elemento**
#### PHP
```php
$client->updateItem([
    'TableName' => 'Clienti',
    'Key' => [
        'user_id' => ['S' => 'cliente123']
    ],
    'UpdateExpression' => 'SET email = :email',
    'ExpressionAttributeValues' => [
        ':email' => ['S' => 'nuovo@email.com']
    ]
]);
```

---

### **Cancellazione di un Elemento**
#### PHP
```php
$client->deleteItem([
    'TableName' => 'Clienti',
    'Key' => [
        'user_id' => ['S' => 'cliente123']
    ]
]);
```

---

## **DynamoDB Streams**
Permette di tracciare le modifiche ai dati in tempo reale e integrarle con **AWS Lambda**.

---

## **Sicurezza**
- Controllo Accesso con **IAM Policies**
- Encryption **AES-256**
- **VPC Endpoint** per connessioni private

---

## 🛑 **Limiti di DynamoDB**
| Limite       | Valore     |
|-------------|-----------|
| Dimensione Item | 400 KB   |
| Partition Key   | 2048 byte |
| Attributi      | 400 per item |

---

## 🔍 **Confronto con Altri Database**

| Database   | Tipo        | Scalabilità | Casi d'uso              |
|-----------|------------|------------|-----------------------|
| DynamoDB  | NoSQL      | Automatica | IoT, Web App, Serverless |
| MongoDB   | NoSQL      | Manuale    | Big Data, Web Apps      |
| MySQL     | Relazionale | Limitata   | Applicazioni Classiche  |

---

## **Conclusioni**

Amazon DynamoDB è la soluzione perfetta per:
- Applicazioni Serverless
- Microservizi
- Applicazioni Web in tempo reale
- IoT

✅ Vantaggi
- Scalabilità automatica
- Prestazioni elevate
- Nessuna gestione server

❌ Limiti
- Costo alto per grandi volumi di dati
- Nessun supporto per query complesse

---

### 🔗 Link Utili
- [Documentazione DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Welcome.html)
- [AWS SDK per PHP](https://docs.aws.amazon.com/sdk-for-php/v3/developer-guide/dynamodb.html)
- [Prezzi DynamoDB](https://aws.amazon.com/dynamodb/pricing/)

---

## **CRUD Completo con Amazon DynamoDB e PHP**
**Gestione Clienti con AWS SDK**

---

In questa esercitazione vedremo come implementare un'applicazione completa **CRUD (Create, Read, Update, Delete)** con **Amazon DynamoDB** utilizzando **PHP** e il pacchetto ufficiale **AWS SDK**.

---

### **🛠️ Prerequisiti**
1. Account AWS con permessi su DynamoDB
2. PHP ≥ 7.4
3. Composer
4. AWS CLI (opzionale, per testare le credenziali)
5. Amazon AWS SDK per PHP

---

## **1. Configurazione Ambiente**
### Installazione del pacchetto AWS SDK
Nella cartella di progetto, esegui:

```bash
composer require aws/aws-sdk-php
```

---

### Creazione file di configurazione
Crea un file `.env` nella root del progetto con le credenziali AWS:
```env
AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxxxxx
AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxx
AWS_REGION=us-east-1
TABLE_NAME=Clienti
```

---

### Connessione a DynamoDB
Crea il file `db.php` per la connessione:
```php
require 'vendor/autoload.php';

use Aws\DynamoDb\DynamoDbClient;
use Dotenv\Dotenv;

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

$client = new DynamoDbClient([
    'region' => $_ENV['AWS_REGION'],
    'version' => 'latest',
    'credentials' => [
        'key'    => $_ENV['AWS_ACCESS_KEY_ID'],
        'secret' => $_ENV['AWS_SECRET_ACCESS_KEY']
    ]
]);

$tableName = $_ENV['TABLE_NAME'];
```

---

## **2. Creazione della Tabella su AWS**
Prima di procedere, crea la tabella direttamente da AWS CLI o dalla console.

Vai su:
➡️ **AWS Console** → DynamoDB → Create Table

| Campo        | Valore       |
|-------------|-------------|
| Table Name  | Clienti      |
| Partition Key | cliente_id (String) |
| Sort Key    | Nessuno      |
| Read Capacity | On-Demand   |
| Write Capacity | On-Demand |

---

## **3. CRUD Completo**

---

### **CREATE (Inserimento Dati)**
File: `create.php`
```php
require 'db.php';

$clienteId = uniqid('cliente_');

$client->putItem([
    'TableName' => $tableName,
    'Item' => [
        'cliente_id' => ['S' => $clienteId],
        'nome' => ['S' => 'Mario'],
        'email' => ['S' => 'mario@email.com'],
        'città' => ['S' => 'Roma']
    ]
]);

echo "Cliente $clienteId creato con successo!";
```

---

### **READ (Lettura Dati)**
File: `read.php`
```php
require 'db.php';

$clienteId = 'cliente_654321';

$result = $client->getItem([
    'TableName' => $tableName,
    'Key' => [
        'cliente_id' => ['S' => $clienteId]
    ]
]);

if (isset($result['Item'])) {
    print_r($result['Item']);
} else {
    echo "Cliente non trovato.";
}
```

---

### **UPDATE (Modifica Dati)**
File: `update.php`
```php
require 'db.php';

$clienteId = 'cliente_654321';

$client->updateItem([
    'TableName' => $tableName,
    'Key' => [
        'cliente_id' => ['S' => $clienteId]
    ],
    'UpdateExpression' => 'SET email = :email',
    'ExpressionAttributeValues' => [
        ':email' => ['S' => 'nuovo@email.com']
    ]
]);

echo "Email cliente aggiornata!";
```

---

### **DELETE (Cancellazione Dati)**
File: `delete.php`
```php
require 'db.php';

$clienteId = 'cliente_654321';

$client->deleteItem([
    'TableName' => $tableName,
    'Key' => [
        'cliente_id' => ['S' => $clienteId]
    ]
]);

echo "Cliente $clienteId eliminato!";
```

---


## **5. Streams DynamoDB + AWS Lambda (Bonus)**
Vuoi notificare in tempo reale quando vengono aggiunti o modificati i dati?

1. Attiva DynamoDB Streams dalla console AWS
2. Collega uno stream a una funzione AWS Lambda
3. La funzione può inviare email, notifiche o aggiornare un'altra tabella

---


## **Query Avanzate (SCAN + QUERY)**

---

### **Query con Filtro**
Trova tutti i clienti di Roma:
```php
$result = $client->scan([
    'TableName' => $tableName,
    'FilterExpression' => 'città = :city',
    'ExpressionAttributeValues' => [
        ':city' => ['S' => 'Roma']
    ]
]);

print_r($result['Items']);
```

---

## **Best Practices DynamoDB**
| Funzionalità     | Best Practice                  |
|----------------|-------------------------------|
| Partition Key   | Usa valori con alta cardinalità |
| Capacity Mode   | Usa **On-Demand** per carichi variabili |
| Backup         | Attiva **Point-in-Time Recovery** |
| Sicurezza      | Usa IAM + Encryption |
| Index          | Crea **Global Secondary Index (GSI)** solo se necessario |

---

## 🔍 **Test Vincoli (Constraints)**

| Vincolo               | Query di Test |
|-----------------------|--------------|
| Chiave primaria unica | Inserisci 2 elementi con lo stesso ID |
| Tipi di Dati          | Inserisci un valore numerico in un campo stringa |
| Valori Null           | Inserisci un elemento senza attributo richiesto |
| Cancellazione         | Cancella un elemento e verifica |
| Consistenza           | Aggiorna un dato e verifica la lettura |

---

## **Confronto con MongoDB**
| Caratteristica | DynamoDB | MongoDB |
|---------------|----------|--------|
| Serverless    | ✅       | ❌      |
| Scalabilità   | ✅       | ⚠️ Manuale |
| Transazioni   | ✅ (dal 2018) | ✅      |
| Replica Globale | ✅       | ❌      |
| Prezzo        | 🔥 Basso per pochi dati | 🚨 Alto con grandi volumi |

---

## 🔥 **Conclusioni**
Amazon DynamoDB è una scelta eccellente per:
- Applicazioni **serverless**
- **Microservizi**
- Sistemi **IoT**
- Applicazioni **Web in tempo reale**

---

✅ **Vantaggi**
- Zero gestione server
- Replica automatica
- Scalabilità illimitata

🚫 **Svantaggi**
- Nessun JOIN
- Query complesse limitate
- Costo elevato per query frequenti

---

## Download Progetto 💾
👉 [Download su GitHub](https://github.com/username/dynamodb-php-crud)

---
