# 02 · US regulatory requirements (FDA)

> Not legal, regulatory or medical advice. Verify dated statements against primary sources. See [DISCLAIMER.md](../DISCLAIMER.md).

Applies when at least one software function is a device function (see 00). HIPAA, FTC and state privacy laws are in file 04.

## A. Quality system

- [ ] **US-01** [US][M] **QMSR** (21 CFR Part 820 as amended, effective 2 February 2026) implemented: ISO 13485:2016 incorporated by reference plus FDA-specific requirements (records, labeling and packaging controls, references to 21 CFR 830, 803, 806, 821).
- [ ] **US-02** [US][M] Design controls / design and development records exist for the software (design inputs, outputs, review, verification, validation, transfer, changes, design history).
- [ ] **US-03** [US][M] Medical Device File / Device Master Record equivalent lists the exact build configuration (Flutter version, dependency lockfile hash, Firebase project IDs, Cloud Functions revisions).
- [ ] **US-04** [US][M] Complaint handling, CAPA, management review and internal audit procedures exist and are exercised before the first release.
- [ ] **US-05** [US][M] Supplier controls cover Google (Firebase/GCP), Apple and Google app stores, SDK vendors, contract developers; supplier evaluation records exist.

## B. Premarket pathway and submission content

- [ ] **US-10** [US][M] Pathway selected (510(k), De Novo, PMA, exempt) and documented with the classification regulation and product code.
- [ ] **US-11** [US][M] Software documentation per **"Content of Premarket Submissions for Device Software Functions" (June 2023)**: documentation level evaluation, software description, risk management file, software requirements specification, system and software architecture diagram, software design specification (Enhanced), software development and maintenance practices, software testing (unit, integration, system), software version history, unresolved anomalies list.
- [ ] **US-12** [US][M] Cybersecurity documentation per **"Cybersecurity in Medical Devices: Quality System Considerations and Content of Premarket Submissions"** (final September 2023, updated June 2025): security risk management report, threat model, cybersecurity risk assessment, SBOM, security architecture views, security testing, labeling, vulnerability management plan.
- [ ] **US-13** [US][M] **§524B FD&C Act** (cyber devices) obligations addressed: plan to monitor, identify and address postmarket vulnerabilities incl. coordinated vulnerability disclosure; processes providing reasonable assurance the device and related systems are cybersecure; postmarket updates and patches; SBOM of commercial, open-source and off-the-shelf components.
- [ ] **US-14** [US][M] **Off-The-Shelf Software** guidance applied: every pub.dev package, Firebase SDK, OS and browser is OTS software with documented hazard analysis and maintenance plan.
- [ ] **US-15** [US][M] Human factors / usability engineering file per FDA "Applying Human Factors and Usability Engineering to Medical Devices" (2016) and IEC 62366-1; summative validation with the intended user groups.
- [ ] **US-16** [US][M] Labeling per 21 CFR Part 801 (incl. 801.109 prescription-device statement if Rx) with intended use, directions, warnings, software version, cybersecurity information for users.
- [ ] **US-17** [US][S] **Pre-Submission** used to agree on predicate, testing and documentation level for anything novel.
- [ ] **US-18** [US][S] Recognized consensus standards declared (IEC 62304, ISO 14971, IEC 62366-1, IEC 81001-5-1, AAMI TIR57, ANSI/AAMI SW96, UL 2900-2-1) and Declarations of Conformity filled.
- [ ] **US-19** [US][M] For AI/ML functions: **Predetermined Change Control Plan** (PCCP, final guidance December 2024) considered; "AI-Enabled Device Software Functions: Lifecycle Management and Marketing Submission Recommendations" (draft January 2025) followed; Good Machine Learning Practice principles mapped.

## C. Registration, listing, UDI

- [ ] **US-20** [US][M] Establishment registration and device listing (21 CFR Part 807) done before marketing; annual registration fee paid; foreign manufacturers have a **US Agent**.
- [ ] **US-21** [US][M] UDI per 21 CFR Part 830: software UDI displayed on start-up or in an accessible menu (21 CFR 801.50), GUDID submission, new device identifier when a new version changes performance, safety or intended use.
- [ ] **US-22** [US][S] Labeler and GS1/HIBCC/ICCBBA accounts in place; UDI change policy aligned with the EU one.

## D. Postmarket obligations

- [ ] **US-30** [US][M] **Medical Device Reporting** (21 CFR Part 803): 30-day reports for deaths, serious injuries and malfunctions; 5-day reports where remedial action is needed to prevent unreasonable risk; eMDR account set up.
- [ ] **US-31** [US][M] **Corrections and removals** (21 CFR Part 806): software patches that reduce a health risk are reported within 10 working days unless exempt; records kept for non-reportable ones.
- [ ] **US-32** [US][M] Recall procedure (21 CFR Part 7) adapted to software: forced update, remote disable, store removal, user notification.
- [ ] **US-33** [US][M] Postmarket cybersecurity per the 2016 guidance and §524B: vulnerability intake, risk assessment (controlled vs uncontrolled), 30/60-day communication and remediation targets for uncontrolled risk, ISAO participation considered.
- [ ] **US-34** [US][M] Complaint files (ISO 13485 §8.2.2) include store reviews and support tickets that allege a failure.
- [ ] **US-35** [US][S] Real-world performance monitoring plan for AI functions (part of PCCP or lifecycle plan).

## E. Electronic records and signatures

- [ ] **US-40** [US][M] **21 CFR Part 11** scope assessment: which records (design history, training, complaint files, electronic signatures in the QMS tooling) are Part 11 records; audit trails, validation, access controls and signature manifestations in those tools.
- [ ] **US-41** [US][S] If the app captures clinical-trial data (eCOA/ePRO): Part 11 and ICH E6(R3) compliance of the data path, including Firestore audit logging and time-stamping.

## F. Other US federal touchpoints

- [ ] **US-50** [US][S] **ONC** rules: if the app stores or exchanges Electronic Health Information for providers, information-blocking rules (45 CFR Part 171) and certification criteria (HTI-1/HTI-2) assessed; USCDI/US Core FHIR profiles used.
- [ ] **US-51** [US][S] **Section 508 / ADA**: WCAG 2.1 AA (2.2 preferred) for any sale to federal or federally funded programmes; DOJ Title II rule for state and local government web and mobile apps (compliance dates 2026/2027).
- [ ] **US-52** [US][N] **CPT/HCPCS** codes for remote patient monitoring (99453–99458, 99091) and remote therapeutic monitoring (98975–98981) understood if the business model is reimbursement; data requirements (e.g. 16 days of readings) built into the app.
- [ ] **US-53** [US][N] **DEA / state pharmacy** rules if the app supports prescribing or controlled substances.
- [ ] **US-54** [US][N] State telehealth and medical-practice laws if clinicians use the app to deliver care across state lines.

## G. Evidence this section needs

Pathway memo, Pre-Sub feedback, eSTAR package or exemption rationale, §524B cybersecurity plan, SBOM, registration and listing confirmation, GUDID record, MDR/806 SOPs, Part 11 assessment.
