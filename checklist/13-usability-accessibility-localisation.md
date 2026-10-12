# 13 · Usability, accessibility and localisation

Usability is a regulated process (file 05 §G). This file lists the concrete properties the Flutter UI must have, plus accessibility and localisation requirements for selling in many EU countries and in the US.

## A. Accessibility (WCAG 2.2 AA, EN 301 549, Section 508)

- [ ] **ACC-01** [ALL][M] Target standard declared (WCAG 2.2 AA mapped to mobile via W3C mobile guidance; EN 301 549 for the EU; Section 508 / ADA for the US) and an accessibility conformance report (VPAT / ACR) produced.
- [ ] **ACC-02** [ALL][M] Every interactive element has a `Semantics` label, role and state; decorative images excluded; custom widgets expose actions; tested with TalkBack and VoiceOver on real devices for every primary flow.
- [ ] **ACC-03** [ALL][M] Text scales to at least 200 % without truncation or overlap (`MediaQuery.textScaler`, no fixed heights around text); layouts tested at the largest OS font size and with bold text.
- [ ] **ACC-04** [ALL][M] Colour contrast ≥ 4.5:1 for text and 3:1 for UI components and graphics; information never conveyed by colour alone (charts, status indicators, alert levels).
- [ ] **ACC-05** [ALL][M] Touch targets ≥ 48×48 dp (Android) / 44×44 pt (iOS) with spacing; Flutter accessibility guideline tests (`androidTapTargetGuideline`, `iOSTapTargetGuideline`, `textContrastGuideline`, `labeledTapTargetGuideline`) run in widget tests.
- [ ] **ACC-06** [ALL][M] Focus order is logical; keyboard and switch-control navigation works (web and tablet); focus visible.
- [ ] **ACC-07** [ALL][M] Motion and animation respect reduce-motion settings; no flashing above thresholds; auto-advancing content can be paused.
- [ ] **ACC-08** [ALL][M] Time limits (session timeout, questionnaires) can be extended or are justified for safety; warnings before expiry.
- [ ] **ACC-09** [ALL][M] Forms: visible labels, error identification and suggestion, no placeholder-only labels; input types match content (numeric keyboards).
- [ ] **ACC-10** [ALL][M] Media: captions for video, transcripts for audio, alt text for images incl. clinician-uploaded images where feasible.
- [ ] **ACC-11** [ALL][S] Dark mode, high-contrast and colour-blind-safe palettes supported; charts use patterns/labels as well as colour.
- [ ] **ACC-12** [ALL][S] Accessibility tested with users with disabilities as part of formative/summative evaluation, not only with tooling.
- [ ] **ACC-13** [ALL][S] Accessibility statement published (EU public-sector-style statement is a good model) with contact and known limitations.

## B. Usability properties of the clinical UI

- [ ] **UX-01** [ALL][M] Primary tasks (log a reading, take a dose, send to clinician, read a result) complete in a short, measured number of steps; task success and error rates recorded in evaluations.
- [ ] **UX-02** [ALL][M] Critical information hierarchy: patient identity, latest value with unit and timestamp, status, next action; nothing clinically important is below the fold without indication.
- [ ] **UX-03** [ALL][M] Confirmation and undo patterns for clinically significant actions; destructive actions never on the default/primary button position.
- [ ] **UX-04** [ALL][M] Error messages say what happened, what it means for the user and what to do; technical codes hidden but available to support.
- [ ] **UX-05** [ALL][M] Onboarding and in-app help cover the IFU essentials; the full IFU and regulatory information are one tap away.
- [ ] **UX-06** [ALL][M] Interruptions (calls, notifications, app switch) during data entry do not lose or corrupt input; drafts preserved.
- [ ] **UX-07** [ALL][M] Numbers, dates and units are formatted unambiguously (see CLN-24); 24-hour vs 12-hour time follows locale with explicit AM/PM where used.
- [ ] **UX-08** [ALL][S] Low digital literacy and older adults considered: larger defaults, fewer gestures, explicit buttons instead of swipe-only actions, no reliance on long-press discovery.
- [ ] **UX-09** [ALL][S] Clinician UI optimised for speed and shared devices: fast re-authentication, patient switching with identity confirmation, no persistent PHI on screen after timeout.

## C. Localisation and internationalisation

- [ ] **L10N-01** [ALL][M] All user-facing text externalised (ARB / `intl`); no concatenated sentences; plurals and gender handled with ICU syntax.
- [ ] **L10N-02** [ALL][M] Translations are **controlled documents** reviewed by a clinician or medical translator per language; IFU and label translations match the in-app text; translation memory versioned with releases.
- [ ] **L10N-03** [ALL][M] Required languages per market listed (EU member states' national language rules for IFU and UI; US English plus Spanish where state or customer requires); fallback behaviour defined when a language is missing.
- [ ] **L10N-04** [ALL][M] Locale-aware formatting of numbers, decimal separators, dates, times, units (metric vs US customary) with user override for clinical units; formats never inferred from the UI language alone.
- [ ] **L10N-05** [ALL][M] Right-to-left layout verified if Arabic or Hebrew are supported; bidi text in mixed fields handled.
- [ ] **L10N-06** [ALL][M] Pseudo-localisation and longest-string tests catch truncation in all layouts.
- [ ] **L10N-07** [ALL][M] Region-specific content (emergency numbers, hotlines, regulatory info, privacy notice, contact addresses) switches by **region**, not by language.
- [ ] **L10N-08** [ALL][S] Store listings, screenshots and support content localised and reviewed against the intended use (claims in translation count as claims).
- [ ] **L10N-09** [ALL][S] Fonts cover all required scripts and are licensed for app embedding.

## D. Instructions for use and training

- [ ] **IFU-01** [ALL][M] IFU written for the intended user group's reading level; usability-tested as part of the summative evaluation (participants must be able to find and apply critical information).
- [ ] **IFU-02** [ALL][M] In-app access to the current IFU version, previous versions (eIFU rule) and a paper-request route.
- [ ] **IFU-03** [ALL][M] Training materials for clinicians and support staff versioned with the release; training completion tracked where contractually required.
- [ ] **IFU-04** [ALL][S] Quick-start and safety-critical warnings surfaced contextually (first use of a feature), with a record that the user saw them where risk controls depend on it.

## E. Evidence this section needs

Accessibility conformance report, screen-reader test records, accessibility widget tests in CI, usability evaluation reports, translation review records and language matrix, localisation test results, IFU usability test evidence.
