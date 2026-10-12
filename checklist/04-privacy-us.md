# 04 · Privacy: HIPAA, FTC and US state law

Two very different regimes apply depending on who your customer is: HIPAA when you work for a covered entity, FTC and state consumer-health laws when you sell to consumers directly. Many apps are in both.

## A. Which regime applies

- [ ] **USP-01** [US][M] Determined per customer segment whether you are a **HIPAA business associate** (working on behalf of a covered entity: provider, plan, clearinghouse) or a consumer-facing app outside HIPAA.
- [ ] **USP-02** [US][M] If outside HIPAA: **FTC Health Breach Notification Rule** (16 CFR Part 318, amended rule effective July 2024) applicability assessed; most health apps that draw data from multiple sources are "vendors of personal health records".
- [ ] **USP-03** [US][M] **FTC Act §5** (unfair or deceptive practices): privacy notice and in-app statements match actual data flows, SDK behaviour and retention; recent FTC health-app enforcement reviewed (GoodRx, BetterHelp, Premom, Flo).
- [ ] **USP-04** [US][M] **COPPA** (children under 13) assessed; verifiable parental consent if in scope; no behavioural advertising to children.
- [ ] **USP-05** [US][M] **42 CFR Part 2** assessed if substance-use-disorder records from Part 2 programmes are handled (2024 final rule aligns consent with HIPAA but keeps extra limits).

## B. HIPAA Privacy Rule (45 CFR Part 164 Subpart E)

- [ ] **HIP-01** [US][M] **Business Associate Agreement** signed with each covered entity customer before PHI flows; your template BAA is reviewed by counsel.
- [ ] **HIP-02** [US][M] **BAA with Google Cloud** executed in the Cloud Console for the organisation/projects that hold PHI; only Firebase/GCP products on Google's "HIPAA Included Functionality" list are used with PHI.
- [ ] **HIP-03** [US][M] Products **not** on Google's covered list never receive PHI, including in free text, custom keys or user properties: Google Analytics for Firebase, Crashlytics, Performance Monitoring, Remote Config, A/B Testing, In-App Messaging. Verify the current list; it changes.
- [ ] **HIP-04** [US][M] Downstream sub-business-associates (SMS gateway, email provider, support desk, LLM API, transcription) each have a BAA or receive no PHI.
- [ ] **HIP-05** [US][M] **Minimum necessary** standard applied to role-based access: clinicians see assigned patients; support staff see pseudonymised views.
- [ ] **HIP-06** [US][M] Uses and disclosures limited to what the BAA permits; no de-identification for your own purposes unless the BAA allows it and it meets §164.514 (Safe Harbor 18 identifiers or Expert Determination).
- [ ] **HIP-07** [US][M] Patient rights supported for the covered entity: access (within 30 days, electronic copy), amendment, accounting of disclosures; your audit log can produce the accounting.
- [ ] **HIP-08** [US][S] Notice of Privacy Practices is the covered entity's; your in-app privacy notice for consumer features is separate and does not claim to be HIPAA-covered where it is not.
- [ ] **HIP-09** [US][S] Marketing and sale of PHI prohibitions understood; no PHI in ad pixels, no third-party tracking on authenticated pages (HHS tracking-technology bulletin, as modified by litigation).

## C. HIPAA Security Rule (45 CFR 164.308, .310, .312, .316)

- [ ] **HIP-20** [US][M] **Risk analysis** (§164.308(a)(1)(ii)(A)) documented, enterprise-wide, covering Firebase, Cloud Functions, admin tools, laptops and CI; updated annually and on major change; HHS Security Risk Assessment tool or NIST SP 800-66 r2 used.
- [ ] **HIP-21** [US][M] **Risk management plan** with owners and due dates for each identified risk.
- [ ] **HIP-22** [US][M] Named **Security Official** and **Privacy Official**.
- [ ] **HIP-23** [US][M] Workforce security: authorisation, clearance, termination procedures; Google Cloud IAM and Firebase console access revoked on the day of departure.
- [ ] **HIP-24** [US][M] Information access management: role-based access policy maps to Firestore rules, custom claims and IAM roles.
- [ ] **HIP-25** [US][M] Security awareness training with records; phishing, malware, log-in monitoring, password management.
- [ ] **HIP-26** [US][M] **Security incident procedures**: detection, response, mitigation, documentation; integrates with Google Cloud incident notifications.
- [ ] **HIP-27** [US][M] **Contingency plan**: data backup plan, disaster recovery plan, emergency mode operation, testing and revision, criticality analysis; Firestore PITR and scheduled backups with tested restore.
- [ ] **HIP-28** [US][M] Periodic technical and non-technical **evaluation** (§164.308(a)(8)).
- [ ] **HIP-29** [US][M] **Physical safeguards** (§164.310): workstation and device policy for staff laptops and phones with console access; Google's data-centre controls inherited via BAA and SOC reports.
- [ ] **HIP-30** [US][M] **Technical safeguards** (§164.312): unique user IDs, emergency access, automatic logoff, encryption/decryption, audit controls, integrity controls, person/entity authentication, transmission security. Each mapped to a concrete Flutter or Firebase control in files 07–10.
- [ ] **HIP-31** [US][M] Documentation retention 6 years (§164.316); policies versioned and available to the workforce.
- [ ] **HIP-32** [US][M] **Proposed Security Rule update** (NPRM published January 2025: mandatory MFA, encryption, asset inventory, network map, 72-hour restore, annual compliance audit, vulnerability scanning every 6 months, penetration testing yearly) tracked; design to the proposed text now.

