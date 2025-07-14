# cvsam

# 🧱 Modern VSAM in C

Una reimplementazione moderna in C del concetto di **VSAM (Virtual Storage Access Method)** utilizzato nei mainframe IBM.  
Il progetto mira a replicare i principali tipi di file VSAM, in particolare **KSDS (Key-Sequenced Data Set)**, su sistemi Unix-like, utilizzando puro C standard.

> ⚠️ Questo non è un wrapper COBOL né un emulatore mainframe. È un progetto educativo/sperimentale per hacker e retrocomputing enthusiast.

---

## 🧠 Obiettivi

- ✅ Comprendere e riprodurre la logica dei file VSAM (KSDS, ESDS, RRDS)
- ✅ Creare una libreria C che implementi accesso sequenziale e diretto a dati su disco
- ✅ Supportare indicizzazione tramite albero B+ persistente
- ✅ Simulare l'accesso a record tramite chiave primaria (come in COBOL)
- ✅ Progettare un formato file personalizzato e modulare
- ✅ Imparare a lavorare con strutture dati su disco, accesso binario e serializzazione

---

## 📦 Tipi di dataset previsti

| Tipo  | Descrizione | Stato |
|-------|-------------|-------|
| KSDS  | Key-Sequenced Data Set - dati indicizzati con chiave primaria | 🔜 In sviluppo |
| RRDS  | Relative Record Data Set - accesso diretto via numero record | ⏳ Previsto |
| ESDS  | Entry-Sequenced Data Set - log sequenziale, accesso per offset | ⏳ Previsto |
| LDS   | Linear Data Set - raw storage senza struttura | ❌ Fuori scope |

---

## 📁 Struttura dei file

Ogni dataset sarà composto da due file:

- `*.vdat` — contiene i dati dei record serializzati
- `*.vidx` — indice B+tree per accesso rapido ai record (solo per KSDS)

---

## 📚 API previste

```c
// vsam.h
int vsam_create_ksds(const char* basepath, size_t key_size, size_t record_size);
int vsam_insert(const char* basepath, const void* key, const void* record);
int vsam_read(const char* basepath, const void* key, void* out_record);
int vsam_delete(const char* basepath, const void* key);
int vsam_read_sequential(const char* basepath, void* key, void* record);
