# 06 · Cybersecurity programme

Regulators now treat security as a safety property. Both FDA (§524B, 2023/2025 guidance) and MDR (Annex I §17.2/17.4, MDCG 2019-16) expect a **Secure Product Development Framework**, a threat model, an SBOM, testing evidence and a postmarket vulnerability process. IEC 81001-5-1 is the standard that ties it together. Concrete Flutter and Firebase controls are in files 07–10; this file is the programme around them.

## A. Secure product development framework (IEC 81001-5-1, FDA SPDF)

- [ ] **SEC-01** [ALL][M] Security is in the software development plan with activities per phase: security requirements, threat modelling, secure design review, secure coding rules, security testing, release security review, postmarket.
- [ ] **SEC-02** [ALL][M] **Security requirements** in the SRS: authentication strength, session policy, authorisation model, encryption, logging, integrity, availability targets, secure update, secure configuration, data erasure.
- [ ] **SEC-03** [ALL][M] Secure coding standard for Dart/Flutter and for Node/Python Cloud Functions; lint rules enforced in CI (e.g. `very_good_analysis` or custom `analysis_options.yaml`, ESLint security plugins).
- [ ] **SEC-04** [ALL][M] Security training for developers at least yearly, with records (OWASP Mobile Top 10, MASVS, Firebase security model).
- [ ] **SEC-05** [ALL][M] Security review is a release gate: checklist signed by someone other than the author.
- [ ] **SEC-06** [ALL][S] Security champions role or external security partner named for the product.

## B. Threat modelling and security risk management

- [ ] **SEC-10** [ALL][M] **Threat model** (STRIDE or equivalent) covering: Flutter app on a possibly compromised device, Firestore/Storage rules, Cloud Functions, Auth, App Check, admin tools, CI/CD, developer laptops, Google Cloud organisation, third-party APIs, FHIR connections, push notifications, deep links, web build.
- [ ] **SEC-11** [ALL][M] Data-flow diagrams with trust boundaries; every store of PHI/health data marked; the "attacker with full Firestore read access" scenario answered explicitly.
- [ ] **SEC-12** [ALL][M] **Security risk assessment** separate from safety risk (AAMI TIR57): exploitability-based scoring (CVSS or equivalent), controls, residual risk; security risks with patient-safety impact cross-referenced in the ISO 14971 file.
- [ ] **SEC-13** [ALL][M] Threat model updated on architecture change and at least yearly; version history kept.
- [ ] **SEC-14** [ALL][S] Abuse cases cover insiders (support staff, developers), lost devices, shared family devices, clinicians' shared workstations for the web build.

## C. Security architecture (FDA architecture views)

- [ ] **SEC-20** [ALL][M] Global system view, multi-patient harm view, updatability/patchability view and security use-case views documented (FDA 2023/2025 guidance Appendix 2) or an equivalent set for MDR.
- [ ] **SEC-21** [ALL][M] Cryptography inventory: algorithms, key lengths, libraries, key storage and rotation for TLS, at-rest (Google-managed vs CMEK), device-side (Keychain/Keystore), tokens, backups.
- [ ] **SEC-22** [ALL][M] **Secure update** path: forced-update mechanism, minimum supported version enforced server-side, store release process, rollback plan, time-to-patch targets.
- [ ] **SEC-23** [ALL][M] **Secure configuration baseline** for the Google Cloud project (IAM, org policies, audit logs, App Check, Auth settings) documented and drift-checked.
- [ ] **SEC-24** [ALL][S] Defence in depth: rules + Functions validation + App Check + client checks; no single control is the only barrier to PHI.

## D. Software bill of materials and supply chain

- [ ] **SEC-30** [ALL][M] **SBOM** generated per release in SPDX or CycloneDX from `pubspec.lock`, Gradle and CocoaPods lockfiles, Functions `package-lock.json`/`requirements.txt`, container images; includes Flutter engine, Dart SDK, Firebase SDKs; machine-readable and attached to the release record.
- [ ] **SEC-31** [ALL][M] SBOM fields per NTIA minimum elements plus support status/end-of-life (FDA asks for level of support and EOL date per component).
- [ ] **SEC-32** [ALL][M] Dependency vulnerability scanning in CI (OSV-Scanner, Dependabot for pub, npm audit, Trivy for containers) with triage SLAs by severity.
- [ ] **SEC-33** [ALL][M] Package vetting policy for pub.dev: verified publisher preference, maintenance activity, licence, native code review, no permission creep; approvals recorded in the SOUP register.
- [ ] **SEC-34** [ALL][M] Lockfiles committed; `dart pub get --enforce-lockfile` in CI; no floating versions in Functions.
- [ ] **SEC-35** [ALL][S] Build provenance: CI builds only, signed artifacts, SLSA-style attestation, protected branches, mandatory review, signed commits or verified merges.
- [ ] **SEC-36** [ALL][S] Licence compliance scan (copyleft obligations in a closed app) part of the release gate.

## E. Security testing

