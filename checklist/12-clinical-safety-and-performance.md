# 12 · Clinical safety, algorithms, alarms and performance

> Not legal, regulatory or medical advice. Verify dated statements against primary sources. See [DISCLAIMER.md](../DISCLAIMER.md).

The regulator's core question: does the software do what it claims, for whom, and what happens when it does not. This file covers the clinical content of the product; AI-specific items are in file 17.

## A. Clinical foundation

- [ ] **CLN-01** [ALL][M] Each clinical claim is tied to evidence: guideline, literature, validation study or clinical investigation; the **valid clinical association** (MDCG 2020-1) is written for every algorithm and score.
- [ ] **CLN-02** [ALL][M] Algorithms, scores and thresholds are specified in an **algorithm specification** independent of code: inputs, formula, units, rounding, edge cases, source reference, version; reviewed by a clinician.
- [ ] **CLN-03** [ALL][M] Validated instruments (PHQ-9, GAD-7, EQ-5D, disease-specific PROs) are used with licensed, unmodified wording and the published scoring; translation uses validated language versions.
- [ ] **CLN-04** [ALL][M] Reference ranges and thresholds are sourced, versioned and reviewed when guidelines change; the app can show the source to a clinician.
- [ ] **CLN-05** [ALL][M] Population limits (age, pregnancy, comorbidities, ethnicity-specific equations) stated and enforced or warned about in the UI.
- [ ] **CLN-06** [ALL][S] A **clinical advisory board** or named medical advisor reviews releases that change clinical content; minutes kept.

## B. Technical and clinical performance verification

- [ ] **CLN-10** [ALL][M] Each algorithm has a **reference test set** with expected outputs (including boundary and invalid inputs) computed independently (spreadsheet, reference implementation); automated tests compare the Dart/Functions implementation to it.
- [ ] **CLN-11** [ALL][M] Analytical performance (accuracy, precision, agreement with reference method) measured and reported where the app computes or transforms measurements (e.g. heart-rate from camera, step counting, image analysis).
- [ ] **CLN-12** [ALL][M] **Clinical performance** evidence (sensitivity, specificity, PPV/NPV, calibration, clinical utility) for diagnostic or risk-prediction functions, in the intended population and setting; confidence intervals reported.
- [ ] **CLN-13** [ALL][M] Performance across subgroups (sex, age, skin tone for optical sensors, device models, OS versions) analysed and limitations stated.
- [ ] **CLN-14** [ALL][M] Human-factors validation shows that users interpret outputs correctly (not only that the number is right).
- [ ] **CLN-15** [ALL][S] Real-world performance follow-up (PMCF / postmarket) plan defines metrics, data sources and thresholds that trigger action.

## C. Calculators, dosing and medication features

- [ ] **CLN-20** [ALL][M] Dose calculators: formula source, units (mg, mg/kg, mL, IU), concentration handling, weight/age/renal adjustments, maximum dose caps and hard stops; double-entry or confirmation for high-risk drugs; **Apple review guideline 1.4.1** requires such calculators to come from, or be approved by, a manufacturer, hospital, university, insurer, pharmacy or regulator.
- [ ] **CLN-21** [ALL][M] Medication reminders: missed-dose logic, time-zone changes, snooze limits, double-dose prevention, interaction with notification permissions; behaviour when notifications are blocked is shown to the user.
- [ ] **CLN-22** [ALL][M] Drug databases and interaction checks licensed, versioned and updated on a schedule; version shown in app.
- [ ] **CLN-23** [ALL][M] Unit conversion tables tested with reference values; mixed-unit displays forbidden on one screen.
- [ ] **CLN-24** [ALL][S] Numeric display uses locale-correct separators and avoids ambiguous formats (trailing zeros, leading decimals) per ISMP recommendations.

## D. Alarms, alerts and escalation

- [ ] **CLN-30** [ALL][M] Alerting requirements specified: condition, priority, latency budget, delivery channel, acknowledgement, escalation, failure behaviour; aligned with IEC 60601-1-8 concepts where relevant.
- [ ] **CLN-31** [ALL][M] The app never implies real-time monitoring it cannot guarantee; latency limits of FCM, background execution and connectivity stated in the IFU ("not for emergency use" if applicable).
- [ ] **CLN-32** [ALL][M] Alert fatigue considered: thresholds, de-duplication, quiet hours with safety overrides, clinician-configurable limits within safe bounds.
- [ ] **CLN-33** [ALL][M] Delivery confirmation for critical messages (clinician acknowledges; patient sees that the message was read); undelivered critical alerts escalate.
- [ ] **CLN-34** [ALL][M] Emergency guidance (call emergency services) shown for high-risk inputs (suicidal ideation items, dangerous vitals) with region-aware emergency numbers.
- [ ] **CLN-35** [ALL][S] Alerts tested end-to-end in a lab with a real device matrix, including Do Not Disturb, Focus modes, battery saver and app force-stop.

## E. Clinical content, communication and education

- [ ] **CLN-40** [ALL][M] Educational and advisory content reviewed by a qualified clinician, versioned, with sources and review dates; readability targeted to the user population (e.g. plain language, B1 level).
- [ ] **CLN-41** [ALL][M] Patient–clinician messaging has clear expectations (response times, not for emergencies), retention, and inclusion in the medical record where required.
- [ ] **CLN-42** [ALL][M] Telemedicine features (video, remote consultation) meet national telehealth rules, consent, identity verification and recording policies.
- [ ] **CLN-43** [ALL][S] Behaviour-change features (nudges, gamification) reviewed for ethics and for AI Act prohibited-practice boundaries.

## F. Clinical investigations and studies

- [ ] **CLN-50** [ALL][M] If data is collected for a study: protocol, ethics approval, informed consent (separate from app consent), ISO 14155 / ICH GCP, data management plan, Part 11 and GDPR Art. 89 compliance of the app as a data-capture tool.
- [ ] **CLN-51** [ALL][M] Study builds are distinct from commercial builds (or clearly configured); investigational device labelling where required.
- [ ] **CLN-52** [ALL][S] Study data export validated (eCRF mapping, audit trail completeness) and system validation documented for the sponsor.

## G. Safety case

- [ ] **CLN-60** [ALL][M] A **clinical safety case** (hazard log → controls → evidence → residual risk argument) exists and is maintained per release; a named clinical safety lead signs it (mandatory in the UK via DCB0129; good practice everywhere).
- [ ] **CLN-61** [ALL][M] Hazards include wrong-patient, wrong-value, missing alert, delayed data, stale data, misinterpretation, over-reliance (automation bias), under-reliance and abandonment.
- [ ] **CLN-62** [ALL][S] Safety case and risk file reconciled with incident and complaint data at least yearly.

## H. Evidence this section needs

Algorithm specifications, reference test sets and test reports, performance study reports, clinical evaluation report, alarm specification and test reports, content review records, study documentation, clinical safety case.
