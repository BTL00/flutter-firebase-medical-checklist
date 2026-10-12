# Traceability matrix

One row per software requirement. Fill IDs from your own tools; the point is that every chain is complete in both directions. Automate generation where you can (requirement IDs in test names and PR titles make this cheap).

| User need | System requirement | Software requirement | Risk control(s) implemented | Design element (module / Function / rule) | Test case(s) | Test result (release X) | Status |
|---|---|---|---|---|---|---|---|
| UN-01 Patient records blood pressure at home | SYS-04 | SRS-021 Accept systolic 50–300 mmHg, diastolic 30–200 mmHg, reject others with message | RC-07 Range check prevents implausible values | `bp_entry_form.dart`, `validateBp()` | UT-021-a..f, WT-021 | Pass, 2026-xx-xx, CI run #… | Verified |
| UN-01 | SYS-04 | SRS-022 Store reading with server timestamp and device-reported time | RC-11 Wrong-time hazard | `bp_repository.dart`, Firestore rule `readings` | UT-022, RT-022 (rules) | | |
| UN-03 Clinician sees only assigned patients | SYS-09 | SRS-040 Access to patient data requires active care-team membership | RC-20 Unauthorised access | Firestore rules `patients/{id}`, custom claims | RT-040-allow, RT-040-deny, IT-040 | | |
| UN-05 Patient can delete account and data | SYS-12 | SRS-070 Deletion removes Auth user, Firestore, Storage, logs within N days | RC-31 Data breach via orphaned data | `onUserDeleted` Function, TTL policy | IT-070, OPS-070 (runbook test) | | |

## Coverage summary (per release)

| Metric | Value |
|---|---|
| Software requirements | |
| Requirements with ≥ 1 test | |
| Risk controls with implementation verified | |
| Risk controls with effectiveness verified | |
| Tests failing / waived | |
