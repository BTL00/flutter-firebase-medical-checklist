# 01 · EU regulatory requirements

> Not legal, regulatory or medical advice. Verify dated statements against primary sources. See [DISCLAIMER.md](../DISCLAIMER.md).

Covers MDR 2017/745 (and IVDR where relevant), the horizontal EU laws that hit a health app, and the national digital-health programmes that decide whether anyone pays for it. GDPR has its own file (03).

## A. Manufacturer obligations (MDR Art. 10)

- [ ] **EU-01** [EU][M] You know who the **legal manufacturer** is (the entity whose name is on the label), and it is the entity that owns the technical documentation and the Firebase/Google Cloud organisation.
- [ ] **EU-02** [EU][M] A quality management system compliant with **ISO 13485:2016** (or equivalent meeting Art. 10(9)) is implemented and, for Class IIa+, certified by the Notified Body.
- [ ] **EU-03** [EU][M] A **Person Responsible for Regulatory Compliance** (Art. 15) is named with documented qualifications; micro/small enterprises may use an external PRRC permanently and continuously at their disposal.
- [ ] **EU-04** [EU][M] If the manufacturer is outside the EU: an **Authorised Representative** (Art. 11) mandate is signed and the AR is named on the label.
- [ ] **EU-05** [EU][M] Importer and distributor roles (Art. 13, 14) are mapped for app-store distribution; a written rationale exists for why Apple/Google are or are not distributors in your supply chain.
- [ ] **EU-06** [EU][M] Financial coverage for potential liability (Art. 10(16)) is in place (product liability insurance appropriate to class).
- [ ] **EU-07** [EU][M] Technical documentation is kept available for 10 years after the last unit placed on the market; for software this is tied to the last app version made available.

## B. Technical documentation (Annex II and III)

- [ ] **EU-10** [EU][M] Device description and specification incl. Basic UDI-DI, intended purpose, variants, previous generations, accessories.
- [ ] **EU-11** [EU][M] Labelling and instructions for use in all languages required by the member states where sold (Annex I §23; national language rules).
- [ ] **EU-12** [EU][M] Design and manufacturing information: software architecture, development lifecycle (IEC 62304 outputs), identification of sites and subcontractors incl. Google as hosting provider.
- [ ] **EU-13** [EU][M] **GSPR checklist** (Annex I) with, for each requirement, applicability, method of conformity, standard applied and evidence location.
- [ ] **EU-14** [EU][M] Benefit-risk analysis and risk management file (ISO 14971:2019 + ISO/TR 24971).
- [ ] **EU-15** [EU][M] Verification and validation: software V&V, usability (IEC 62366-1), cybersecurity testing, clinical evaluation report.
- [ ] **EU-16** [EU][M] Annex III **PMS technical documentation**: PMS plan, PSUR or PMS report, PMCF plan and reports.
- [ ] **EU-17** [EU][M] The documentation references exact software versions and build identifiers; every released build is traceable to a documentation revision.

## C. GSPR specific to software (Annex I Chapter II §17)

- [ ] **EU-20** [EU][M] §17.1 Software designed to ensure repeatability, reliability and performance for intended use; single-fault condition analysis done.
- [ ] **EU-21** [EU][M] §17.2 Development and manufacture according to the state of the art: development lifecycle, risk management, information security, verification and validation (demonstrated through IEC 62304, ISO 14971, IEC 81001-5-1).
- [ ] **EU-22** [EU][M] §17.3 Software intended to be used with mobile computing platforms is designed taking into account **screen size, contrast ratio, connectivity, memory, battery** and the variety of devices; your supported-device matrix exists and is tested.
- [ ] **EU-23** [EU][M] §17.4 **Minimum requirements for hardware, IT network characteristics and IT security measures** needed to run the software as intended are published in the IFU (OS versions, device requirements, network, OS security posture such as "do not use on rooted/jailbroken device" if that is your mitigation).
- [ ] **EU-24** [EU][M] §14.2(d) protection against risks from reasonably foreseeable environmental conditions, incl. loss of connectivity and background termination by the OS.
- [ ] **EU-25** [EU][M] §14.1 and §14.5 for interoperability and compatibility with other devices (wearables, FHIR servers): verified and documented.
- [ ] **EU-26** [EU][S] **MDCG 2019-16** (cybersecurity) used as the interpretation of §17.2 and §17.4; its premarket and postmarket activities mapped into the QMS.

## D. Clinical evaluation (Art. 61, Annex XIV, MDCG 2020-1)

