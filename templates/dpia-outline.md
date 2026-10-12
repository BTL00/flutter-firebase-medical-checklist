# Data protection impact assessment (GDPR Art. 35) — outline for a Flutter/Firebase health app

Use with your supervisory authority's template where one exists (CNIL PIA, ICO DPIA, UODO guidance). This outline lists what must be covered for this specific architecture.

## 1. Description of the processing

- Purposes (clinical care, self-management, research, analytics, support).
- Data subjects (patients, proxies, clinicians) and estimated numbers.
- Data categories (identity, contact, health, device/sensor, usage, technical) with the data inventory reference.
- Data flows: Flutter app → Firebase Auth → Firestore/Storage → Cloud Functions → third parties; include a diagram with regions.
- Firebase/Google services used and their roles (processor), regions, HIPAA/BAA status if relevant.
- Third-party processors (SDKs, email, SMS, support, LLM) and transfers.
- Retention per category and deletion mechanics (incl. backups).
- Legal basis and Art. 9 condition per purpose.

## 2. Necessity and proportionality

- Why each data element is necessary; minimisation decisions taken (pseudonymisation, aggregated analytics, no advertising ID).
- Information to data subjects (notice, consent texts, in-app explanations).
- Rights implementation (access, portability, erasure, objection, Art. 22 safeguards).
- Processor contracts and international transfer mechanisms (DPF, SCCs, TIA).
- DPO consultation and, where relevant, views of data subjects or their representatives (patient groups, clinicians).

## 3. Risk assessment (to individuals)

For each risk: source, likelihood, severity, affected rights.

Typical risks for this architecture:

- Over-permissive Firestore/Storage rules exposing records.
- Health data reaching analytics/crash SDKs or logs.
- Re-identification through the pseudonymisation key service.
- Loss of a device with cached data / inadequate app lock.
- Notifications revealing health status on a lock screen.
- US transfer of Auth data or support access without a valid mechanism.
- Secondary use (model training, research) without basis.
- Inaccurate data causing wrong clinical decisions (also a safety risk).
- Inability to delete data from backups within stated time.
- Insider access by support/developers.
- Vendor (Google) incident or terms change.

## 4. Measures

Map each risk to technical and organisational measures (reference checklist IDs, e.g. FB-30, FL-20, DAT-11, SEC-62) and the residual risk after measures.

## 5. Conclusion

- Residual risk acceptable? If high residual risk remains → prior consultation (Art. 36).
- Sign-off: controller, DPO opinion, date, review interval and triggers (new processor, new data category, new market, incident).
