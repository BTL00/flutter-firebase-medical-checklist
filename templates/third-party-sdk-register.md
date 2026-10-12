# Third-party SDK and processor register

Covers every SDK in `pubspec.yaml` (and native dependencies) that talks to the network, and every external service your Functions call. Required for GDPR Art. 28/30, HIPAA BAAs, the FTC Health Breach Notification Rule and store data-safety declarations.

| Name | Type (SDK / API / service) | Vendor, country | Purpose | Data sent (fields) | Health data possible? | Legal role (processor / controller) | Contract (DPA / BAA / terms) | Transfer mechanism (DPF / SCC / none) | Region of processing | Auto-collection disabled until consent? | Store declaration mapping (Apple privacy label / Play data safety) | Removal plan if unapproved | Owner | Last reviewed |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| firebase_crashlytics | SDK | Google, US | Crash reporting | Stack traces, device model, OS, custom keys | Must be no | Processor | DPA | DPF | US | Yes | Diagnostics / Crash logs | | | |
| Email provider (e.g. SendGrid/Postmark) | API | | Transactional email | Email address, template vars | No PHI in templates | Processor | DPA + BAA (US) | | | n/a | Contact info | | | |
| SMS gateway | API | | OTP / reminders | Phone number, message text | No PHI in text | Processor | DPA + BAA | | | n/a | Contact info | | | |
| Support desk | Service | | Tickets | Name, email, free text | Possible (train staff) | Processor | DPA + BAA | | | n/a | Contact info, user content | | | |
| LLM API | API | | Summaries | Prompt text | Only under BAA/DPA, zero retention | Processor | DPA + BAA | | EU endpoint | n/a | User content | | | |
| Maps SDK | SDK | | Clinic finder | Approximate location | No | Controller for own purposes? | Terms | | | Yes | Location | | | |
| Payment provider | SDK/API | | Subscriptions | Payment data (tokenised) | No | Independent controller | Terms | | | n/a | Purchases, financial info | | | |

Rule of thumb: if you cannot fill the "Data sent" column from the vendor's documentation and your own network inspection, the SDK does not ship.
