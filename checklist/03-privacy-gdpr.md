# 03 · Privacy: GDPR and ePrivacy (EU/EEA)

Health data is a special category under Art. 9. A Firebase app touches Google as a processor, US transfers and device identifiers, so this section is long on purpose.

## A. Roles and lawful basis

- [ ] **GDPR-01** [EU][M] Controller / joint controller / processor role determined for each data flow: app vendor vs hospital vs clinician practice. Written joint-controller arrangement (Art. 26) where applicable.
- [ ] **GDPR-02** [EU][M] Lawful basis under **Art. 6** and condition under **Art. 9(2)** recorded per purpose (explicit consent 9(2)(a); health care provision under professional secrecy 9(2)(h); public health 9(2)(i); research 9(2)(j)). Consent is not the default for care delivered by a provider.
- [ ] **GDPR-03** [EU][M] Consent (where used) is granular, separate from terms of service, withdrawable in-app in one step, and logged with timestamp, version of the notice and the exact wording shown.
- [ ] **GDPR-04** [EU][M] Children: age gate and parental consent rules per member state (Art. 8, 13–16 years); pediatric apps have a documented approach.
- [ ] **GDPR-05** [EU][M] Secondary use (analytics, model training, research) has its own purpose, basis and notice; no "we may use your data to improve our services" umbrella for health data.

## B. Transparency and data subject rights

- [ ] **GDPR-10** [EU][M] Privacy notice (Art. 13/14) is layered, in each supported language, available before account creation and inside the app; it lists all recipients incl. Google and every SDK vendor, regions, retention per data type and the Art. 9 condition.
- [ ] **GDPR-11** [EU][M] **Access** (Art. 15) and **portability** (Art. 20) are implemented end to end: export of Firestore documents and Storage files for one user in a machine-readable format (JSON or FHIR), within one month.
- [ ] **GDPR-12** [EU][M] **Erasure** (Art. 17) procedure covers Firestore, Storage, Auth, Cloud Logging, BigQuery exports, backups within their retention, support-desk tickets and the pseudonymisation key; exceptions (medical-record retention laws) documented and explained to the user.
- [ ] **GDPR-13** [EU][M] Rectification, restriction and objection (Art. 16, 18, 21) have an owner and a tracked workflow; identity verification before fulfilling a request is defined.
- [ ] **GDPR-14** [EU][M] **Art. 22** automated decision-making: if the app produces decisions with legal or similarly significant effect (triage, eligibility), human intervention, explanation and contestation are available.
- [ ] **GDPR-15** [EU][S] In-app "privacy dashboard" shows what is stored, who accessed it (for staff access), and lets the user download or delete.

## C. Accountability documentation

- [ ] **GDPR-20** [EU][M] **Records of processing activities** (Art. 30) list each processing operation with purposes, categories, recipients, transfers, retention, security measures; kept current with each release.
- [ ] **GDPR-21** [EU][M] **DPIA** (Art. 35) performed; large-scale special-category processing is on the mandatory list. Includes necessity/proportionality, risks to individuals, measures, DPO opinion, residual risk and consultation decision (Art. 36). → template: `templates/dpia-outline.md`
- [ ] **GDPR-22** [EU][M] **Data Protection Officer** (Art. 37) appointed where large-scale special-category processing is a core activity; contact details published and notified to the authority.
- [ ] **GDPR-23** [EU][M] Non-EU controllers have an **EU representative** (Art. 27).
- [ ] **GDPR-24** [EU][M] **Privacy by design and by default** (Art. 25) evidence: data-minimisation decisions, pseudonymisation architecture, default-off analytics, retention automation.
- [ ] **GDPR-25** [EU][S] Data-protection training records for everyone with production access.

## D. Processors, Google and sub-processors

- [ ] **GDPR-30** [EU][M] Google Cloud / Firebase **Data Processing and Security Terms** accepted for the right legal entity; Firebase products that process data as a processor vs those where Google is an independent controller (e.g. Analytics in certain configurations) are identified.
- [ ] **GDPR-31** [EU][M] Google's **sub-processor list** is subscribed to; a review step exists for change notices.
- [ ] **GDPR-32** [EU][M] Every non-Google processor (email provider, SMS gateway, support desk, crash reporting, payment provider, translation, LLM API) has an **Art. 28** contract, appears in the records of processing and in the notice. → template: `templates/third-party-sdk-register.md`
- [ ] **GDPR-33** [EU][M] Processor instructions are documented: which data, which regions, which retention, and that no data is used for the processor's own purposes (model training opt-outs confirmed for LLM vendors).
- [ ] **GDPR-34** [EU][S] Processor audits or certifications (ISO 27001, SOC 2, ISO 27701) collected annually.

