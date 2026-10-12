# 14 · Verification and validation

> Not legal, regulatory or medical advice. Verify dated statements against primary sources. See [DISCLAIMER.md](../DISCLAIMER.md).

Verification: did we build it right (tests against requirements). Validation: did we build the right thing (works for intended users in intended use). Both need plans, records and traceability.

## A. Planning and traceability

- [ ] **VV-01** [ALL][M] **Verification plan** per release: scope, test levels, environments, device matrix, entry/exit criteria, roles, tools, how anomalies are handled.
- [ ] **VV-02** [ALL][M] **Traceability matrix** links user needs → system requirements → software requirements → risk controls → design → tests → results; generated or maintained per release. → template: `templates/traceability-matrix.md`
- [ ] **VV-03** [ALL][M] Every requirement has at least one test; every risk control has a verification of implementation and of effectiveness.
- [ ] **VV-04** [ALL][M] Test cases are controlled documents (in repo, reviewed); test results are records (CI artefacts, signed reports) retained with the release.
- [ ] **VV-05** [ALL][S] Coverage targets defined per safety class (e.g. statement + branch for clinical logic packages; rules coverage for Firestore); coverage reports archived.

## B. Automated testing in the Flutter codebase

- [ ] **VV-10** [ALL][M] **Unit tests** for all clinical logic in pure Dart packages, including reference test sets from file 12, boundary values, invalid input, locale and unit variations.
- [ ] **VV-11** [ALL][M] **Widget tests** for critical screens: identity display, value + unit + timestamp rendering, error and offline states, confirmation dialogs, accessibility guideline checks.
- [ ] **VV-12** [ALL][M] **Golden tests** for screens where layout correctness is clinically relevant (charts, tables, dosing screens) across text scales and themes.
- [ ] **VV-13** [ALL][M] **Integration tests** (`integration_test`, Patrol or equivalent) for end-to-end flows against the **Firebase Emulator Suite** with seeded pseudonymous data: sign-in, MFA, data entry, sync, offline → online, clinician view, deletion.
- [ ] **VV-14** [ALL][M] **Firestore and Storage rules tests** (allow/deny matrix) in CI (file 08).
- [ ] **VV-15** [ALL][M] **Cloud Functions tests**: unit tests with mocked services, integration tests in the emulator, contract tests for external APIs (FHIR, SMS, email).
- [ ] **VV-16** [ALL][M] Tests for migrations and backward compatibility (old app version vs new data; new app version vs old data).
- [ ] **VV-17** [ALL][M] Flaky tests are tracked as problems; no retry-until-green policy in release pipelines.
- [ ] **VV-18** [ALL][S] Mutation testing or fault injection for the clinical logic package to prove tests detect faults.
- [ ] **VV-19** [ALL][S] Property-based tests for unit conversions, date arithmetic and parsing.

## C. Device matrix and manual testing

- [ ] **VV-20** [ALL][M] Supported device matrix documented (OS versions, screen sizes, manufacturers, low-end devices, tablets, web browsers) and traced to GSPR §17.3; each release tested on a defined subset with records.
- [ ] **VV-21** [ALL][M] Device farm (Firebase Test Lab or equivalent) runs the integration suite on the matrix; results archived.
- [ ] **VV-22** [ALL][M] Manual exploratory test charters for areas automation misses: notifications, background behaviour, permissions revocation, OS updates, accessibility with screen readers, BLE devices.
- [ ] **VV-23** [ALL][M] Installation, upgrade and uninstall testing (fresh install, upgrade from each supported previous version, data migration, downgrade blocked).
- [ ] **VV-24** [ALL][S] Beta testing (TestFlight, Play internal/closed tracks) uses test accounts and synthetic data; beta feedback flows into problem reports.

## D. Non-functional testing

- [ ] **VV-30** [ALL][M] **Performance**: startup time, screen render budget, Firestore query latency, Functions latency, with limits defined in the SRS and measured per release.
- [ ] **VV-31** [ALL][M] **Load and quota tests** for the backend: concurrent users, burst writes, Functions scaling, Firestore hotspots, FCM fan-out; documented capacity.
- [ ] **VV-32** [ALL][M] **Resilience**: backend unavailable, partial outages (Auth down, Firestore up), slow networks, captive portals, airplane mode mid-write.
- [ ] **VV-33** [ALL][M] **Battery and background** behaviour measured for sync and BLE features.
- [ ] **VV-34** [ALL][M] **Security testing** per file 06 (SAST, rules tests, MASVS, pen test) is part of V&V, not separate.
- [ ] **VV-35** [ALL][M] **Accessibility testing** per file 13 is part of V&V.
- [ ] **VV-36** [ALL][S] Data-integrity tests: checksums on export/import, audit-trail completeness, deletion verification.

## E. Validation

- [ ] **VV-40** [ALL][M] **Software validation** against user needs in the intended environment: scripted scenarios with representative users (clinicians, patients), on release-candidate builds, with pass/fail criteria; report signed.
- [ ] **VV-41** [ALL][M] Summative **usability validation** (file 05 §G) completed on the final UI; changes after it are assessed for impact.
- [ ] **VV-42** [ALL][M] **Clinical performance validation** per file 12 with the final algorithm version; any retraining or threshold change re-triggers it.
- [ ] **VV-43** [ALL][M] IFU and training materials validated as part of the scenarios (users can find and follow critical instructions).
- [ ] **VV-44** [ALL][S] Validation in each target market/language for content and workflow differences.

## F. Anomalies and release decision

- [ ] **VV-50** [ALL][M] All anomalies found in V&V recorded, classified for safety impact and either fixed and retested or documented as **known residual anomalies** with rationale for release (62304 §5.8.2, FDA unresolved anomalies list).
- [ ] **VV-51** [ALL][M] Regression test scope for each change defined by impact analysis; full suite before each store release.
- [ ] **VV-52** [ALL][M] Release decision meeting with QA, regulatory, clinical and engineering sign-off recorded; the exact build hash is in the record.
- [ ] **VV-53** [ALL][S] Post-release verification (smoke tests on production, synthetic monitoring) planned and executed within hours of release.

## G. Test environments and data

- [ ] **VV-60** [ALL][M] No real patient data in test environments; synthetic data generators produce realistic, edge-case-rich datasets; access to staging is controlled anyway.
- [ ] **VV-61** [ALL][M] Emulator and staging configurations match production rules, indexes, Functions and Auth settings (deployed from the same repo state).
- [ ] **VV-62** [ALL][S] Test data for devices (BLE recordings, HealthKit fixtures) captured and versioned for replay.

## H. Evidence this section needs

Verification plan, traceability matrix, test specifications, CI test reports and coverage, device-matrix results, non-functional test reports, validation protocol and report, anomaly list, release decision record.
