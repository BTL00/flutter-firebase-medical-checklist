# 09 · Data model, minimisation, retention, audit trail

How data is shaped decides how hard every later obligation is. Pseudonymise early, keep identifying data out of the clinical store, and make deletion a first-class feature.

## A. Data inventory and classification

- [ ] **DAT-01** [ALL][M] A **data inventory** lists every data element collected or derived, its category (identifying, health, device/sensor, usage, security), source, purpose, storage location, retention and legal basis; kept with the architecture.
- [ ] **DAT-02** [ALL][M] Classification scheme (e.g. Public, Internal, Personal, Health/PHI, Secret) applied to Firestore collections, Storage paths, logs, BigQuery tables and backups.
- [ ] **DAT-03** [ALL][M] Data minimisation review per feature: each field has a documented need; "nice to have later" fields are not collected.
- [ ] **DAT-04** [ALL][M] Free-text fields that may contain health data are classified as health data and handled accordingly (search indexing, logging, analytics).
- [ ] **DAT-05** [ALL][S] Derived data (scores, risk indices, model outputs) is inventoried with provenance (algorithm version, inputs, timestamp).

## B. Pseudonymisation architecture

- [ ] **DAT-10** [ALL][M] Clinical records are stored under a **pseudonym**; direct identifiers (name, date of birth, national ID, address, phone, email) live in a separate store with stricter access.
- [ ] **DAT-11** [ALL][M] The pseudonym-to-identity mapping (key service) runs in a separate project or service, with its own IAM, audit logging and region; re-identification is a logged, authorised operation.
- [ ] **DAT-12** [ALL][M] Firebase Auth UID is not used as the clinical pseudonym where exports or research require unlinkability; a second pseudonym is used for research datasets.
- [ ] **DAT-13** [ALL][M] Dates in clinical records are kept at the precision needed (date of birth → age band where possible); dates shifting or generalisation considered for research exports.
- [ ] **DAT-14** [ALL][S] Device identifiers (IDFV, Android ID, FCM token, BLE MAC) are not stored alongside clinical data without a documented need.

## C. Encryption

- [ ] **DAT-20** [ALL][M] Encryption at rest (Google-managed by default) documented; **CMEK** decision recorded; field-level or client-side encryption for the most sensitive fields (genetics, mental health notes, HIV status, sexual health) evaluated and documented.
- [ ] **DAT-21** [ALL][M] If client-side encryption is used: key derivation and storage, key loss/recovery policy (data unrecoverable vs escrow) explicitly chosen and stated to users.
- [ ] **DAT-22** [ALL][M] Encryption in transit everywhere incl. Function → third-party calls; TLS 1.2+ with modern ciphers; internal GCP traffic documented as encrypted by Google.
- [ ] **DAT-23** [ALL][M] Cryptographic inventory and rotation schedule (see SEC-21); no custom crypto.

## D. Integrity and audit trail

- [ ] **DAT-30** [ALL][M] Clinical records are **append-only or versioned**: corrections create a new version with reason, author and timestamp; history is viewable by authorised users (medical-records law and Part 11 expect this).
- [ ] **DAT-31** [ALL][M] **Audit log of access** to health data by staff (who, what, when, from where, why/context) stored where the logged users cannot alter it (separate project or log bucket with retention lock); generated server-side (Functions, Data Access audit logs), not only client-side.
- [ ] **DAT-32** [ALL][M] Audit log retention meets the longest applicable requirement (HIPAA 6 years for documentation; national medical-record laws; your own policy) and is stated.
- [ ] **DAT-33** [ALL][M] Patient-facing access history ("who viewed my record") available where required (e.g. national laws, EHDS direction) or at least producible on request.
- [ ] **DAT-34** [ALL][M] Server timestamps (`FieldValue.serverTimestamp()`) for clinical events; client timestamps stored separately as "reported time"; clock-skew handling defined.
- [ ] **DAT-35** [ALL][M] Integrity of exported documents (PDF reports, FHIR bundles): checksums or signatures; version of generating software embedded.
- [ ] **DAT-36** [ALL][S] Tamper-evident logging (hash chaining or Cloud Logging with locked retention) for records used as legal medical documentation.

