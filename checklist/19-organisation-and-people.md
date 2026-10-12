# 19 · Organisation, roles, contracts and people

> Not legal, regulatory or medical advice. Verify dated statements against primary sources. See [DISCLAIMER.md](../DISCLAIMER.md).

Small teams fail audits on roles and contracts more often than on code. This file lists the named responsibilities and agreements a Flutter/Firebase medical product needs in the EU and the US.

## A. Named roles

- [ ] **ORG-01** [ALL][M] Top management representative for the QMS (ISO 13485 §5.5.2) named.
- [ ] **ORG-02** [EU][M] Person Responsible for Regulatory Compliance (MDR Art. 15) named with qualification evidence; external PRRC contract if used.
- [ ] **ORG-03** [EU][M] Authorised Representative (non-EU manufacturers) with mandate; UK Responsible Person and CH-REP if applicable.
- [ ] **ORG-04** [US][M] US Agent (foreign establishments); official correspondent for registration and listing.
- [ ] **ORG-05** [EU][M] Data Protection Officer (where required) and EU representative (non-EU controllers).
- [ ] **ORG-06** [US][M] HIPAA Privacy Official and Security Official.
- [ ] **ORG-07** [ALL][M] Clinical lead / medical advisor accountable for clinical content and safety case (Clinical Safety Officer if selling to the NHS).
- [ ] **ORG-08** [ALL][M] Security lead accountable for the cybersecurity programme and vulnerability handling.
- [ ] **ORG-09** [ALL][M] Product owner for the Firebase/Google Cloud organisation (billing, IAM, support plan); at least two owners with hardware MFA, no single point of failure.
- [ ] **ORG-10** [ALL][S] Usability/human-factors lead and accessibility owner.
- [ ] **ORG-11** [ALL][S] Deputy for each critical role; holiday and departure cover documented.

## B. Competence and training

- [ ] **ORG-20** [ALL][M] Role-based competence requirements written (e.g. Flutter developers: secure coding, 62304 basics, GDPR/HIPAA awareness; reviewers: rules security; support: privacy handling).
- [ ] **ORG-21** [ALL][M] Training plan and records: QMS onboarding, security awareness (yearly), privacy (yearly), AI literacy (AI Act Art. 4), clinical safety basics, platform policy changes.
- [ ] **ORG-22** [ALL][M] Contractors and agencies are trained and bound to the same procedures; access ends with the contract.
- [ ] **ORG-23** [ALL][S] Regulatory and standards knowledge maintained: subscriptions, external consultants, participation in working groups.

## C. Contracts and agreements

- [ ] **ORG-30** [ALL][M] Customer contracts (hospitals, clinics, payers): roles under GDPR/HIPAA, SLAs, incident notification, data return and deletion, audit rights, subcontractor approval, liability caps aligned with insurance, regulatory status statements.
- [ ] **ORG-31** [ALL][M] Google Cloud / Firebase terms, Data Processing Terms, BAA (US) accepted by the right legal entity; copies retained; renewals tracked.
- [ ] **ORG-32** [ALL][M] Apple Developer Program and Google Play Developer agreements held by the manufacturer's legal entity (not a developer's personal account); account ownership succession planned.
- [ ] **ORG-33** [ALL][M] Processor and sub-processor agreements for every vendor (file 03/04); BAAs with downstream vendors (US).
- [ ] **ORG-34** [ALL][M] Device manufacturer agreements (connected devices) defining system manufacturer, vigilance responsibilities, firmware update coordination.
- [ ] **ORG-35** [ALL][M] Terminology and content licences: SNOMED CT (national release centre / IHTSDO Member licence), LOINC (free, attribution), drug databases, validated questionnaires (publisher permission), fonts and icons, medical imagery.
- [ ] **ORG-36** [ALL][M] Open-source licence compliance for all packages (attribution screen, copyleft review).
- [ ] **ORG-37** [ALL][M] Product liability and cyber insurance appropriate to class, markets and contract exposure; EU Product Liability Directive 2024 impact reviewed.
- [ ] **ORG-38** [ALL][S] Notified Body contract (scope, change notification duties, surveillance audits, unannounced audits).
- [ ] **ORG-39** [ALL][S] Research collaboration and data-sharing agreements (universities, hospitals) with ethics and GDPR Art. 89 clauses.
- [ ] **ORG-40** [ALL][S] Terms of use / EULA for patients in each language, consistent with the IFU and privacy notice, reviewed by counsel for consumer law.

## D. Governance and culture

- [ ] **ORG-50** [ALL][M] A change-control board (can be three people) approves intended-use, clinical content and architecture changes; minutes kept.
- [ ] **ORG-51** [ALL][M] Safety and security concerns raised by any team member are logged and reviewed; no-blame problem reporting.
- [ ] **ORG-52** [ALL][M] Marketing and sales material approval includes regulatory review (claims control).
- [ ] **ORG-53** [ALL][S] Ethics review for features touching vulnerable groups, mental health, reproductive health, genetics or children.
- [ ] **ORG-54** [ALL][S] Board/management receives a quarterly compliance and safety dashboard.

## E. Business continuity

- [ ] **ORG-60** [ALL][M] Business continuity plan: loss of key people, loss of Google Cloud access, loss of store accounts, insolvency data-return obligations to customers and patients.
- [ ] **ORG-61** [ALL][M] Escrow or documented hand-over package for customers who require continuity of a clinical system.
- [ ] **ORG-62** [ALL][S] Credentials and recovery codes for critical accounts (Google org super-admin, Apple, Google Play, domain registrar, DNS) stored in a company-controlled vault with two-person recovery.

## F. Evidence this section needs

Organisation chart with regulated roles, appointment letters and qualifications, training matrix and records, contract register with renewal dates, licence register, insurance certificates, change-control board minutes, continuity plan.
