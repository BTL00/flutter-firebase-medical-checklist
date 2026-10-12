# 05 · Quality management, software lifecycle, risk and usability processes

ISO 13485 / QMSR tell you to have processes. IEC 62304, ISO 14971 and IEC 62366-1 tell you what those processes must produce. This file checks that the processes exist and are actually used by the Flutter team, not kept in a binder.

## A. Quality management system (ISO 13485:2016 / QMSR)

- [ ] **QMS-01** [ALL][M] Quality manual, scope, exclusions (e.g. sterilisation, installation) and process map exist; software development is a controlled process in it.
- [ ] **QMS-02** [ALL][M] Document control: SOPs, work instructions, templates, records; versioned, approved, with training on change. Git-based QMS is acceptable if approval and training evidence are retained.
- [ ] **QMS-03** [ALL][M] Management responsibility: quality policy, objectives, management review at least yearly with defined inputs (complaints, CAPA, audits, PMS, cyber).
- [ ] **QMS-04** [ALL][M] Competence and training records for every role touching the product, incl. contractors and the person who writes Firestore rules.
- [ ] **QMS-05** [ALL][M] Purchasing and supplier controls: Google, Apple, SDK vendors, cloud security tools, contractors evaluated and monitored; criticality-based.
- [ ] **QMS-06** [ALL][M] Design and development planning for each release train; design reviews with records.
- [ ] **QMS-07** [ALL][M] Internal audit programme covers software processes and cloud operations; auditor independence.
- [ ] **QMS-08** [ALL][M] CAPA process with root-cause analysis, effectiveness checks and links to problem reports and vigilance.
- [ ] **QMS-09** [ALL][M] Feedback and complaint handling defined for app stores, support desk, clinicians and security researchers.
- [ ] **QMS-10** [ALL][S] Statistical techniques / metrics defined for software (defect density, escaped defects, crash-free rate, MTTR) and reviewed.

## B. IEC 62304 software development process

- [ ] **LC-01** [ALL][M] **Software development plan** (§5.1): lifecycle model (agile is fine, AAMI TIR45), deliverables, traceability, configuration management, problem resolution, standards, tools, verification plan, integration plan, documentation per safety class.
- [ ] **LC-02** [ALL][M] **Software requirements specification** (§5.2): functional, performance, interfaces, alarms, security, usability, data definition/database (Firestore schema), installation/acceptance, maintenance, regulatory requirements; each requirement uniquely identified, verifiable, traced to system requirements and risk controls.
- [ ] **LC-03** [ALL][M] Requirements cover **Firestore security rules**, Cloud Functions, offline behaviour, sync conflict resolution, time handling and background execution as explicit requirements, not implementation details.
- [ ] **LC-04** [ALL][M] **Architecture** (§5.3, class B/C): components incl. Flutter app layers, Firebase services, third-party services; interfaces; SOUP functional and performance requirements (§5.3.3) and hardware/software requirements (§5.3.4); segregation for risk control (§5.3.5).
- [ ] **LC-05** [ALL][M] **Detailed design** (§5.4, class C) for safety-critical units; for B, enough design to verify units.
- [ ] **LC-06** [ALL][M] **Unit implementation and verification** (§5.5): acceptance criteria defined before coding (lint rules, coverage thresholds, review checklist); code review evidence in pull requests.
- [ ] **LC-07** [ALL][M] **Integration and integration testing** (§5.6): app ↔ Firebase emulator ↔ Functions ↔ external APIs; regression after changes.
- [ ] **LC-08** [ALL][M] **System testing** (§5.7): against SRS, on the supported device matrix, with anomalies recorded and evaluated; retest after fixes.
- [ ] **LC-09** [ALL][M] **Release** (§5.8): verification complete, known residual anomalies evaluated, released version documented, release built reproducibly, archived with build environment, delivery procedure (store publication) controlled.
- [ ] **LC-10** [ALL][M] Each lifecycle activity has a named output document (see file 18) and a traceability link.
- [ ] **LC-11** [ALL][S] Agile mapping document explains how sprints, PRs and CI satisfy 62304 activities (AAMI TIR45).

## C. Software maintenance (§6)

- [ ] **LC-20** [ALL][M] **Maintenance plan**: how feedback, problem reports, OS updates, Flutter/Firebase SDK releases and security advisories are received, evaluated and prioritised; how urgent patches are released.
- [ ] **LC-21** [ALL][M] Problem reports evaluated for safety impact and regulatory reportability (vigilance / MDR) before being treated as ordinary bugs.
- [ ] **LC-22** [ALL][M] Modified software goes through the same verification as new software, scaled by impact analysis; impact analysis template exists.
- [ ] **LC-23** [ALL][M] Flutter stable channel, Firebase SDK and OS platform updates have a review cadence (monthly) and a maximum lag policy.

## D. Software risk management (§7) and ISO 14971

