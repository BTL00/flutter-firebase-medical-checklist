# Flutter + Firebase medical app checklist (EU and US)

An open, vendor-neutral checklist for taking a **Flutter app on Firebase** from "works" to "can be placed on the market as medical software" in the **European Union** and the **United States**. It covers qualification and classification, MDR and FDA obligations, GDPR and HIPAA, the quality system and software lifecycle, cybersecurity, the Flutter client, the Firebase backend, data handling, interoperability, clinical safety, usability and accessibility, V&V, release and app stores, post-market surveillance, AI components, documentation and the people and contracts behind it all.

**837 items** · 20 files · 8 templates · every item has an ID, a market tag and a priority.

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC_BY_4.0-lightgrey.svg)](LICENSE)
![Items](https://img.shields.io/badge/items-837-blue)
[![lint](https://github.com/BTL00/flutter-firebase-medical-checklist/actions/workflows/lint.yml/badge.svg)](https://github.com/BTL00/flutter-firebase-medical-checklist/actions/workflows/lint.yml)

> **Not legal or regulatory advice.** This is an engineering checklist written from production work. It tells you what to check and where the requirement comes from; it does not replace a regulatory consultant, a Notified Body, a lawyer or a DPO. Regulations and Firebase change; verify dates and product lists against primary sources before relying on them.

## Who this is for

- Flutter developers who have been told "it has to be compliant" and want the full list, not a blog post.
- Founders and product owners sizing the work before a hospital pilot, a DiGA application or a 510(k).
- QA, regulatory and security people who need the Flutter- and Firebase-specific detail that generic SaMD checklists skip.
- Auditors and hospital IT who want a structured way to question a vendor.

## How to use it

1. **Start with file 00.** Decide, per software function, whether you are a medical device in the EU and in the US and which class. Everything else depends on that.
2. **Fork or copy the `checklist/` folder** into your project's documentation and tick items by changing `- [ ]` to `- [x]`. Keep the IDs; they are stable and you can reference them in requirements, PRs and audit evidence (`FB-36`, `GDPR-21`).
3. **Filter by market and priority.** Each item carries `[EU]`, `[US]` or `[ALL]` and `[M]` must, `[S]` should, `[N]` nice to have. `tools/score.sh EU` or `tools/score.sh US` prints progress per file.
4. **Treat "I don't know" as a "no".** Every item is phrased so that you can answer yes, no or unknown with the repository and the Firebase console open.
5. **Use the templates** when an item points to one (`templates/`). They are starting points for the documents an auditor will ask for.
6. Order of work that has held up in practice: 00 → 03/04 → 08 → 07 → 09 → 06 → 05 → 14 → the rest.

## Contents

| # | File | Scope | Items |
|---|---|---|---|
| 00 | [Scope and qualification](checklist/00-scope-and-qualification.md) | Intended use, MDCG 2019-11, Rule 11, FDA §520(o), CDS and wellness tests, IEC 62304 class | 33 |
| 01 | [Regulatory EU](checklist/01-regulatory-eu.md) | MDR Art. 10, Annex I/II/III, GSPR §17, clinical evaluation, UDI/EUDAMED, PMS/vigilance, AI Act, EHDS, DiGA/PECAN | 65 |
| 02 | [Regulatory US](checklist/02-regulatory-us.md) | QMSR, premarket software and cybersecurity documentation, §524B, UDI/GUDID, MDR/806, Part 11, ONC | 31 |
| 03 | [Privacy GDPR](checklist/03-privacy-gdpr.md) | Lawful basis, rights, DPIA, processors, transfers, ePrivacy for SDKs, pseudonymisation | 40 |
| 04 | [Privacy US](checklist/04-privacy-us.md) | HIPAA Privacy/Security/Breach rules, Google BAA scope, FTC HBNR, state health-privacy laws, store rules | 43 |
| 05 | [Quality management and lifecycle](checklist/05-quality-management-and-lifecycle.md) | ISO 13485/QMSR, IEC 62304 processes, ISO 14971, configuration and SOUP, IEC 62366-1, tool validation | 55 |
| 06 | [Cybersecurity](checklist/06-cybersecurity.md) | IEC 81001-5-1 / FDA SPDF, threat model, SBOM, testing, CVD, incident response, labeling | 49 |
| 07 | [Flutter client](checklist/07-flutter-client.md) | Build and obfuscation, secrets, local storage, app lock, network, device integrity, clinical UI correctness, web | 57 |
| 08 | [Firebase backend](checklist/08-firebase-backend.md) | Org and IAM, data location, Firestore/Storage rules, Functions, Auth, App Check, Analytics/Crashlytics/FCM, backups | 76 |
| 09 | [Data lifecycle](checklist/09-data-lifecycle.md) | Inventory, pseudonymisation, encryption, audit trail, offline sync, retention and erasure, portability | 42 |
| 10 | [Identity and access](checklist/10-identity-and-access.md) | Roles, proxies, tenants, authentication strength, admin tooling, access reviews | 25 |
| 11 | [Interoperability](checklist/11-interoperability.md) | FHIR, terminologies, SMART on FHIR, HealthKit/Health Connect, BLE medical devices, exposed APIs | 30 |
| 12 | [Clinical safety and performance](checklist/12-clinical-safety-and-performance.md) | Algorithm specs, performance evidence, dose calculators, alarms, content, studies, safety case | 33 |
| 13 | [Usability, accessibility, localisation](checklist/13-usability-accessibility-localisation.md) | WCAG 2.2 / EN 301 549 / 508, clinical UI properties, i18n, IFU | 35 |
| 14 | [Verification and validation](checklist/14-verification-and-validation.md) | Plans, traceability, Flutter test pyramid, emulator, device matrix, non-functional, validation, anomalies | 39 |
| 15 | [Release, DevOps, app stores](checklist/15-release-devops-app-stores.md) | CI/CD gates, signing, release records, staged rollout, Apple and Google health policies, operations | 38 |
| 16 | [Post-market monitoring](checklist/16-post-market-monitoring.md) | Feedback routing, complaints and vigilance, PSUR, periodic reviews, obsolescence | 22 |
| 17 | [AI/ML components](checklist/17-ai-ml-components.md) | Inventory, AI Act and FDA PCCP, data governance, subgroup performance, LLM controls, oversight, monitoring | 34 |
| 18 | [Documentation deliverables](checklist/18-documentation-deliverables.md) | The document set an auditor expects, by standard | 56 |
| 19 | [Organisation and people](checklist/19-organisation-and-people.md) | Named roles, training, contracts and licences, governance, continuity | 34 |

Templates: [intended use statement](templates/intended-use-statement.md) · [SOUP register](templates/soup-register.md) · [traceability matrix](templates/traceability-matrix.md) · [DPIA outline](templates/dpia-outline.md) · [risk register](templates/risk-register.md) · [Firebase service inventory](templates/firebase-service-inventory.md) · [third-party SDK register](templates/third-party-sdk-register.md) · [release record](templates/release-record.md)

## What is in scope

- Flutter apps for iOS, Android and web.
- Firebase and the Google Cloud services around it (Firestore, Storage, Functions/Cloud Run, Authentication/Identity Platform, App Check, FCM, Hosting, Analytics, Crashlytics, Remote Config, Secret Manager, Logging, BigQuery, Vertex AI).
- Software as a medical device and companion apps for devices, including wearables and BLE sensors.
- EU (MDR/IVDR, GDPR, AI Act, EHDS, national programmes) and US (FDA, HIPAA, FTC, state laws), with pointers for the UK and Switzerland.

Out of scope: hardware design, IVD laboratory workflows, EHR certification in depth, and anything that needs a lawyer to answer for your specific company.

## Standards and rules referenced

MDR 2017/745 · IVDR 2017/746 · MDCG 2019-11, 2019-16, 2020-1, 2018-5, 2021-24, 2023-4 · Reg. 2021/2226 (eIFU) · AI Act 2024/1689 · EHDS 2025/327 · GDPR · ePrivacy Directive · NIS2 · CRA · EAA · PLD 2024/2853 · FD&C Act §201(h), §520(o), §524B · 21 CFR 820 (QMSR), 801, 803, 806, 807, 830, Part 11 · FDA guidances on device software functions, cybersecurity, CDS, general wellness, OTS software, PCCP, AI-enabled devices, human factors · HIPAA 45 CFR Parts 160/164 · FTC HBNR 16 CFR 318 · state health-privacy laws · ISO 13485 · IEC 62304 · ISO 14971 · IEC 62366-1 · IEC 81001-5-1 · IEC 82304-1 · ISO 14155 · AAMI TIR57, SW96, TIR45 · ISO/IEC 27001, 27701, 42001 · OWASP MASVS/MASTG · WCAG 2.2, EN 301 549 · HL7 FHIR, SMART on FHIR, IPS, US Core · SNOMED CT, LOINC, UCUM · IEEE 11073.

## Maintainer

Written and maintained by [Piotr Bomba](https://piotrbomba.com), who builds Flutter and Firebase apps for healthcare (the most recent one is in a clinical trial) and came to this from medical physics research. Related material on the site:

- [How to audit a Flutter and Firebase app that stores patient data](https://piotrbomba.com/tutorials/flutter-firebase-medical-app-security-audit-checklist) (the short security version of this list)
- [Securing a Flutter + Firebase app for medical data](https://piotrbomba.com/tutorials/securing-a-flutter-firebase-app-for-medical-data) (course)
- [Security and GDPR audit of a Flutter and Firebase medical app](https://piotrbomba.com/services/flutter-firebase-medical-app-security-gdpr-audit) (fixed-scope read-only review with a written report)

If this checklist saved you a week, a star and a link back are the licence fee.

## Contributing and licence

Issues and pull requests are welcome; see [CONTRIBUTING.md](CONTRIBUTING.md). The content is licensed under [CC BY 4.0](LICENSE): use it, copy it into your QMS, translate it, as long as you keep the attribution.
