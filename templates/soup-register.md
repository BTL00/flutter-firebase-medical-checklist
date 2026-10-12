# SOUP / OTS register (IEC 62304 §8.1.2, FDA OTS software guidance)

Every pub.dev package, native dependency, Firebase SDK, Cloud Functions dependency, runtime and platform is Software Of Unknown Provenance. Generate the raw list from lockfiles (`pubspec.lock`, `Podfile.lock`, Gradle, `package-lock.json`) and maintain the assessment columns by hand or in a tracked file.

| ID | Component | Manufacturer / publisher | Version | Where used | Purpose | Functional / performance requirements (62304 §5.3.3) | Hardware / software requirements (§5.3.4) | Safety class of using item | Anomaly list reviewed (date, source) | Known issues affecting us | Licence | Support / EOL status | Approval (who, date) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| SOUP-001 | Flutter SDK | Google | 3.x.y | App | UI framework | Render UI correctly on supported devices; stable channel only | Dart SDK x; iOS ≥ ; Android API ≥ | B | GitHub issues, release notes (YYYY-MM-DD) | | BSD-3 | Supported | |
| SOUP-002 | Dart SDK | Google | | App, tooling | Language runtime | | | B | | | BSD-3 | | |
| SOUP-003 | firebase_core | Google (Firebase) | | App | Firebase init | | | B | | | BSD-3 | | |
| SOUP-004 | cloud_firestore | Google (Firebase) | | App | Data access, offline cache | Offline persistence; rules enforcement server-side | | B | | | BSD-3 | | |
| SOUP-005 | firebase_auth | Google (Firebase) | | App | Authentication | | | B | | | BSD-3 | | |
| SOUP-006 | firebase_app_check | Google (Firebase) | | App | Client attestation | | | A | | | BSD-3 | | |
| SOUP-007 | flutter_secure_storage | | | App | Keychain/Keystore storage | | | B | | | BSD-3 | | |
| SOUP-008 | local_auth | Google (flutter.dev) | | App | Biometric prompt | | | B | | | BSD-3 | | |
| SOUP-009 | firebase-functions (Node) | Google | | Functions | Server runtime SDK | | Node LTS x | B | | | Apache-2.0 | | |
| SOUP-010 | Android OS | Google | API ≥ | Device | Platform | | | — | Android security bulletins | | — | | |
| SOUP-011 | iOS | Apple | ≥ | Device | Platform | | | — | Apple security releases | | — | | |
| SOUP-012 | Cloud Firestore (service) | Google Cloud | n/a (service) | Backend | Database | Availability SLA; region | | B | Google Cloud status, release notes | | Terms | | |

## Review procedure

1. On every dependency change the PR must update this register (CI can diff the lockfile against the register).
2. Monthly: review anomaly lists / advisories for all rows (OSV, GitHub advisories, vendor release notes) and record the date.
3. For each anomaly with potential impact: open a problem report, assess safety impact, decide action.
4. On release: snapshot this register into the release record together with the SBOM.
