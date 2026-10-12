# 08 · Firebase and Google Cloud backend

> Not legal, regulatory or medical advice. Verify dated statements against primary sources. See [DISCLAIMER.md](../DISCLAIMER.md).

Firebase makes a secure backend possible, not automatic. The defaults (open rules in test mode, default service accounts with Editor, US multi-region, analytics on) are wrong for a medical app. Check each service you use against this list, and remove the ones you do not use.

## A. Project and organisation

- [ ] **FB-01** [ALL][M] Production Firebase project lives in a **Google Cloud organisation** owned by the legal manufacturer, with Cloud Identity / Workspace accounts; no personal Gmail owners.
- [ ] **FB-02** [ALL][M] Separate projects for dev, staging, production (and per-tenant where hospitals demand isolation); no production data in non-production projects.
- [ ] **FB-03** [ALL][M] **2-Step Verification enforced** for all Google accounts with project access; hardware keys for owners.
- [ ] **FB-04** [ALL][M] IAM follows least privilege: no individual with Owner for daily work; Editor avoided; predefined roles or custom roles; access reviewed quarterly with records.
- [ ] **FB-05** [ALL][M] No user-managed **service account keys** (JSON) unless justified; org policy `iam.disableServiceAccountKeyCreation` enabled; workload identity for CI.
- [ ] **FB-06** [ALL][M] **Cloud Audit Logs**: Admin Activity on (default) and **Data Access logs enabled** for Firestore, Cloud Storage, Secret Manager, Identity Platform; exported to a locked log bucket with retention matching policy.
- [ ] **FB-07** [ALL][M] Billing alerts and quotas set; a denial-of-wallet attack cannot silently stop the service or empty the account.
- [ ] **FB-08** [ALL][M] Google Cloud **Data Processing and Security Terms** accepted; for US PHI, the **Cloud BAA** executed for the organisation/project; the list of Firebase services used is checked against HIPAA included functionality.
- [ ] **FB-09** [ALL][M] Firebase project configuration (rules, indexes, Functions, Auth, App Check, Hosting, Remote Config) is in the repo and deployed from CI; console drift triggers an alert.
- [ ] **FB-10** [ALL][S] Organisation policies: domain-restricted sharing, restrict public IP, disable default network, uniform bucket-level access, require OS Login where VMs exist.
- [ ] **FB-11** [ALL][S] Security Command Center (standard tier at least) enabled; findings triaged in the problem-report system.

## B. Data location and residency

- [ ] **FB-20** [ALL][M] **Firestore location** chosen deliberately (regional vs multi-region, EU vs US) before creating the database; it cannot be changed later. EU patients → EU location (e.g. `europe-west3`, `eur3`); US PHI → US location if the customer requires it.
- [ ] **FB-21** [ALL][M] Cloud Storage buckets, Cloud Functions regions, Realtime Database instances (if any), BigQuery datasets and Secret Manager replication policy match the Firestore region policy.
- [ ] **FB-22** [ALL][M] Services whose data location you cannot control (Firebase Authentication user records, Crashlytics, Analytics, FCM) are listed with their actual storage location and covered in the privacy documentation.
- [ ] **FB-23** [ALL][S] Multi-tenant (EU + US) deployments use separate projects per region rather than mixing residency in one database.
- [ ] **FB-24** [ALL][S] **CMEK** (customer-managed encryption keys) evaluated for Firestore, Storage and BigQuery where customers or national schemes require key control; key rotation and access logging configured.

## C. Firestore security rules

- [ ] **FB-30** [ALL][M] Default deny: no `allow read, write: if true`; no rule that grants access to health data on `request.auth != null` alone.
- [ ] **FB-31** [ALL][M] Ownership checks compare document fields with `request.auth.uid` or verified **custom claims**, never with values supplied in the request body.
- [ ] **FB-32** [ALL][M] Role-based access via custom claims set server-side; clinicians restricted to assigned patients through membership documents or claims, with `get()`/`exists()` lookups budgeted.
- [ ] **FB-33** [ALL][M] **Schema validation in rules**: required fields, types, enums, size limits, `hasOnly()` to block extra fields, immutability of audit fields (`createdAt`, `createdBy`, `patientId`).
- [ ] **FB-34** [ALL][M] Writes that change clinical state go through Cloud Functions where validation needs server logic; rules then forbid direct client writes to those fields.
- [ ] **FB-35** [ALL][M] List queries constrained (`request.query.limit`) and rules tested with query-level semantics (rules are not filters).
- [ ] **FB-36** [ALL][M] Rules unit tests in the Emulator Suite cover every collection × role × operation, including negative cases; run in CI; no deploy without passing.
- [ ] **FB-37** [ALL][M] Rules are versioned, reviewed like code and deployed from CI; the console editor is not used for production.
- [ ] **FB-38** [ALL][M] No PHI in **document IDs**, collection paths or field names (they appear in logs and URLs); identifiers are random (`doc().id`, UUID), not national IDs or emails.
- [ ] **FB-39** [ALL][S] Separate collections or databases for pseudonymised clinical data and for identifying data; the mapping is accessible only to a dedicated service.
- [ ] **FB-40** [ALL][S] Rules have a documented performance budget (reads per rule evaluation) and are load-tested.

