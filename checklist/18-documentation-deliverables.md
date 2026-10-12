# 18 · Documentation deliverables

The documents an auditor, Notified Body or FDA reviewer expects to see, with the standard or rule each one satisfies. Tick a document only when it exists, is approved, is at the right version and is traceable to the shipped build.

## A. Regulatory and quality

- [ ] **DOC-01** [ALL][M] Regulatory strategy and qualification/classification rationale (MDCG 2019-11; FDA §520(o) analysis)
- [ ] **DOC-02** [ALL][M] Intended use / intended purpose statement
- [ ] **DOC-03** [ALL][M] Quality manual, process map, SOP index (ISO 13485 / QMSR)
- [ ] **DOC-04** [EU][M] GSPR checklist (MDR Annex I)
- [ ] **DOC-05** [EU][M] Technical documentation per Annex II and III, EU Declaration of Conformity, NB certificates
- [ ] **DOC-06** [US][M] Premarket submission (510(k)/De Novo/PMA) or exemption rationale; registration and listing records
- [ ] **DOC-07** [ALL][M] UDI records (Basic UDI-DI, UDI-DI/PI policy, GUDID/EUDAMED submissions)
- [ ] **DOC-08** [ALL][M] Labeling set: label content, IFU (all languages), eIFU hosting records, store listings as controlled copies
- [ ] **DOC-09** [ALL][M] Standards list with editions and declarations of conformity

## B. Software lifecycle (IEC 62304)

- [ ] **DOC-10** [ALL][M] Software development plan (incl. agile mapping)
- [ ] **DOC-11** [ALL][M] Software requirements specification
- [ ] **DOC-12** [ALL][M] Software architecture document (incl. Firebase services, data flows, segregation, SOUP requirements)
- [ ] **DOC-13** [ALL][M] Detailed design for class C items (and as needed for B)
- [ ] **DOC-14** [ALL][M] Unit verification records (CI reports, review records)
- [ ] **DOC-15** [ALL][M] Integration and system test plans, specifications and reports
- [ ] **DOC-16** [ALL][M] Software release record (version, build hash, configuration baseline, known anomalies, approvals)
- [ ] **DOC-17** [ALL][M] Software maintenance plan
- [ ] **DOC-18** [ALL][M] Configuration management plan and baseline per release
- [ ] **DOC-19** [ALL][M] SOUP register with anomaly evaluation → `templates/soup-register.md`
- [ ] **DOC-20** [ALL][M] Problem-report log and trend reports
- [ ] **DOC-21** [ALL][M] Traceability matrix → `templates/traceability-matrix.md`
- [ ] **DOC-22** [ALL][M] Software version history and unresolved anomalies list (FDA)

## C. Risk, usability, clinical

- [ ] **DOC-30** [ALL][M] Risk management plan, risk analysis (hazard log), risk control verification, risk management report (ISO 14971) → `templates/risk-register.md`
- [ ] **DOC-31** [ALL][M] Usability engineering file: use specification, UI specification, evaluation plans, formative and summative reports (IEC 62366-1)
- [ ] **DOC-32** [ALL][M] Clinical evaluation plan and report (MDR) / clinical performance evidence (FDA); PMCF plan and reports
- [ ] **DOC-33** [ALL][M] Algorithm specifications and reference test sets
- [ ] **DOC-34** [ALL][S] Clinical safety case and hazard log sign-off

## D. Cybersecurity

- [ ] **DOC-40** [ALL][M] Security management plan / SPDF description (IEC 81001-5-1)
- [ ] **DOC-41** [ALL][M] Threat model and security risk assessment (AAMI TIR57)
- [ ] **DOC-42** [ALL][M] Security architecture views (FDA)
- [ ] **DOC-43** [ALL][M] SBOM per release with support/EOL status
- [ ] **DOC-44** [ALL][M] Security test reports: SAST, rules tests, MASVS, penetration test, remediation evidence
- [ ] **DOC-45** [ALL][M] Vulnerability management plan and CVD policy; vulnerability log
- [ ] **DOC-46** [ALL][M] Incident response plan and exercise records
- [ ] **DOC-47** [ALL][M] Security labeling content and customer security documentation (MDS2 for US hospitals)

## E. Privacy

- [ ] **DOC-50** [EU][M] Records of processing activities (GDPR Art. 30)
- [ ] **DOC-51** [EU][M] Data protection impact assessment → `templates/dpia-outline.md`
- [ ] **DOC-52** [ALL][M] Privacy notices (all languages, versioned), consent texts and consent-log schema
- [ ] **DOC-53** [ALL][M] Processor/sub-processor register with contracts (Art. 28, BAAs) and transfer mechanisms → `templates/third-party-sdk-register.md`
- [ ] **DOC-54** [US][M] HIPAA risk analysis, risk management plan, policies and procedures, training records
- [ ] **DOC-55** [ALL][M] Breach/incident register and notification templates (GDPR, HIPAA, FTC HBNR, state)
- [ ] **DOC-56** [ALL][M] Data inventory, classification, retention schedule, erasure runbook with test evidence
- [ ] **DOC-57** [ALL][M] Firebase service inventory with regions, data categories and contract coverage → `templates/firebase-service-inventory.md`

## F. Operations and post-market

- [ ] **DOC-60** [ALL][M] PMS plan; PMS report or PSUR; vigilance SOP and reports
- [ ] **DOC-61** [ALL][M] Complaint-handling SOP and records; CAPA records
- [ ] **DOC-62** [ALL][M] Release SOP and release records; store declaration copies
- [ ] **DOC-63** [ALL][M] Runbooks, on-call roster, backup/restore drill records
- [ ] **DOC-64** [ALL][M] Access control policy, access review records, JML checklists
- [ ] **DOC-65** [ALL][M] Training matrix and records (quality, security, privacy, AI literacy)
- [ ] **DOC-66** [ALL][M] Supplier evaluation records (Google, Apple, SDK vendors, contractors)
- [ ] **DOC-67** [ALL][M] Management review minutes; internal audit reports
- [ ] **DOC-68** [ALL][S] Tool validation / computer software assurance records

## G. AI (if applicable)

- [ ] **DOC-70** [ALL][M] AI inventory and qualification memo; datasheets; model cards; performance and subgroup reports; monitoring plan; PCCP; AI Act Annex IV technical documentation where high-risk

## H. Document hygiene

- [ ] **DOC-80** [ALL][M] Every document has an owner, version, approval, effective date and a review interval; superseded versions retained.
- [ ] **DOC-81** [ALL][M] Documents reference the exact software version(s) they cover; a release-to-documentation index exists.
- [ ] **DOC-82** [ALL][S] Documents are written so an external auditor can follow them without the author present; acronyms expanded on first use; diagrams have legends.
