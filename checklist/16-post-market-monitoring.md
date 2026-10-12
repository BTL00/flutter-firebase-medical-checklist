# 16 · Post-market surveillance, monitoring and continuous compliance

> Not legal, regulatory or medical advice. Verify dated statements against primary sources. See [DISCLAIMER.md](../DISCLAIMER.md).

After release the obligations get heavier, not lighter: PMS, vigilance, cyber monitoring, complaint handling, PSURs, periodic reviews. This file turns them into a running operation.

## A. Monitoring sources

- [ ] **PMS-01** [ALL][M] All feedback channels inventoried and routed into the problem-report system: support desk, in-app feedback, store reviews (both stores, all countries), clinician feedback, hospital IT, security researchers, social media mentions, Crashlytics, Cloud Monitoring alerts, Google Cloud security notifications.
- [ ] **PMS-02** [ALL][M] Technical telemetry defined and privacy-reviewed: crash-free users, ANRs, error rates per Function, rules denials, sync failures, notification delivery rates, latency; dashboards with owners.
- [ ] **PMS-03** [ALL][M] Clinical performance indicators (from the PMCF / real-world performance plan) collected lawfully, with thresholds that trigger investigation.
- [ ] **PMS-04** [ALL][M] Security monitoring: audit-log anomalies, IAM changes, rules deploys, App Check rejection spikes, Auth attack signals, dependency advisories (file 06).
- [ ] **PMS-05** [ALL][S] Platform watch: Flutter, Dart, Firebase SDK release notes, iOS/Android beta behaviour changes, store policy updates; reviewed monthly with impact notes.
- [ ] **PMS-06** [ALL][S] Regulatory watch: MDCG guidance, FDA guidances, HHS/FTC rules, state laws, AI Act timelines, EHDS acts; an owner and a log.

## B. Complaint, incident and vigilance handling

- [ ] **PMS-10** [ALL][M] Definitions of complaint, incident, serious incident (EU) and MDR-reportable event (US) written and trained; store reviews and tickets triaged against them within a defined time.
- [ ] **PMS-11** [ALL][M] Investigation procedure with root-cause analysis for safety-relevant complaints, including reproducing on the reported device/OS and reviewing audit logs.
- [ ] **PMS-12** [ALL][M] Reporting decisions documented with rationale even when "not reportable"; reporting clocks tracked (EU 15/10/2 days; US 30/5 days; 806 10 working days).
- [ ] **PMS-13** [ALL][M] Field actions (FSCA/recall) procedure for software: forced update, remote disable, FSN to users and customers, authority notification, effectiveness check.
- [ ] **PMS-14** [ALL][M] Trend analysis (MDR Art. 88 and ISO 13485 §8.4) with statistical thresholds per failure type; reported in management review.
- [ ] **PMS-15** [ALL][S] Customer (hospital) incident reporting obligations and contacts captured in contracts; joint procedures for shared incidents.

## C. Periodic reporting and reviews

- [ ] **PMS-20** [EU][M] PMS report (Class I) or **PSUR** (Class IIa+) produced on schedule with the Annex III contents; submitted to the NB where required.
- [ ] **PMS-21** [ALL][M] Risk management file, clinical evaluation, usability file, threat model and SBOM reviewed and updated at planned intervals and on triggers.
- [ ] **PMS-22** [ALL][M] HIPAA risk analysis and GDPR DPIA reviewed yearly and on material change.
- [ ] **PMS-23** [ALL][M] Annual management review covers PMS, complaints, CAPA, security, audits, regulatory changes, supplier performance (Google incidents and changes included).
- [ ] **PMS-24** [ALL][S] Customer-facing transparency report (uptime, security summary, changes) where contracts or markets expect it.

## D. Change and obsolescence management

- [ ] **PMS-30** [ALL][M] OS and store deprecations (minimum SDK, API levels, Flutter breaking changes, Firebase SDK EOL, Node runtime EOL) tracked with dates; upgrade work scheduled before deadlines.
- [ ] **PMS-31** [ALL][M] Google product changes (pricing, deprecations like Dynamic Links, regional availability, terms) reviewed for regulatory and privacy impact.
- [ ] **PMS-32** [ALL][M] Each change assessed for significance (NB notification, new 510(k), UDI-DI change, DPIA update, re-validation) using a written decision tree.
- [ ] **PMS-33** [ALL][S] End-of-life plan for the product or a version: user notification, data export/return, deletion, documentation retention.

## E. Metrics worth reporting

- [ ] **PMS-40** [ALL][S] Crash-free sessions and users per version and OS; time to detect and time to remediate incidents; vulnerability remediation SLA adherence; complaint rate per 1,000 active users; rules test coverage; percentage of users on the latest version; accessibility defect count; translation defect count.

## F. Evidence this section needs

PMS plan, feedback routing map, dashboards, triage logs, investigation and reporting records, trend reports, PSUR/PMS reports, periodic review records, deprecation tracker, change significance decisions.
