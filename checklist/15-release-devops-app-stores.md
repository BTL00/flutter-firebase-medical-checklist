# 15 · Release, DevOps and app stores

Shipping a medical app is a controlled process with a paper trail, and the stores add their own health-specific rules. This file covers CI/CD, store compliance and the mechanics of controlled release and rollback.

## A. CI/CD pipeline

- [ ] **REL-01** [ALL][M] All release builds come from CI on a protected branch/tag; developers cannot publish from laptops; pipeline definitions are versioned and reviewed.
- [ ] **REL-02** [ALL][M] Pipeline gates: lint, unit, widget, rules tests, integration tests, dependency scan, SBOM generation, licence scan, accessibility tests; a failing gate blocks the release.
- [ ] **REL-03** [ALL][M] Signing keys (Android upload key, iOS certificates/profiles) stored in a secrets manager or HSM-backed service; Play App Signing enabled; access logged; rotation and loss procedures written.
- [ ] **REL-04** [ALL][M] CI secrets scoped per environment; production deploy requires a manual approval step by a named role.
- [ ] **REL-05** [ALL][M] Build artefacts (AAB/IPA, symbol files, SBOM, test reports, Functions bundle, rules) archived immutably per release with the commit hash; retention matches technical-documentation retention.
- [ ] **REL-06** [ALL][M] Infrastructure deployments (Firestore rules, indexes, Functions, Auth config, App Check, Remote Config templates, Hosting) go through the same approval and are deployed atomically with or before the app that depends on them, with a compatibility window.
- [ ] **REL-07** [ALL][S] Pipeline runners are hardened and ephemeral; third-party CI actions pinned by commit hash.
- [ ] **REL-08** [ALL][S] Reproducible-build check: a second build from the same tag yields matching artefacts (or differences are explained).

## B. Release management

- [ ] **REL-10** [ALL][M] Release procedure (SOP) covers: change list with traceability, impact analysis, V&V completion, regulatory assessment (UDI-DI vs UDI-PI, significant change, NB/FDA notification), documentation update, labeling update, approval, publication, post-release checks.
- [ ] **REL-11** [ALL][M] **Release notes** for users in each language, reviewed by regulatory; internal release record lists all configuration item versions.
- [ ] **REL-12** [ALL][M] Version scheme documented (semantic version + build number; mapping to UDI-PI) and visible in the About screen and in Crashlytics.
- [ ] **REL-13** [ALL][M] **Staged rollout** used (Play staged rollout, App Store phased release) with explicit halt criteria (crash-free rate, error rate, clinical complaints) and a monitoring owner during rollout.
- [ ] **REL-14** [ALL][M] **Minimum supported version** enforced server-side with a forced-update flow (store link, clear message) and a grace policy; the forced update itself cannot lock out users from safety-critical read-only data without a decision.
- [ ] **REL-15** [ALL][M] **Rollback plan**: app rollback is not possible on stores, so backward-compatible backend changes, feature flags for safe disablement and a tested "kill switch" for a defective feature exist; Functions and rules rollback tested.
- [ ] **REL-16** [ALL][M] Hotfix path with expedited review (Apple) and the same gates minus explicitly waived ones, with a documented waiver.
- [ ] **REL-17** [ALL][S] Release calendar avoids weekends and holidays for clinically used apps; on-call during and after releases.

## C. Apple App Store

- [ ] **STO-01** [ALL][M] **Guideline 1.4.1** (physical harm): medical apps disclose data sources and methodology; drug dosage calculators meet the origin/approval rule; apps that could provide inaccurate data are rejected.
- [ ] **STO-02** [ALL][M] **Guideline 5.1.3** (health and health research): HealthKit and health data rules, no health data in iCloud, informed consent for research apps, IRB approval evidence available.
- [ ] **STO-03** [ALL][M] Regulatory status reflected in the listing (cleared/CE-marked claims only where true); App Review may ask for FDA clearance or CE documentation for diagnostic claims.
- [ ] **STO-04** [ALL][M] App Privacy details (nutrition labels) match every SDK's collection; Privacy Manifests and required-reason APIs declared; third-party SDK signatures satisfied.
- [ ] **STO-05** [ALL][M] Account deletion in-app; Sign in with Apple offered if other third-party logins are offered; subscription and refund rules followed.
- [ ] **STO-06** [ALL][M] Medical disclaimers and emergency guidance present; the app does not claim to replace a physician unless cleared for that.
- [ ] **STO-07** [ALL][S] Review notes include demo credentials to a test tenant with synthetic data and a regulatory summary to shorten review.

## D. Google Play

- [ ] **STO-10** [ALL][M] **Health apps policy**: health declaration form, medical functionality disclosure, clinical references for claims, regulatory information in the listing where applicable.
- [ ] **STO-11** [ALL][M] **Health Connect** permissions: approved use cases, privacy policy link, rationale screen, data deletion, no advertising use, read-history justification.
- [ ] **STO-12** [ALL][M] **Data Safety** form consistent with actual collection by all SDKs; account and data deletion URL provided; updated on every SDK change.
- [ ] **STO-13** [ALL][M] Target API level current; permission policies (background location, SMS, call log) justified or avoided; sensitive permissions declaration forms completed.
- [ ] **STO-14** [ALL][M] Play App Signing, upload key backup, developer account 2FA and organisation account (not an individual) with verified identity.
- [ ] **STO-15** [ALL][S] Pre-launch report and Play Integrity verdicts reviewed per release.

## E. Enterprise and alternative distribution

- [ ] **STO-20** [ALL][S] Hospital MDM distribution (Apple Business Manager custom apps, managed Google Play) supported with configuration keys documented (AppConfig).
- [ ] **STO-21** [ALL][S] EU alternative distribution (DMA) and sideloading risks assessed; the app verifies its own installation source where it matters for the risk file.
- [ ] **STO-22** [ALL][S] Web app distribution (Firebase Hosting) has its own release gate, version banner and cache-busting; service worker update prompts users.

## F. Operations readiness

- [ ] **OPS-01** [ALL][M] Runbooks for: outage, rules regression, Functions failure, Auth outage, certificate expiry, key rotation, quota exhaustion, store removal, forced update, data restore.
- [ ] **OPS-02** [ALL][M] On-call and escalation with clinical-impact criteria; support hours stated in contracts and IFU.
- [ ] **OPS-03** [ALL][M] Status page or customer notification channel for incidents; templates reviewed by regulatory for wording.
- [ ] **OPS-04** [ALL][M] Google Cloud support plan appropriate to clinical use; escalation path known.
- [ ] **OPS-05** [ALL][S] Cost monitoring with anomaly alerts (a misbehaving query can be both a cost and an availability incident).
- [ ] **OPS-06** [ALL][S] Service-level objectives defined (availability, sync latency, alert delivery) and reported to customers.

## G. Evidence this section needs

Pipeline definitions and run logs, signing-key custody records, release SOP and records, release notes, staged-rollout decisions, store declarations (health, data safety, privacy labels), rollback/kill-switch test evidence, runbooks, on-call roster.