- [ ] **RM-01** [ALL][M] **Risk management plan** with scope, responsibilities, risk acceptability criteria, verification activities, production and post-production information collection.
- [ ] **RM-02** [ALL][M] Hazard identification covers software hazards: wrong value, delayed value, missing data, stale cached data shown as current, wrong patient, notification not delivered, unit mix-up, time-zone error, offline-sync overwrite, authentication bypass, data breach.
- [ ] **RM-03** [ALL][M] Risk analysis uses sequences of events from software failure to harm, including the clinical response; severity and probability (or "reasonable worst case" where probability cannot be estimated for software).
- [ ] **RM-04** [ALL][M] Risk controls prioritised: inherent safety by design, protective measures (alarms, confirmations, range checks), information for safety; verification of implementation **and** effectiveness.
- [ ] **RM-05** [ALL][M] Risk control measures traced to requirements, to code/config (incl. Firestore rules) and to tests.
- [ ] **RM-06** [ALL][M] **SOUP risk**: published anomaly lists of Flutter, Dart, Firebase SDKs and packages evaluated for impact (§7.1.3); evidence of review per release.
- [ ] **RM-07** [ALL][M] Residual risk evaluation and benefit-risk conclusion signed; disclosure of residual risks in IFU.
- [ ] **RM-08** [ALL][M] Production and post-production information (crashes, support, vigilance, security advisories) feeds risk file updates; review cadence defined.
- [ ] **RM-09** [ALL][S] Security risk management (AAMI TIR57 / IEC 81001-5-1) is linked to but separate from safety risk management; security risks that have safety impact are in the 14971 file.
- [ ] **RM-10** [ALL][S] A **hazard analysis of Firebase outages and quota limits** (Firestore unavailability, Functions cold start, FCM delays, App Check false negatives) exists with mitigations.

## E. Configuration management (§8)

- [ ] **CM-01** [ALL][M] Configuration items identified: source, Flutter SDK version (FVM), `pubspec.lock`, native dependency lockfiles (Gradle, CocoaPods), Firestore rules and indexes, Storage rules, Functions source and runtime version, Remote Config templates, Firebase project config, CI definitions, build scripts, documentation.
- [ ] **CM-02** [ALL][M] **SOUP register** with title, manufacturer, version for every package and SDK (§8.1.2). → template: `templates/soup-register.md`
- [ ] **CM-03** [ALL][M] Change control: every change to a configuration item is traceable to an approved change request or problem report; PR template enforces links.
- [ ] **CM-04** [ALL][M] Configuration status accounting: for any released build you can list the exact versions of all configuration items in minutes.
- [ ] **CM-05** [ALL][M] Infrastructure as code or exported configuration for the Firebase project (rules, indexes, Functions, Auth settings, App Check settings, IAM) is versioned; manual console changes are detected (Cloud Audit Logs alert) and reconciled.
- [ ] **CM-06** [ALL][S] Separate Firebase projects for dev, staging and production; production project is created and owned by the legal manufacturer's Google Cloud organisation.

## F. Problem resolution (§9)

- [ ] **PR-01** [ALL][M] Problem report process: capture, classification (type, scope, criticality, safety/security impact), investigation, change request, verification, closure, trend analysis.
- [ ] **PR-02** [ALL][M] Crash reports, support tickets, store reviews, pen-test findings and dependency advisories all enter the same problem-report system (issue tracker labels are acceptable if fields are mandatory).
- [ ] **PR-03** [ALL][M] Advisory to users considered for each problem that can affect safety (in-app message, email, FSN).
- [ ] **PR-04** [ALL][M] Trend analysis done at least quarterly and feeds management review and PMS.

## G. Usability engineering process (IEC 62366-1)

- [ ] **UE-01** [ALL][M] **Use specification**: intended users, use environments, user interface, user profiles incl. age, impairments, digital literacy.
- [ ] **UE-02** [ALL][M] User interface characteristics related to safety identified; known use problems from similar apps researched (store reviews, MAUDE, literature).
- [ ] **UE-03** [ALL][M] Hazard-related use scenarios identified and the critical ones selected for summative evaluation.
- [ ] **UE-04** [ALL][M] User interface specification and **user interface evaluation plan** (formative and summative).
- [ ] **UE-05** [ALL][M] Formative evaluations during design (think-aloud, heuristic review) with records and resulting changes.
- [ ] **UE-06** [ALL][M] **Summative evaluation** with representative users (typically 15 per distinct user group) on production-equivalent builds and devices; use errors analysed for root cause; residual use-related risk accepted.
- [ ] **UE-07** [ALL][M] Usability engineering file links to the risk management file and to training/IFU content.
- [ ] **UE-08** [ALL][S] Accessibility evaluation included in the usability file, not only as an engineering ticket.

## H. Tooling validation

- [ ] **TV-01** [ALL][M] Software tools whose output is not fully verified are validated for intended use (ISO 13485 §4.1.6; FDA CSA guidance "Computer Software Assurance", 2025): CI/CD pipeline, Firebase Emulator Suite, test frameworks, QMS/e-signature tools, requirement management tool.
- [ ] **TV-02** [ALL][S] Risk-based CSA approach documented: which tools are high-risk (release gating) and how they are assured (vendor evidence, scripted tests, unscripted testing).

## I. Evidence this section needs

Quality manual and SOP set, SDP, SRS, architecture, test plans and reports, release record, maintenance plan, risk management plan/file/report, SOUP register, configuration baseline per release, problem-report log and trends, usability engineering file, tool validation records.