## E. Offline sync and conflict resolution

- [ ] **DAT-40** [ALL][M] Conflict policy per data type documented (last-writer-wins is rarely acceptable for clinical data): merge rules, user resolution, or server authority.
- [ ] **DAT-41** [ALL][M] Pending offline writes are visible to the user; the app shows what has not yet reached the server; critical data (e.g. an alert to a clinician) is not silently queued.
- [ ] **DAT-42** [ALL][M] Sync failures (rules rejection, quota, schema change) surface as errors with recovery guidance, not as dropped data; Firestore offline writes rejected by rules are detected and handled.
- [ ] **DAT-43** [ALL][M] Schema migrations are versioned; old app versions reading new data (and vice versa) are tested; minimum app version enforced server-side when a breaking change ships.
- [ ] **DAT-44** [ALL][S] Idempotent writes with client-generated IDs to prevent duplicates after retries.

## F. Retention and deletion

- [ ] **DAT-50** [ALL][M] **Retention schedule** per data type with legal reference (medical-record laws by country, HIPAA documentation, tax/contract, vigilance); shortest period that satisfies them; stated in the notice.
- [ ] **DAT-51** [ALL][M] Automated deletion (Firestore TTL, scheduled Functions, Storage lifecycle rules) implements the schedule; manual steps are documented and audited.
- [ ] **DAT-52** [ALL][M] **Erasure runbook** covers: Firestore, Storage, Auth, Realtime DB, BigQuery, Cloud Logging, Crashlytics/Analytics user deletion APIs, support desk, email provider, backups (with maximum residual time), key service, third-party processors; tested end to end with evidence.
- [ ] **DAT-53** [ALL][M] Legal-hold and retention-obligation exceptions implemented (e.g. provider must keep records 10–20 years even if the patient asks for deletion) and explained to the user.
- [ ] **DAT-54** [ALL][M] Account deletion from the stores' requirements (Apple, Google Play) is the same flow as GDPR erasure, with the same completeness.
- [ ] **DAT-55** [ALL][S] Deletion certificates or logs can be produced for a customer (hospital) on contract termination; data return format agreed.

## G. Portability, export and interoperability of the data itself

- [ ] **DAT-60** [ALL][M] Per-user export in a structured, commonly used format (JSON; FHIR R4 bundle preferred for clinical data) covering all user data incl. files; delivered securely (authenticated download, expiring link).
- [ ] **DAT-61** [ALL][S] Export for the customer (hospital) at contract end in FHIR or agreed CSV/JSON with a data dictionary.
- [ ] **DAT-62** [ALL][S] Exported PDFs for patients include identification, date, units, reference ranges, software version and a disclaimer approved by regulatory.

## H. Secondary use, analytics and research

- [ ] **DAT-70** [ALL][M] Product analytics uses pseudonymous, minimised event data in a separate project; no clinical values in events; access limited.
- [ ] **DAT-71** [ALL][M] Research or model-training datasets are created by a documented pipeline with de-identification (HIPAA Safe Harbor or Expert Determination; GDPR anonymisation test), approval records and a data-use register.
- [ ] **DAT-72** [ALL][S] Re-identification risk assessment for published statistics (small cell counts, rare conditions, geography).
- [ ] **DAT-73** [ALL][S] Data-sharing agreements with research partners cover purpose limitation, security, onward transfer and deletion.

## I. Data quality

- [ ] **DAT-80** [ALL][M] Validation rules for clinical data at entry and ingestion (ranges, units, required fields, referential integrity) implemented server-side as well as in the UI.
- [ ] **DAT-81** [ALL][M] Device-sourced data (BLE, HealthKit, Health Connect) carries provenance: device model, firmware, source app, manual vs measured; downstream logic treats manual entries differently where clinically relevant.
- [ ] **DAT-82** [ALL][S] Data-quality monitoring (missing fields, implausible values, duplicate records) with alerts and periodic review.

## J. Evidence this section needs

Data inventory, classification policy, pseudonymisation design, encryption decisions, audit-log design and samples, conflict-resolution spec, retention schedule, erasure runbook with test evidence, export samples, de-identification procedure.