- [ ] **SEC-40** [ALL][M] **Static analysis** (Dart analyzer with strict rules, Semgrep, ESLint security) on every PR.
- [ ] **SEC-41** [ALL][M] **Firestore and Storage rules unit tests** in the emulator covering allow and deny cases for every collection and role; run in CI; coverage of rules documented.
- [ ] **SEC-42** [ALL][M] **Mobile app security test** against OWASP MASVS (L2 + R for medical) using MASTG test cases; MobSF or equivalent plus manual testing of storage, IPC, network, platform interaction, code quality, resilience.
- [ ] **SEC-43** [ALL][M] **Penetration test** by an independent party before first release and after major changes (yearly at minimum), scope incl. Firebase backend, Functions, admin tools, web build; report, remediation and retest evidence.
- [ ] **SEC-44** [ALL][M] Fuzz/robustness testing of input parsing (FHIR payloads, BLE frames, deep-link parameters, Function payloads).
- [ ] **SEC-45** [ALL][M] Security regression tests for every fixed vulnerability.
- [ ] **SEC-46** [ALL][S] Cloud configuration scanning (Security Command Center, Forseti-style policies, `gcloud` IAM recommender) scheduled.
- [ ] **SEC-47** [ALL][S] Known-vulnerability test of the exact shipped versions (not just the repo) by scanning the final IPA/APK/AAB and deployed Functions.

## F. Vulnerability management and disclosure

- [ ] **SEC-50** [ALL][M] **Coordinated vulnerability disclosure policy** published (security.txt at `/.well-known/security.txt`, security page, PGP or form), ISO/IEC 29147 and 30111 aligned; acknowledgement and remediation targets stated.
- [ ] **SEC-51** [ALL][M] Vulnerability intake sources monitored: Flutter/Dart security advisories, Firebase release notes, GitHub advisories, NVD/OSV for all SBOM components, Apple/Google platform advisories, CISA KEV.
- [ ] **SEC-52** [ALL][M] Assessment procedure distinguishes **controlled vs uncontrolled risk** (FDA postmarket guidance) with communication and remediation targets (30/60 days for uncontrolled); EU equivalents tied to vigilance.
- [ ] **SEC-53** [ALL][M] Patch pipeline can ship a hotfix to both stores and Functions within the committed time, with expedited review requested from Apple when justified.
- [ ] **SEC-54** [ALL][M] Vulnerability communications to users and customers templated (what, impact, action) and tied to recall/FSCA decisions.
- [ ] **SEC-55** [ALL][S] Participation in an ISAO (e.g. Health-ISAC) or at least a subscription to its advisories.

## G. Incident response and resilience

- [ ] **SEC-60** [ALL][M] **Incident response plan** with roles, severity levels, Google Cloud incident intake, forensics (Cloud Audit Logs export to an immutable bucket), containment actions (revoke tokens, disable Auth providers, rotate keys, lock rules), communication (customers, authorities, users), and post-incident review.
- [ ] **SEC-61** [ALL][M] Incident plan links to GDPR 72-hour, HIPAA/BAA and FTC HBNR timelines and to vigilance reporting where safety is affected.
- [ ] **SEC-62** [ALL][M] Logging and detection: Cloud Audit Logs (incl. Data Access logs for Firestore and Storage) retained and alerted; anomaly alerts (mass reads, rule deploys, IAM changes, new service account keys, App Check disablement).
- [ ] **SEC-63** [ALL][M] Backups and restore tested; RPO/RTO defined in the SRS and proven in a drill.
- [ ] **SEC-64** [ALL][M] Availability design: graceful degradation offline, read-only mode, status page, user guidance when the backend is down; Firestore multi-region vs regional decision documented.
- [ ] **SEC-65** [ALL][S] Tabletop exercise yearly covering a leaked service-account key, a malicious insider and a Firestore rules regression.

## H. Security labeling and customer documentation

- [ ] **SEC-70** [ALL][M] IFU/labeling include: supported OS versions, device requirements, recommended device security settings, network requirements, what the app does on rooted/jailbroken devices, how to report a vulnerability, how updates are delivered, what data is stored where, end-of-support policy.
- [ ] **SEC-71** [ALL][M] Customer-facing security documentation (for hospitals): architecture overview, data flows, encryption, access control, logging, SBOM availability, pen-test summary, certifications, MDS2 form (ANSI/NEMA HN 1-2019) for US hospital procurement.
- [ ] **SEC-72** [ALL][S] End-of-life / end-of-support policy published; how data is returned or deleted at termination.

## I. Certifications and frameworks (choose deliberately)

- [ ] **SEC-80** [ALL][S] ISO/IEC 27001 (with 27701 and 27799 as health extensions) or SOC 2 Type II scoped to the product; required by many hospital tenders and by DiGA.
- [ ] **SEC-81** [ALL][S] HITRUST or NIST CSF 2.0 mapping if US enterprise customers ask; HHS 405(d) HICP practices referenced.
- [ ] **SEC-82** [ALL][N] Cyber Essentials Plus (UK), BSI C5 or national equivalents where tenders require them.

## J. Evidence this section needs

Security plan, security requirements, threat model, security risk assessment, architecture views, SBOM per release, scan and pen-test reports, CVD policy, vulnerability log, incident response plan and drill records, security labeling, MDS2.
