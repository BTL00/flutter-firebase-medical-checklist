# 11 · Interoperability, standards and connected devices

> Not legal, regulatory or medical advice. Verify dated statements against primary sources. See [DISCLAIMER.md](../DISCLAIMER.md).

Hospitals, payers, national platforms and the EHDS all expect FHIR. Sensors and wearables bring their own standards. Interoperability is also a regulatory requirement (MDR Annex I §14, ONC rules, DiGA, EHDS).

## A. Clinical data standards

- [ ] **IOP-01** [ALL][M] Clinical data model mapped to **HL7 FHIR R4** (R4B/R5 where partners require) resources (Patient, Observation, Condition, MedicationStatement, QuestionnaireResponse, DocumentReference, Device, Provenance); mapping document maintained.
- [ ] **IOP-02** [ALL][M] Regional profiles used: **US Core** (ONC/USCDI) for the US; national base profiles in the EU (e.g. HL7 Europe, country base profiles) and the **International Patient Summary** for cross-border; EHDS European EHR exchange format tracked.
- [ ] **IOP-03** [ALL][M] Terminologies: **SNOMED CT** (licence per country via national release centre / Member licence), **LOINC** for observations and questionnaires, **ICD-10/ICD-11** for diagnoses, **UCUM** for units, **RxNorm** (US) / **ATC** and national drug codes (EU) for medication; code versions recorded.
- [ ] **IOP-04** [ALL][M] Units and reference ranges carried with every Observation; conversions tested against reference tables.
- [ ] **IOP-05** [ALL][M] Date/time encoded ISO 8601 with offsets; partial dates handled per FHIR rules.
- [ ] **IOP-06** [ALL][S] Questionnaires modelled as FHIR Questionnaire / QuestionnaireResponse with versioning, so PRO instruments keep their licensed wording and scoring.
- [ ] **IOP-07** [ALL][S] Provenance resources for device-sourced and manually entered data.

## B. Exchange with EHRs and national platforms

- [ ] **IOP-10** [ALL][M] **SMART on FHIR** (OAuth 2.0 / OpenID Connect) used for EHR launch and patient-access APIs; PKCE; scopes minimal; token storage per file 07.
- [ ] **IOP-11** [ALL][M] FHIR server choice documented (Google Cloud Healthcare API FHIR store, partner EHR, national platform); region and BAA/DPA covered; data residency consistent with file 08.
- [ ] **IOP-12** [ALL][M] Patient identity stays with the provider or national identity system; your app stores the pseudonym and a reference, not a copy of the identity record, unless the role requires it.
- [ ] **IOP-13** [ALL][M] Inbound FHIR payloads validated against profiles (schema, cardinality, value sets) before writing to Firestore; invalid data quarantined, not dropped.
- [ ] **IOP-14** [ALL][M] Outbound data has a consent/authorisation check and an audit record per exchange (what, to whom, legal basis).
- [ ] **IOP-15** [ALL][S] Bulk data (FHIR Bulk Data / `$export`) and subscriptions handled with backpressure, retries and idempotency.
- [ ] **IOP-16** [ALL][S] National platform integration requirements collected per market (Poland P1/e-zdrowie, Germany TI/ePA/MIO, France Mon espace santé/DMP, Netherlands MedMij, Nordic national services, US TEFCA/QHINs) with timelines.
- [ ] **IOP-17** [ALL][S] Legacy interfaces (HL7 v2, CDA, DICOM for images) handled through a gateway rather than in the Flutter app.

## C. Platform health data (HealthKit, Health Connect)

- [ ] **IOP-20** [ALL][M] Data types read/written are minimal and listed; permission rationale shown; user can revoke and the app degrades gracefully.
- [ ] **IOP-21** [ALL][M] Platform rules honoured: HealthKit data not stored in iCloud, not used for advertising, not sold; Health Connect data used only for declared health purposes, deletion supported, history read limited (30 days by default) and justified when extended.
- [ ] **IOP-22** [ALL][M] Provenance recorded (source app/device, manual vs automatic); clinical algorithms do not treat consumer wearable data as medical-grade unless the source is a cleared device and the risk file says so.
- [ ] **IOP-23** [ALL][M] Background delivery / passive reads behave correctly when the OS restricts background work; gaps are shown, not interpolated.
- [ ] **IOP-24** [ALL][S] Write-back to platform health stores only for data types the user expects, with units and metadata set.

## D. Bluetooth and connected medical devices

- [ ] **IOP-30** [ALL][M] Connected devices listed with their regulatory status (CE/FDA cleared or consumer), communication protocol and firmware versions tested; the app's intended use statement names supported devices.
- [ ] **IOP-31** [ALL][M] Standard profiles used where available: **Bluetooth GATT health profiles** (Blood Pressure, Glucose, Pulse Oximeter, Weight Scale, Thermometer, Continuous Glucose Monitoring) and **ISO/IEEE 11073** PHD nomenclature; proprietary protocols documented and licensed.
- [ ] **IOP-32** [ALL][M] BLE security: pairing/bonding mode, encryption and MITM protection assessed; spoofed-device scenario in the threat model; device identity verified before accepting readings.
- [ ] **IOP-33** [ALL][M] Data integrity from device to Firestore: CRC/validation, duplicate detection, timestamp reconciliation (device clock vs phone clock), units from the device record.
- [ ] **IOP-34** [ALL][M] Failure modes tested: disconnect mid-transfer, low battery, firmware mismatch, multiple phones paired, OS Bluetooth permission revoked.
- [ ] **IOP-35** [ALL][M] If the app controls a device (dose, stimulation, settings), the control path is in the highest safety class, with confirmation, limits and server-independent safety interlocks.
- [ ] **IOP-36** [ALL][S] Combination with the device manufacturer: contracts define who is the manufacturer of the system, who handles vigilance and firmware updates.

## E. APIs you expose

- [ ] **IOP-40** [ALL][M] Public or partner APIs are documented (OpenAPI/FHIR CapabilityStatement), versioned, authenticated (OAuth 2.0 client credentials / SMART backend services), rate-limited and audited.
- [ ] **IOP-41** [ALL][M] Information-blocking (US) and EHDS access rights (EU) considered when deciding what you must make available to patients and providers and in what format.
- [ ] **IOP-42** [ALL][S] Conformance testing (Inferno for US Core, Touchstone, national test suites) results stored as evidence.

## F. Evidence this section needs

FHIR mapping document, terminology licences and versions, profile validation reports, SMART configuration, device compatibility list and test reports, BLE security assessment, API documentation, conformance test results.