## D. Cloud Storage for Firebase

- [ ] **FB-50** [ALL][M] Storage rules mirror the Firestore model: path-based ownership, content-type and size validation, no public buckets, no long-lived signed URLs for PHI.
- [ ] **FB-51** [ALL][M] Uniform bucket-level access on; object versioning or soft delete configured per retention policy; lifecycle rules delete per schedule.
- [ ] **FB-52** [ALL][M] Uploaded files (images, PDFs, ECGs) are scanned/validated server-side; EXIF and embedded metadata stripped where they carry location or identity.
- [ ] **FB-53** [ALL][S] Download tokens (`firebaseStorageDownloadTokens`) revoked when access changes; prefer short-lived signed URLs minted by Functions for sensitive files.

## E. Cloud Functions / Cloud Run

- [ ] **FB-60** [ALL][M] Each function has its **own service account** with least privilege; the default App Engine / Compute service account is not used.
- [ ] **FB-61** [ALL][M] Callable functions verify `context.auth` and claims; HTTP functions requiring privacy are not invokable by `allUsers`; `enforceAppCheck: true` where applicable.
- [ ] **FB-62** [ALL][M] Secrets via Secret Manager (`defineSecret`), never env vars in the repo; rotation plan.
- [ ] **FB-63** [ALL][M] Input validation with a schema library (zod/Joi/pydantic) on every function; errors never leak stack traces or PHI.
- [ ] **FB-64** [ALL][M] Idempotency for triggers (Firestore/Auth/FCM triggers may fire more than once); retries configured deliberately.
- [ ] **FB-65** [ALL][M] Timeouts, memory, concurrency and `maxInstances` set; min instances for latency-critical functions evaluated against the clinical workflow.
- [ ] **FB-66** [ALL][M] Structured logging with PHI redaction; log fields allowlisted; log sinks exclude request bodies.
- [ ] **FB-67** [ALL][M] Runtime versions supported and patched (Node LTS / Python supported); dependency scanning for Functions.
- [ ] **FB-68** [ALL][M] Rate limiting / abuse protection on public endpoints (App Check, per-user quotas, Cloud Armor for Cloud Run if exposed).
- [ ] **FB-69** [ALL][S] Functions regions match data residency; egress to third-party APIs documented with the data each one receives.
- [ ] **FB-70** [ALL][S] Blue/green or traffic-split deployment for Cloud Run services; rollback tested.

## F. Firebase Authentication / Identity Platform

- [ ] **FB-80** [ALL][M] Only intended sign-in providers enabled; anonymous auth off unless designed for and covered by rules.
- [ ] **FB-81** [ALL][M] **Email enumeration protection** enabled; password policy enforced (length, breach-list check via blocking function if needed).
- [ ] **FB-82** [ALL][M] **MFA** for clinicians and admins (Identity Platform upgrade for SMS/TOTP MFA); enforced via blocking functions or claims, not optional UI.
- [ ] **FB-83** [ALL][M] Session policy: ID token lifetime (1 h fixed) accepted; **refresh-token revocation** on password change, role change, device loss, offboarding; `revokeRefreshTokens` wired to admin tooling; rules or Functions check `auth_time` for sensitive actions.
- [ ] **FB-84** [ALL][M] Custom claims are set only by trusted server code with its own authorisation check; claim size limits respected; role changes propagate (force token refresh).
- [ ] **FB-85** [ALL][M] Account deletion flow deletes Auth user and triggers data deletion (Delete User Data extension or custom function), with a grace period where law requires retention.
- [ ] **FB-86** [ALL][M] Auth emails (verification, reset) use a custom domain and reviewed templates; action links have appropriate expiry; reset flow does not disclose account existence.
- [ ] **FB-87** [ALL][S] SSO for hospital staff (SAML/OIDC via Identity Platform) with tenant isolation; multi-tenancy design documented.
- [ ] **FB-88** [ALL][S] Blocking functions (`beforeCreate`, `beforeSignIn`) enforce domain allowlists, device policies and MFA state.
- [ ] **FB-89** [ALL][S] Auth data location (US) acknowledged in privacy documentation; minimal profile data stored in Auth (no health data in `displayName` or `photoURL`).

