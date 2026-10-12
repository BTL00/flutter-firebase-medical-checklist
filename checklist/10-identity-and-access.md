# 10 · Identity, access control and administration

> Not legal, regulatory or medical advice. Verify dated statements against primary sources. See [DISCLAIMER.md](../DISCLAIMER.md).

Covers the human side of access: users, roles, administrators, support staff, hospitals as tenants, and the tools you use to manage them. Firebase mechanics are in file 08.

## A. Access model

- [ ] **IAM-01** [ALL][M] A written **access control policy** defines roles (patient, caregiver/proxy, clinician, care-team admin, support, developer, security admin), their permissions and the data they may see; mapped to custom claims, Firestore rules and GCP IAM.
- [ ] **IAM-02** [ALL][M] Patient-to-clinician relationships (care team, assignment, consent to share) are explicit records with start/end dates; access ends when the relationship ends.
- [ ] **IAM-03** [ALL][M] **Proxy access** (parents, caregivers, legal guardians) is modelled with its own role, consent record and age-based transitions (e.g. teenager gains control at a legal age that differs by country).
- [ ] **IAM-04** [ALL][M] Break-glass / emergency access is designed if the clinical context needs it: justification prompt, time-limited, alerting, post-hoc review.
- [ ] **IAM-05** [ALL][M] Separation of duties: the people who approve access are not the ones who grant it; developers do not have standing production data access.
- [ ] **IAM-06** [ALL][S] Multi-tenancy for institutions: tenant isolation at the data model (tenant ID on every document, enforced in rules) or project level; cross-tenant queries impossible by construction.

## B. Authentication strength

- [ ] **IAM-10** [ALL][M] Authentication strength per role documented: patients (password + device biometrics or passkeys), clinicians and admins (MFA mandatory), support (MFA + SSO).
- [ ] **IAM-11** [ALL][M] Passkeys / WebAuthn or platform sign-in (Sign in with Apple/Google) evaluated; if offered, account recovery does not downgrade security.
- [ ] **IAM-12** [ALL][M] Account recovery (lost phone, lost email) is designed as an attack surface: identity verification steps, cooling periods, notifications to existing channels.
- [ ] **IAM-13** [ALL][M] Brute-force and credential-stuffing protection (Identity Platform quotas, reCAPTCHA, blocking functions, breached-password checks).
- [ ] **IAM-14** [ALL][M] Session policy: idle timeout, absolute lifetime, concurrent sessions, device list with remote sign-out; implemented server-side (token revocation + `auth_time` checks).
- [ ] **IAM-15** [ALL][S] Device binding for clinician apps (managed devices, MDM attestation) where hospitals require it.

## C. Authorisation enforcement

- [ ] **IAM-20** [ALL][M] Every data access path (client SDK, Functions, admin tools, BigQuery, exports, support consoles) enforces the same access model; no "admin SDK bypass" without logging and justification.
- [ ] **IAM-21** [ALL][M] Role changes take effect within a defined time (force token refresh, revoke sessions); tests prove that a removed clinician loses access.
- [ ] **IAM-22** [ALL][M] Object-level authorisation tested for IDOR (changing a document ID in a request) on every collection and Function.
- [ ] **IAM-23** [ALL][S] Attribute-based rules (time windows, location, device posture) used where clinical risk justifies them.

## D. Administration and support tooling

- [ ] **IAM-30** [ALL][M] Admin console / back-office tool is a controlled software item with its own requirements, rules, tests and audit logging; it never shows more identity data than the task needs.
- [ ] **IAM-31** [ALL][M] Support staff work on pseudonymised views; re-identification requires a ticket reference and is logged.
- [ ] **IAM-32** [ALL][M] Production access for engineers is temporary, approved and logged (Privileged Access Manager / just-in-time IAM grants); emergency access reviewed afterwards.
- [ ] **IAM-33** [ALL][M] Joiner/mover/leaver process with a checklist covering Google Cloud, Firebase, GitHub, CI, stores, email, support desk, QMS tools; completed same day for leavers.
- [ ] **IAM-34** [ALL][M] Quarterly **access review** of all human and service identities with sign-off; findings tracked.
- [ ] **IAM-35** [ALL][S] Admin actions require MFA step-up and are rate-limited; bulk exports require two-person approval.

## E. Identity data hygiene

- [ ] **IAM-40** [ALL][M] Identity attributes stored in Auth are minimal; health-related attributes are never in Auth profiles, claims or tokens that appear in logs.
- [ ] **IAM-41** [ALL][M] Email/phone changes are verified on both old and new channels; notifications sent on security-relevant changes.
- [ ] **IAM-42** [ALL][S] Identity proofing for clinicians (licence verification, hospital attestation) documented where clinical access is granted outside an SSO tenant.

## F. Evidence this section needs

Access control policy and role matrix, tenant isolation design, authentication strength table, session policy, admin tool documentation, JML checklist, access review records, IDOR test results.