- [ ] **EU-30** [EU][M] Clinical evaluation plan and report exist even for Class I software; MDCG 2020-1 used for MDSW: valid clinical association, technical performance, clinical performance.
- [ ] **EU-31** [EU][M] Literature review, equivalence claims (if any) and clinical data sources documented; equivalence for software requires access to the comparator's technical documentation.
- [ ] **EU-32** [EU][M] Decision on whether a **clinical investigation** (ISO 14155, Art. 62) is required is recorded with rationale; if running one, ethics approval, national/EUDAMED submission, sponsor duties.
- [ ] **EU-33** [EU][M] **PMCF plan** (Annex XIV Part B) defines how real-world performance is collected from the app without turning analytics into unlawful processing.
- [ ] **EU-34** [EU][S] Clinical evaluation is updated at planned intervals and on significant software changes; the trigger list is written in the change-control SOP.

## E. Labelling, IFU and eIFU

- [ ] **EU-40** [EU][M] Label content per Annex I §23.2 adapted for software: manufacturer name/address, device name, "MD" symbol, UDI, version, AR, CE mark with NB number where applicable; shown in an "About / Regulatory information" screen and in store listings.
- [ ] **EU-41** [EU][M] IFU per §23.4 incl. intended purpose, users, residual risks, warnings, §17.4 minimum requirements, how to report incidents, date of issue/revision.
- [ ] **EU-42** [EU][M] Electronic IFU per **Regulation (EU) 2021/2226**: software is in scope; paper copy available on request free of charge within the regulated time; previous versions available; website availability monitored.
- [ ] **EU-43** [EU][M] Symbols per ISO 15223-1 and ISO 20417 used correctly: "MD", "UDI", manufacturer, consult IFU.
- [ ] **EU-44** [EU][M] Translations are controlled documents (not ad-hoc ARB edits): translation vendor, review by clinician, version-locked to release.

## F. UDI and EUDAMED

- [ ] **EU-50** [EU][M] UDI-DI assigned (GS1, HIBCC or ICCBBA) and UDI-PI defined; **MDCG 2018-5**: new UDI-DI for changes to intended use, user interface or performance, UDI-PI (version) for minor changes.
- [ ] **EU-51** [EU][M] UDI shown on a readily accessible screen (plain-text and AIDC-readable form) per Annex VI Part C §6.5.
- [ ] **EU-52** [EU][M] Actor registration (SRN) and device/UDI registration in **EUDAMED**, following the mandatory module timelines; national registration where EUDAMED modules are not yet mandatory.
- [ ] **EU-53** [EU][S] A procedure decides UDI-DI vs UDI-PI for each release, and the app's version string, store version and Basic UDI-DI are kept consistent.

## G. Conformity assessment, DoC, CE marking

- [ ] **EU-60** [EU][M] Conformity assessment route chosen per class (Annex IX, X, XI); for Class I a signed **EU Declaration of Conformity** (Annex IV) exists before the app goes live.
- [ ] **EU-61** [EU][M] CE mark affixed correctly (with NB number if applicable) in-app and in documentation; never on a build that differs from the assessed one.
- [ ] **EU-62** [EU][M] Significant change procedure (MDCG 2020-3 for legacy devices; NB contract for certified devices) defines which releases need NB notification before shipping.
- [ ] **EU-63** [EU][M] Transitional provisions (Reg. 2023/607 extensions to 2027/2028) understood if you have a legacy MDD device; conditions (QMS, application lodged) tracked.
- [ ] **EU-64** [EU][S] You track the Commission's MDR/IVDR targeted-revision proposals (2025 onward) for changes to software classification, PSUR cadence and NB oversight.

## H. Post-market surveillance and vigilance (Art. 83–92)

- [ ] **EU-70** [EU][M] **PMS plan** (Art. 84, Annex III) covers crash data, support tickets, store reviews, security advisories, trend analysis and feedback from clinicians.
- [ ] **EU-71** [EU][M] Class I: PMS report (Art. 85); Class IIa+: **PSUR** (Art. 86) at the required interval and submitted to the NB.
- [ ] **EU-72** [EU][M] **Vigilance** procedure: serious incident reporting within 15 days (2 days for serious public health threat, 10 days for death or unanticipated serious deterioration) via the MIR form; field safety corrective actions with FSN templates.
- [ ] **EU-73** [EU][M] **Trend reporting** (Art. 88) thresholds defined, including for software-only incidents (wrong value displayed, sync lost, notification not delivered).
- [ ] **EU-74** [EU][M] A customer-facing incident reporting channel exists in the app and on the website, in the user's language.
- [ ] **EU-75** [EU][S] Store-listing reviews and crash reports are triaged against the definition of "incident" by a trained person, with records.