## G. App Check

- [ ] **FB-90** [ALL][M] App Check enabled with Play Integrity (Android), App Attest with DeviceCheck fallback (iOS), reCAPTCHA Enterprise (web); **enforcement on** for Firestore, Storage, Functions, Auth (if supported) after monitoring confirms real clients pass.
- [ ] **FB-91** [ALL][M] Debug provider tokens exist only in debug builds and CI; not committed; rotated.
- [ ] **FB-92** [ALL][S] Replay protection (limited-use tokens) for sensitive callable functions.
- [ ] **FB-93** [ALL][S] App Check treated as defence in depth, not as authentication; risk file does not rely on it alone.

## H. Analytics, Crashlytics, Performance, Remote Config, Messaging

- [ ] **FB-100** [ALL][M] Decision per product: used or removed. Unused Firebase SDKs are not linked (they still collect data when present).
- [ ] **FB-101** [ALL][M] Analytics, Crashlytics and Performance **auto-collection disabled** at build time and enabled only after consent (EU) and only if no PHI can reach them (US BAA scope).
- [ ] **FB-102** [ALL][M] Event names, parameters, user properties, custom keys and log messages are allowlisted and reviewed for PHI; user IDs sent to analytics are pseudonymous and rotate on request.
- [ ] **FB-103** [ALL][M] Crashlytics: no PHI in custom logs/keys; breadcrumbs reviewed; symbol upload from CI only.
- [ ] **FB-104** [ALL][M] FCM: data-only or generic notification payloads; the app fetches content after authentication; topics do not reveal conditions (no `diabetes_patients` topic).
- [ ] **FB-105** [ALL][M] Remote Config cannot alter clinical thresholds, algorithms or safety features; template changes are versioned and reviewed; defaults are safe.
- [ ] **FB-106** [ALL][S] BigQuery export of Analytics/Crashlytics disabled or scoped to non-PHI data in the right region with retention.
- [ ] **FB-107** [ALL][S] Dynamic Links are not used (service shut down in 2025); deep links use App Links/Universal Links.

## I. Firebase Hosting (web app, privacy pages, eIFU)

- [ ] **FB-110** [ALL][M] Security headers configured in `firebase.json`; HSTS preload considered; no mixed content.
- [ ] **FB-111** [ALL][M] eIFU and privacy notices hosted with version history and availability monitoring (uptime check) as required by Reg. 2021/2226.
- [ ] **FB-112** [ALL][S] Preview channels not indexable and not holding real data; access restricted.

## J. Extensions, Realtime Database, other services

- [ ] **FB-120** [ALL][M] Each Firebase Extension is treated as SOUP: version pinned, permissions reviewed, data flows documented.
- [ ] **FB-121** [ALL][M] Realtime Database (if used) has rules tests and a region matching residency; prefer Firestore for new clinical data.
- [ ] **FB-122** [ALL][S] Vertex AI in Firebase / Gemini API: data processing terms, region, prompt-logging and training opt-outs confirmed; PHI sent only under BAA/DPA; see file 17.
- [ ] **FB-123** [ALL][S] Firebase App Distribution for testers uses pseudonymous test data only.

## K. Backups, recovery and deletion mechanics

- [ ] **FB-130** [ALL][M] Firestore **point-in-time recovery** enabled (7 days) and **scheduled backups** with retention matching policy; restore tested quarterly into a non-production project.
- [ ] **FB-131** [ALL][M] Storage buckets: versioning/soft delete and a cross-region copy where RTO requires; restore tested.
- [ ] **FB-132** [ALL][M] Deletion jobs (TTL policies, scheduled functions) implement retention per data type; backups age out within the stated maximum; the erasure runbook covers backups honestly in the privacy notice.
- [ ] **FB-133** [ALL][M] Backup access is more restricted than production access and is logged.
- [ ] **FB-134** [ALL][S] Export for portability (per-user JSON/FHIR bundle) implemented as a Function with audit logging.

## L. Evidence this section needs

IAM export and review records, org policy list, audit-log configuration, data-location register, rules + tests + CI logs, Functions inventory with service accounts, Auth configuration export, App Check metrics, SDK/product decision table, backup and restore drill records. → template: `templates/firebase-service-inventory.md`
