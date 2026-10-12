# 17 · AI and machine-learning components

Applies to on-device models (TensorFlow Lite / LiteRT, Core ML), cloud models in Cloud Functions or Vertex AI, and third-party LLM APIs (Gemini, OpenAI, Anthropic, local models). Regulators treat a model as software with extra obligations: data governance, performance across subgroups, change control and transparency.

## A. Inventory and qualification

- [ ] **AI-01** [ALL][M] Every AI/ML component inventoried: purpose, type (classifier, regression, generative/LLM, recommendation), inputs, outputs, where it runs, vendor, version, training-data provenance, intended users of its output.
- [ ] **AI-02** [ALL][M] For each component: does it make or change a device function (file 00)? Does it fall under the **EU AI Act** (high-risk via MDR Annex I; transparency under Art. 50; GPAI obligations of the provider you use)? Decision recorded.
- [ ] **AI-03** [ALL][M] US pathway impact: FDA AI-enabled device software function guidance (draft 2025), **PCCP** (2024) for planned model updates, CDS exclusion analysis for LLM outputs shown to clinicians.
- [ ] **AI-04** [ALL][M] Locked vs adaptive algorithm decision; adaptive models are not shipped without a PCCP / NB-agreed change plan.
- [ ] **AI-05** [ALL][S] ISO/IEC 42001 (AI management system) or ISO/IEC 23894 (AI risk management) used as the process framework; BS 30440 as a validation framework for health AI.

## B. Data governance

- [ ] **AI-10** [ALL][M] Training, validation and test datasets documented (datasheets): source, consent/legal basis, demographics, acquisition devices, labelling process and inter-rater agreement, exclusions, known biases.
- [ ] **AI-11** [ALL][M] Test set is independent of training data (no patient overlap), representative of the intended population and setting, and sealed before final evaluation.
- [ ] **AI-12** [ALL][M] Lawful basis for using patient data to train or evaluate models (GDPR Art. 9 + Art. 89; HIPAA de-identification or authorisation; BAA permissions); documented per dataset.
- [ ] **AI-13** [ALL][M] Data from the app is not used for training without a documented purpose, basis, notice and opt-out where required; vendors' training opt-outs confirmed contractually.
- [ ] **AI-14** [ALL][S] Data drift monitoring compares production input distributions with training distributions and alerts on shift.

## C. Model development and verification

- [ ] **AI-15** [ALL][M] Model requirements (performance targets, latency, resource limits, failure behaviour) in the SRS; model version is a configuration item with checksum.
- [ ] **AI-16** [ALL][M] Performance report with confidence intervals on the sealed test set, overall and by subgroup (sex, age, skin tone, device model, site); clinically meaningful metrics (sensitivity at fixed specificity, calibration, decision-curve analysis where relevant), not only accuracy/AUC.
- [ ] **AI-17** [ALL][M] Robustness tests: noise, image quality, sensor variation, out-of-distribution detection, adversarial inputs where relevant; defined behaviour for low-confidence outputs (abstain, refer).
- [ ] **AI-18** [ALL][M] Reproducibility: training code, data snapshot references, seeds, environment and hyperparameters versioned; a model card published internally per version.
- [ ] **AI-19** [ALL][M] On-device model conversion (TFLite/Core ML quantisation) re-verified against the reference model; numeric differences bounded and tested per device class.
- [ ] **AI-20** [ALL][S] Explainability features (saliency, feature importance, uncertainty) validated for correctness, not only presence.

## D. Generative AI / LLM specifics

- [ ] **AI-30** [ALL][M] Use case bounded: what the LLM may and may not do (summarise, draft, triage, answer medical questions); prohibited outputs and refusal behaviour specified and tested.
- [ ] **AI-31** [ALL][M] If LLM output influences diagnosis or treatment, it is treated as a device function with the full file-12 evidence; "for information only" labels do not change qualification if the practical use is clinical.
- [ ] **AI-32** [ALL][M] Vendor terms: BAA/DPA, region of processing, zero data retention or logging opt-out, no training on inputs, sub-processor list; **PHI never sent** to endpoints without these.
- [ ] **AI-33** [ALL][M] **Prompt injection and data exfiltration** defences: system prompt isolation, tool/function allowlists, output filtering, no secrets or other patients' data in context, retrieval scoped to the authorised patient.
- [ ] **AI-34** [ALL][M] Hallucination controls: grounding/retrieval with citations, structured outputs validated against schemas, human review for clinical content, evaluation set with clinician-graded answers and a release threshold.
- [ ] **AI-35** [ALL][M] Transparency: users told they interact with AI (AI Act Art. 50), what it can and cannot do, and how to reach a human; generated content labelled.
- [ ] **AI-36** [ALL][M] Model/version pinning with regression evaluation before switching vendor models; vendor deprecations tracked as change requests.
- [ ] **AI-37** [ALL][M] Safety escalation: crisis language detection routes to emergency guidance; conversation logs retention and access defined.
- [ ] **AI-38** [ALL][S] Cost and rate limits per user to prevent abuse and denial-of-wallet.
- [ ] **AI-39** [ALL][S] On-premise or EU-hosted models considered where data cannot leave the jurisdiction (DiGA, hospital contracts).

## E. Human oversight and use

- [ ] **AI-40** [ALL][M] Human oversight design (AI Act Art. 14; FDA transparency principles): who reviews outputs, how override works, how automation bias is mitigated (e.g. showing uncertainty, requiring independent assessment for high-impact outputs).
- [ ] **AI-41** [ALL][M] Instructions for use describe the model's intended population, inputs, performance, limitations, failure modes and update policy in language the user understands.
- [ ] **AI-42** [ALL][M] Usability validation includes interpretation of AI outputs and uncertainty displays.

## F. Lifecycle, monitoring and change control

- [ ] **AI-50** [ALL][M] Real-world performance monitoring plan: metrics, sampling, ground-truth collection method, frequency, thresholds, actions; privacy-reviewed.
- [ ] **AI-51** [ALL][M] Model updates go through change control; PCCP boundaries (what may change without a new submission) respected; NB informed per contract.
- [ ] **AI-52** [ALL][M] Rollback to the previous model version tested; model served from a versioned store with access control.
- [ ] **AI-53** [ALL][M] Logging (AI Act Art. 12): inputs/outputs or sufficient metadata to reconstruct decisions, retained per policy, without becoming an unlawful PHI store.
- [ ] **AI-54** [ALL][S] Bias and fairness review repeated with real-world data at planned intervals.

## G. Evidence this section needs

AI inventory and qualification memo, datasheets, performance and subgroup reports, model cards, robustness tests, LLM evaluation set and results, vendor contracts, prompt-injection test report, human-oversight design, monitoring plan, PCCP (if any), AI Act technical documentation (if high-risk).
