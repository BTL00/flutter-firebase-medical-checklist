# 00 · Scope, intended use and qualification

Everything downstream depends on three answers: what the app is for, whether that makes it a medical device in each market, and how risky it is. Get these written down and signed before you tune a single Firestore rule.

Legend: `[EU]` `[US]` `[ALL]` applicability · `[M]` must · `[S]` should · `[N]` nice to have.

## A. Intended use / intended purpose

- [ ] **QUAL-01** [ALL][M] A one-page **intended use statement** exists, is version-controlled and signed by management. It names the medical purpose, indications, target patient population, intended users (patient, caregiver, clinician), use environment (home, clinic, ambulance), platforms (iOS, Android, web) and explicitly lists what the software does **not** do. (MDR Art. 2(12); 21 CFR 801.4) → template: `templates/intended-use-statement.md`
- [ ] **QUAL-02** [ALL][M] Every public claim (website, store listing, pitch deck, social media, investor material, in-app copy) has been reviewed against the intended use statement. Claims drive qualification and classification in both markets.
- [ ] **QUAL-03** [ALL][M] The app is decomposed into **software functions / modules** and each is assessed separately (FDA regulates at function level; MDCG 2019-11 §3.3 allows module-level qualification).
- [ ] **QUAL-04** [ALL][M] For each function: device function or non-device function (wellness, administrative, communication only). Written rationale per function.
- [ ] **QUAL-05** [ALL][M] Intended users' minimum qualifications are stated (lay user vs licensed clinician). This changes usability, labeling and CDS analysis.
- [ ] **QUAL-06** [ALL][S] Contraindications, warnings and limitations (e.g. "not for emergency use", "not for pediatric use", age range) are listed and reflected in the UI and store listing.
- [ ] **QUAL-07** [ALL][S] Clinical workflow diagram shows where the app sits: who acts on its output, with what delay, and what happens if the app is unavailable.

## B. EU qualification and classification (MDR 2017/745 · IVDR 2017/746)

- [ ] **QUAL-10** [EU][M] MDCG 2019-11 decision steps walked and documented: is it software; is it an accessory; does it do more than storage, archival, communication, simple search or lossless compression; is the action for the benefit of individual patients; does it have a medical purpose under Art. 2(1)?
- [ ] **QUAL-11** [EU][M] If the app processes in-vitro diagnostic data (lab results, home test kits) the IVDR qualification path was assessed as well.
- [ ] **QUAL-12** [EU][M] **Annex VIII Rule 11** classification recorded with rationale: Class IIa default for decision-support/monitoring, IIb if decisions may cause serious deterioration or surgical intervention, III if death or irreversible deterioration; IIb for monitoring vital parameters where variations could cause immediate danger; Class I only for software that fits none of the above.
- [ ] **QUAL-13** [EU][M] Implementing rules checked: software driving or influencing a device takes that device's class (Annex VIII 3.3); if several rules apply, the highest class applies (3.5).
- [ ] **QUAL-14** [EU][S] MDCG 2021-24 (classification guidance) and MDCG 2023-4 (MDSW on hardware platforms such as smartwatches and phone sensors) consulted when the app reads phone or wearable sensors.
- [ ] **QUAL-15** [EU][M] If Class I: it is understood that self-declaration still requires full technical documentation, QMS, PMS, EUDAMED registration and a PRRC.
- [ ] **QUAL-16** [EU][M] If Class IIa or above: a Notified Body designated for MDR software has been identified and its lead time budgeted (12–18 months is common).
- [ ] **QUAL-17** [EU][S] Borderline cases (wellness vs medical) documented using the Manual on Borderline and Classification; national competent authority consulted if still unclear.

## C. US qualification (FD&C Act §201(h), §520(o), FDA guidances)

- [ ] **QUAL-20** [US][M] Each function assessed against the **§520(o) software exclusions** (21st Century Cures Act): administrative support, general wellness, electronic patient records, medical device data systems (transfer/store/display), and clinical decision support meeting all four criteria.
- [ ] **QUAL-21** [US][M] **General Wellness** guidance applied: low risk, wellness claims only; disease references only in the form of "may help reduce the risk of" or "may help living well with" for conditions where the lifestyle link is well understood. Use the current edition of the guidance (revised 2026).
- [ ] **QUAL-22** [US][M] **Clinical Decision Support** guidance four-criteria test applied per function: (1) not acquiring/processing/analyzing medical images, IVD signals or signal-acquisition patterns; (2) displays/analyzes medical information; (3) supports a recommendation to a healthcare professional, not a patient; (4) HCP can independently review the basis. Use the current edition (revised 2026).
- [ ] **QUAL-23** [US][M] **Policy for Device Software Functions and Mobile Medical Applications** checked for enforcement-discretion categories (self-management without specific treatment suggestions, tracking/organizing health information, simple general-purpose calculators, patient–provider communication).
- [ ] **QUAL-24** [US][M] Product code, classification regulation (21 CFR Parts 862–892) and regulatory pathway (exempt, 510(k), De Novo, PMA) identified; predicate devices found in the 510(k) database if 510(k).
- [ ] **QUAL-25** [US][M] **Documentation Level** per "Content of Premarket Submissions for Device Software Functions" (2023) determined: Basic or Enhanced (Enhanced if a failure could present a probable risk of death or serious injury, combination product, Class III or blood establishment software).
- [ ] **QUAL-26** [US][S] Pre-Submission (Q-Submission) meeting with FDA planned for any novel function, AI component or unclear pathway.
- [ ] **QUAL-27** [US][S] Whether the app is a **"cyber device"** under FD&C §524B assessed (software + internet connectivity + could be vulnerable → almost always yes for a Firebase app).

## D. Software safety classification (IEC 62304)

- [ ] **QUAL-30** [ALL][M] IEC 62304 safety class (A, B or C) assigned to the software system based on the risk analysis, assuming failure of the software and before external risk controls; rationale recorded.
- [ ] **QUAL-31** [ALL][S] Software architecture segregates items so that lower-risk items can be assigned a lower class; segregation rationale and effectiveness documented (62304 §4.3, §5.3.5).
- [ ] **QUAL-32** [ALL][M] The class is applied consistently to Flutter client, Cloud Functions, Firestore rules and any admin tool. Firestore security rules and Cloud Functions are software items too.
- [ ] **QUAL-33** [ALL][S] IEC 82304-1 (health software product safety) applied to the overall product, including the parts that are not "device software" but ship in the same app.

## E. Other jurisdictions (if sold there)

- [ ] **QUAL-40** [ALL][S] UK: UKCA under UK MDR 2002, MHRA registration, UK Responsible Person; NHS DTAC and DCB0129 if sold to the NHS.
- [ ] **QUAL-41** [ALL][S] Switzerland: MedDO/ODim, Swiss authorized representative (CH-REP).
- [ ] **QUAL-42** [ALL][N] Canada (SaMD guidance, MDEL/MDL), Australia (TGA software rules), Japan (PMDA) noted as future gates.

## F. Outputs of this section

- [ ] **QUAL-50** [ALL][M] A **regulatory strategy document** names target markets, qualification per function, class per market, pathway, standards list, Notified Body / FDA interactions, timeline and budget.
- [ ] **QUAL-51** [ALL][M] The decision "not a medical device" (if taken) is documented with the same care as a positive decision, dated, and re-triggered on every change to claims or features.
- [ ] **QUAL-52** [ALL][M] A change to intended use, target population or claims is a formal change request that re-opens this section.