## D. HIPAA Breach Notification Rule (Subpart D)

- [ ] **HIP-40** [US][M] Breach risk-assessment procedure (four-factor test) and documentation of "low probability of compromise" determinations.
- [ ] **HIP-41** [US][M] As a business associate: notify the covered entity without unreasonable delay and within the BAA deadline (often 5–10 days, legal max 60 days).
- [ ] **HIP-42** [US][M] Encryption that meets HHS guidance (NIST-validated, keys not compromised) documented so that lost encrypted data qualifies for the safe harbor.

## E. FTC Health Breach Notification Rule (consumer apps)

- [ ] **FTC-01** [US][M] "Breach of security" definition includes **unauthorised disclosure**, not just hacking: sharing with an analytics or advertising SDK without authorisation is a reportable breach.
- [ ] **FTC-02** [US][M] Notification to individuals and the FTC within 60 calendar days (FTC notice at the same time as individuals when 500+ affected); media notice at 500+ in a state.
- [ ] **FTC-03** [US][M] Electronic notice content and method per the amended rule prepared as a template.

## F. State consumer health privacy laws

- [ ] **ST-01** [US][M] **Washington My Health My Data Act**: consent before collection and before sharing of consumer health data, separate privacy policy, geofencing ban, deletion rights, private right of action. Applies to most consumer apps with Washington users.
- [ ] **ST-02** [US][M] **Nevada SB 370** and **Connecticut** consumer health data provisions mapped the same way.
- [ ] **ST-03** [US][M] **New York Health Information Privacy Act** status checked; if in force, authorisation and retention rules applied.
- [ ] **ST-04** [US][M] Comprehensive state privacy laws (California CCPA/CPRA, Virginia, Colorado, Texas, Oregon and others): sensitive-data consent or opt-out, data protection assessments, universal opt-out signals on web, "Do Not Sell or Share" where applicable; the HIPAA exemption only covers PHI, not consumer data.
- [ ] **ST-05** [US][M] **California CMIA** (Confidentiality of Medical Information Act) applies to apps "designed to maintain medical information"; treats them like providers for confidentiality.
- [ ] **ST-06** [US][S] State breach-notification laws (all 50) handled by a single procedure keyed on residency; Illinois BIPA if biometric data (face, voice, fingerprint templates) is processed.
- [ ] **ST-07** [US][S] Texas and other states' data-broker and health-app specific statutes reviewed annually; a legal-watch owner is named.

## G. Platform rules that function as privacy law

- [ ] **PLAT-01** [ALL][M] **Apple**: HealthKit data never stored in iCloud, never used for advertising or data mining, never sold; privacy policy required; App Privacy "nutrition label" matches SDK behaviour; account deletion available in-app.
- [ ] **PLAT-02** [ALL][M] **Google Play**: Health apps declaration, Health Connect permissions with rationale screen and privacy policy link, Data Safety form consistent with every SDK, in-app account and data deletion with a web link, no advertising use of Health Connect data.
- [ ] **PLAT-03** [ALL][S] App Tracking Transparency prompt not needed because there is no tracking; verified by checking SDK behaviour, not assumed.

## H. Evidence this section needs

Regime determination memo, BAAs (customers, Google, sub-BAs), HIPAA risk analysis and management plan, policies and procedures set, training records, incident and breach logs, FTC HBNR template, state-law matrix, platform declarations.
