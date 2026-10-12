# Contributing

Corrections and additions are welcome. The bar is: a reader should be able to verify the item against a primary source.

## What makes a good item

- One verifiable statement per checkbox. "Rules are tested in CI" is checkable; "security is taken seriously" is not.
- A unique ID in the file's prefix scheme (`FB-`, `GDPR-`, `CLN-` …), appended at the end of the section's numbering. Never renumber existing items; people link to them.
- Applicability tag `[EU]`, `[US]` or `[ALL]` and level `[M]` must, `[S]` should, `[N]` nice to have.
- A reference where one exists (regulation article, standard clause, guidance title and year, Firebase documentation page). Prefer primary sources.
- Neutral wording. No vendor marketing, no legal advice.

## Process

1. Open an issue using the "Propose a check" or "Report an error" template, or go straight to a pull request for small fixes.
2. Run `tools/check-ids.sh` before pushing; CI runs it too (duplicate or malformed IDs fail the build).
3. For regulatory changes (new guidance, new law, date shifts) link the official publication in the PR.
4. One topic per PR.

## Translations

Translations of the checklist into other languages are welcome as `checklist/<lang>/…` once the English version stabilises. Please do not translate IDs.

## Licence

By contributing you agree that your contribution is licensed under CC BY 4.0, like the rest of the repository.
