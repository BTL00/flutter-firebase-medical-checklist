# Firebase / Google Cloud service inventory

One row per service in the production project. This table answers the auditor's three questions at once: where is the data, under which contract, and can health data reach it. Keep it in the repo next to `firebase.json`.

| Service | Used? | Project(s) | Region / data location | Data categories it may hold | Health data / PHI allowed? | Google role (processor / independent controller) | Contract coverage (DPA / BAA / none) | Consent needed (ePrivacy)? | Retention configured | Audit logging (Data Access) | Owner | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Firebase Authentication / Identity Platform | | prod | US (not selectable; verify current docs) | Identity, auth metadata | No (profile only) | Processor | DPA; BAA: check list | No (strictly necessary) | n/a | Yes | | MFA enforced for staff |
| Cloud Firestore | | prod | e.g. `europe-west3` | Pseudonymised clinical records | Yes | Processor | DPA; BAA | No | TTL policies | Yes | | PITR + scheduled backups |
| Cloud Storage for Firebase | | prod | e.g. `europe-west3` | Files (ECG, images, PDFs) | Yes | Processor | DPA; BAA | No | Lifecycle rules | Yes | | Uniform bucket-level access |
| Cloud Functions / Cloud Run | | prod | e.g. `europe-west3` | Transient processing | Yes (transient) | Processor | DPA; BAA | No | Log retention | Yes | | Per-function service accounts |
| Firebase App Check | | prod | n/a | Attestation tokens | No | Processor | DPA | No | n/a | n/a | | Enforcement on |
| Firebase Cloud Messaging | | prod | Global | Tokens, generic payloads | **No PHI in payloads** | Processor | DPA; BAA: check list | Consent for marketing pushes | n/a | n/a | | Data-only messages |
| Google Analytics for Firebase | | removed / prod | Global | Pseudonymous usage events | **No** | Depends on configuration | Not HIPAA-covered | Yes (ePrivacy) | Data retention setting | n/a | | Disabled until consent |
| Crashlytics | | prod | US | Crash traces, custom keys | **No** | Processor | Not HIPAA-covered | Yes (ePrivacy) | 90 days default | n/a | | PHI scrub in keys/logs |
| Performance Monitoring | | removed | | | **No** | | Not HIPAA-covered | Yes | | | | |
| Remote Config | | prod | Global | Flags | **No** | Processor | Not HIPAA-covered | Depends (experiments) | n/a | n/a | | Cannot change clinical logic |
| Firebase Hosting | | prod | Global CDN | Static assets, eIFU | No | Processor | DPA | No | n/a | n/a | | Security headers |
| Secret Manager | | prod | Replication policy: EU | Secrets | No | Processor | DPA | No | Rotation | Yes | | |
| Cloud Logging | | prod | Log bucket region EU | Logs (PHI-redacted) | Must be redacted | Processor | DPA; BAA | No | e.g. 400 days | n/a | | Locked bucket for audit logs |
| BigQuery | | prod/analytics | EU | Aggregated analytics | No | Processor | DPA; BAA | No | Table expiry | Yes | | |
| Vertex AI / Gemini API | | prod | EU endpoint | Prompts/outputs | Only with BAA/DPA, no logging | Processor | DPA; BAA: check scope | No | Zero retention | Yes | | See checklist 17 |
| Firebase Extensions (list each) | | | | | | | | | | | | SOUP register entry |

Verify "HIPAA included functionality" and data-location statements against Google's current documentation at each review; both lists change.