## E. International transfers (Chapter V)

- [ ] **GDPR-40** [EU][M] Transfer mechanism identified for Google LLC (EU-US Data Privacy Framework certification) and every US vendor; fallback to **SCCs (2021/914)** with a **Transfer Impact Assessment** if the DPF is invalidated.
- [ ] **GDPR-41** [EU][M] Firebase data locations chosen in the EU where the product allows it (Firestore, Storage, Functions, Realtime Database); products that store data in the US regardless of project region (Firebase Authentication user records, some Google services) are identified and covered by a transfer mechanism and disclosed in the notice.
- [ ] **GDPR-42** [EU][M] Support and admin access from outside the EU (your own staff, Google support) is treated as a transfer; Access Transparency / Access Approval considered for GCP services that support them.
- [ ] **GDPR-43** [EU][S] If any national scheme (e.g. DiGA) forbids third-country processing, the architecture proves it: no US-hosted products, no US support access, EU-only LLM endpoints.

## F. Security of processing (Art. 32) and breaches

- [ ] **GDPR-50** [EU][M] Documented security measures proportionate to risk: encryption in transit and at rest, pseudonymisation, access control, logging, resilience, restore testing, regular effectiveness testing. (Technical detail in files 06–10.)
- [ ] **GDPR-51** [EU][M] **Breach procedure**: detection sources, severity assessment, authority notification within 72 hours (Art. 33), communication to individuals (Art. 34), breach register including non-notified breaches.
- [ ] **GDPR-52** [EU][M] Breach procedure covers Google-side incidents (how you receive notifications from Google and from sub-processors) and misdirected notifications or exports by your own staff.
- [ ] **GDPR-53** [EU][S] Tabletop exercise of a breach scenario once a year; lessons captured.

## G. ePrivacy Directive and device data

- [ ] **GDPR-60** [EU][M] **Art. 5(3) ePrivacy**: any storing of or access to information on the device that is not strictly necessary (analytics identifiers, advertising ID, fingerprinting, Remote Config experiments, Performance Monitoring) requires prior consent; EDPB Guidelines 2/2023 on technical scope applied to SDKs, not only cookies.
- [ ] **GDPR-61** [EU][M] Firebase SDK auto-initialisation of Analytics, Crashlytics, Performance Monitoring and Messaging is disabled until consent (manifest/plist flags plus runtime enable calls).
- [ ] **GDPR-62** [EU][M] Advertising identifier collection disabled (`google_analytics_adid_collection_enabled=false`, no AdSupport framework on iOS); no advertising SDKs in a medical app.
- [ ] **GDPR-63** [EU][S] Push notification tokens treated as personal data; notification content never reveals health status on a lock screen.
- [ ] **GDPR-64** [EU][S] Web build: cookie/consent banner covers Firebase Hosting analytics, Firebase Auth cookies categorised as strictly necessary, reCAPTCHA Enterprise disclosure.

## H. Pseudonymisation and research use

- [ ] **GDPR-70** [EU][M] Pseudonymised data is still personal data; the key store is documented as processing with its own controls (EDPB Guidelines 01/2025 on pseudonymisation).
- [ ] **GDPR-71** [EU][S] Anonymisation claims for aggregated statistics are tested (k-anonymity, re-identification risk) and signed off by the DPO.
- [ ] **GDPR-72** [EU][S] Research exports follow Art. 89 safeguards and national research laws; ethics approval references stored with the export job configuration.

## I. National specifics (examples)

- [ ] **GDPR-80** [EU][S] Country-specific health-data rules checked for each market: Germany (§203 StGB professional secrecy, DiGAV), France (HDS hosting certification, CNIL health reference methodologies), Netherlands (NEN 7510/7512/7513), Italy (Garante health guidelines), Poland (UODO sector guidance, medical documentation retention 20 years).
- [ ] **GDPR-81** [EU][S] Medical-record retention obligations of the provider are separated from the vendor's own retention; the app can retain for the provider without the vendor becoming controller.

## J. Evidence this section needs

Records of processing, DPIA, DPO appointment, notices (all languages), consent logs schema, Art. 28 contracts and DPF/SCC records, transfer impact assessment, breach register, SDK register, erasure runbook with test evidence.