## I. EU AI Act (Regulation (EU) 2024/1689)

- [ ] **EU-80** [EU][M] Every ML/AI component is inventoried; for each, whether it makes the product a **high-risk AI system** (Annex I: medical device AI subject to third-party conformity assessment) is decided and recorded.
- [ ] **EU-81** [EU][M] If high-risk: risk management system, data governance, technical documentation (Annex IV), record-keeping/logging, transparency, human oversight, accuracy/robustness/cybersecurity (Art. 9–15); conformity assessment integrated with MDR NB assessment. Application date for Annex I systems is 2 August 2027 unless the Digital Omnibus changes it; track it.
- [ ] **EU-82** [EU][M] Art. 50 transparency: users are told they interact with an AI system (chatbots, generated content) from 2 August 2026.
- [ ] **EU-83** [EU][M] Art. 4 AI literacy: staff who build or operate the AI have documented training (applies since February 2025).
- [ ] **EU-84** [EU][M] Prohibited practices (Art. 5) screened: no emotion recognition in the workplace/education, no manipulative design targeting vulnerable groups.
- [ ] **EU-85** [EU][S] If you consume a general-purpose AI model via API (Gemini, OpenAI, Anthropic): provider obligations vs deployer obligations understood; contractual commitments on documentation obtained.

## J. Other horizontal EU laws

- [ ] **EU-90** [EU][M] **European Health Data Space** (Reg. (EU) 2025/327): if the app exchanges data with EHR systems or claims interoperability, EHR-system conformity (self-declaration, European EHR exchange format) and the voluntary wellness-app label are on the roadmap with the staged application dates.
- [ ] **EU-91** [EU][S] **NIS2** (Dir. 2022/2555): if you sell to hospitals (essential entities), expect supply-chain security clauses; have an ISMS answer ready (ISO/IEC 27001 or IEC 81001-5-1 evidence).
- [ ] **EU-92** [EU][S] **Cyber Resilience Act** (Reg. 2024/2847): MDR/IVDR devices are excluded, but non-device companion software or SDKs you publish may be in scope; decision recorded.
- [ ] **EU-93** [EU][S] **European Accessibility Act** (Dir. 2019/882, applies since 28 June 2025): decide whether your service (e.g. e-commerce elements, subscriptions) is in scope; in any case meet EN 301 549 / WCAG 2.2 AA as "state of the art" for GSPR usability.
- [ ] **EU-94** [EU][M] **Product Liability Directive** (Dir. 2024/2853, applies from December 2026): software is a product; update and cybersecurity obligations affect liability; insurance and release policy reviewed.
- [ ] **EU-95** [EU][S] Consumer law for in-app purchases and subscriptions (Consumer Rights Directive, Digital Content Directive 2019/770) if patients pay.
- [ ] **EU-96** [EU][S] National telemedicine, e-prescription and medical-records laws for each target country (e.g. Poland: Act on Patient Rights, medical documentation regulation, P1 e-health platform) when the app stores or exchanges medical records for a provider.

## K. National digital-health programmes (reimbursement gates)

- [ ] **EU-100** [EU][S] **Germany DiGA** (DVG, DiGAV, BfArM fast-track): CE Class I/IIa/IIb, positive care effect study, data-protection certificate and ISMS/ISO 27001 requirements, interoperability (MIO/FHIR), DiGA-specific privacy rules (no advertising, EU/EEA processing only, no third-country transfers). Also DiPA for care.
- [ ] **EU-101** [EU][S] **France PECAN** and HAS evaluation; ANS interoperability and security framework (PGSSI-S); HDS-certified hosting requirement for health data in France (Google Cloud HDS scope must be checked).
- [ ] **EU-102** [EU][S] **Belgium mHealthBelgium** validation pyramid: M1 (CE + GDPR), M2 (interoperability, eHealth platform), M3 (reimbursement).
- [ ] **EU-103** [EU][N] Other schemes tracked: Austria, Netherlands (NEN 7510), Nordic national app libraries, Poland (pilot programmes), Italy, Spain.
- [ ] **EU-104** [EU][N] UK NHS **DTAC**, DCB0129 (manufacturer clinical safety case, named Clinical Safety Officer) and DSPT if entering the NHS market.

## L. Evidence this section needs

Regulatory strategy document, GSPR checklist, DoC, NB certificate (if any), UDI records, EUDAMED SRN, PMS plan, PSUR/PMS report, vigilance SOP, AI Act inventory, country programme gap analyses.
