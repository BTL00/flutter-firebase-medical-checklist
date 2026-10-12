# Checklista aplikacji medycznej Flutter + Firebase (UE i USA)

Otwarta, neutralna wobec dostawców checklista do przeprowadzenia **aplikacji Flutter na Firebase** od „działa” do „można ją wprowadzić do obrotu jako oprogramowanie medyczne” w **Unii Europejskiej** i **Stanach Zjednoczonych**. Obejmuje kwalifikację i klasyfikację, obowiązki z MDR i FDA, RODO i HIPAA, system jakości i cykl życia oprogramowania, cyberbezpieczeństwo, klienta Flutter, backend Firebase, obsługę danych, interoperacyjność, bezpieczeństwo kliniczne, użyteczność i dostępność, weryfikację i walidację, wydania i sklepy, nadzór po wprowadzeniu do obrotu, komponenty AI, dokumentację oraz ludzi i umowy, które za tym stoją.

**837 punktów** · 20 plików · 8 szablonów · każdy punkt ma identyfikator, znacznik rynku i priorytet. Wersja angielska: [README.md](README.md) i [`checklist/`](checklist/).

> **To nie jest porada prawna, regulacyjna ani medyczna.** To checklista inżynierska napisana na podstawie pracy produkcyjnej. Mówi, co sprawdzić i skąd wynika wymaganie; nie zastępuje konsultanta regulacyjnego, jednostki notyfikowanej, prawnika, lekarza ani inspektora ochrony danych. Odhaczenie wszystkich punktów nie czyni produktu zgodnym. Przepisy i Firebase się zmieniają; sprawdzaj daty i listy produktów w źródłach pierwotnych, zanim na nich oprzesz decyzje. Pełna treść: [DISCLAIMER.md](DISCLAIMER.md).

## Dla kogo

- Programiści Flutter, którym powiedziano „to musi być zgodne” i którzy chcą pełnej listy, a nie wpisu na blogu.
- Założyciele i właściciele produktu szacujący pracę przed pilotażem w szpitalu, wnioskiem DiGA albo 510(k).
- Osoby od QA, regulacji i bezpieczeństwa, którym potrzebne są szczegóły specyficzne dla Fluttera i Firebase, pomijane w ogólnych checklistach SaMD.
- Audytorzy i IT szpitali, którzy chcą uporządkowanego sposobu odpytania dostawcy.

## Jak używać

1. **Zacznij od pliku 00.** Zdecyduj, per funkcja oprogramowania, czy jesteś wyrobem medycznym w UE i w USA i w jakiej klasie. Od tego zależy cała reszta.
2. **Zrób fork albo skopiuj katalog `checklist/pl/`** do dokumentacji projektu i odhaczaj punkty, zmieniając `- [ ]` na `- [x]`. Zachowaj identyfikatory; są stałe i takie same we wszystkich językach, więc możesz się do nich odwoływać w wymaganiach, PR-ach i dowodach audytowych (`FB-36`, `GDPR-21`).
3. **Filtruj po rynku i priorytecie.** Każdy punkt ma `[EU]`, `[US]` lub `[ALL]` oraz `[M]` wymagane, `[S]` zalecane, `[N]` dobrze mieć. `tools/score.sh EU` lub `tools/score.sh US` drukuje postęp per plik (dla wersji angielskiej; dla polskiej wywołaj skrypt w katalogu `checklist/pl`).
4. **„Nie wiem” traktuj jak „nie”.** Każdy punkt jest sformułowany tak, by dało się odpowiedzieć tak, nie albo nie wiem z otwartym repozytorium i konsolą Firebase.
5. **Używaj szablonów**, gdy punkt na nie wskazuje (`templates/`, po angielsku). To punkty wyjścia dla dokumentów, o które poprosi audytor.
6. Kolejność pracy, która sprawdza się w praktyce: 00 → 03/04 → 08 → 07 → 09 → 06 → 05 → 14 → reszta.

## Zawartość

| # | Plik | Zakres | Punkty |
|---|---|---|---|
| 00 | [Zakres i kwalifikacja](checklist/pl/00-scope-and-qualification.md) | Przewidziane zastosowanie, MDCG 2019-11, reguła 11, FDA §520(o), testy CDS i wellness, klasa IEC 62304 | 33 |
| 01 | [Regulacje UE](checklist/pl/01-regulatory-eu.md) | MDR art. 10, zał. I/II/III, GSPR §17, ocena kliniczna, UDI/EUDAMED, PMS/vigilance, akt o AI, EHDS, DiGA/PECAN | 65 |
| 02 | [Regulacje USA](checklist/pl/02-regulatory-us.md) | QMSR, dokumentacja oprogramowania i cyberbezpieczeństwa w zgłoszeniu, §524B, UDI/GUDID, MDR/806, część 11, ONC | 31 |
| 03 | [Prywatność RODO](checklist/pl/03-privacy-gdpr.md) | Podstawa prawna, prawa, DPIA, podmioty przetwarzające, transfery, ePrivacy dla SDK, pseudonimizacja | 40 |
| 04 | [Prywatność USA](checklist/pl/04-privacy-us.md) | HIPAA Privacy/Security/Breach, zakres BAA Google, FTC HBNR, stanowe prawo o danych zdrowotnych, zasady sklepów | 43 |
| 05 | [Zarządzanie jakością i cykl życia](checklist/pl/05-quality-management-and-lifecycle.md) | ISO 13485/QMSR, procesy IEC 62304, ISO 14971, konfiguracja i SOUP, IEC 62366-1, walidacja narzędzi | 55 |
| 06 | [Cyberbezpieczeństwo](checklist/pl/06-cybersecurity.md) | IEC 81001-5-1 / FDA SPDF, model zagrożeń, SBOM, testy, CVD, reagowanie na incydenty, oznakowanie | 49 |
| 07 | [Klient Flutter](checklist/pl/07-flutter-client.md) | Build i obfuskacja, sekrety, magazyn lokalny, blokada aplikacji, sieć, integralność urządzenia, poprawność klinicznego UI, web | 57 |
| 08 | [Backend Firebase](checklist/pl/08-firebase-backend.md) | Organizacja i IAM, lokalizacja danych, reguły Firestore/Storage, Functions, Auth, App Check, Analytics/Crashlytics/FCM, kopie | 76 |
| 09 | [Cykl życia danych](checklist/pl/09-data-lifecycle.md) | Inwentarz, pseudonimizacja, szyfrowanie, ślad audytowy, synchronizacja offline, retencja i usuwanie, przenoszenie | 42 |
| 10 | [Tożsamość i dostęp](checklist/pl/10-identity-and-access.md) | Role, pełnomocnicy, najemcy, siła uwierzytelniania, narzędzia administracyjne, przeglądy dostępu | 25 |
| 11 | [Interoperacyjność](checklist/pl/11-interoperability.md) | FHIR, terminologie, SMART on FHIR, HealthKit/Health Connect, wyroby BLE, wystawiane API | 30 |
| 12 | [Bezpieczeństwo kliniczne i działanie](checklist/pl/12-clinical-safety-and-performance.md) | Specyfikacje algorytmów, dowody działania, kalkulatory dawek, alarmy, treści, badania, safety case | 33 |
| 13 | [Użyteczność, dostępność, lokalizacja](checklist/pl/13-usability-accessibility-localisation.md) | WCAG 2.2 / EN 301 549 / 508, właściwości klinicznego UI, i18n, instrukcja | 35 |
| 14 | [Weryfikacja i walidacja](checklist/pl/14-verification-and-validation.md) | Plany, śledzalność, piramida testów Flutter, emulator, macierz urządzeń, niefunkcjonalne, walidacja, anomalie | 39 |
| 15 | [Wydania, DevOps, sklepy](checklist/pl/15-release-devops-app-stores.md) | Bramki CI/CD, podpisywanie, zapisy wydań, stopniowe wdrażanie, polityki zdrowotne Apple i Google, operacje | 38 |
| 16 | [Nadzór po wprowadzeniu do obrotu](checklist/pl/16-post-market-monitoring.md) | Kierowanie informacji zwrotnych, reklamacje i vigilance, PSUR, przeglądy okresowe, starzenie | 22 |
| 17 | [Komponenty AI/ML](checklist/pl/17-ai-ml-components.md) | Inwentarz, akt o AI i PCCP FDA, zarządzanie danymi, działanie w podgrupach, kontrole LLM, nadzór, monitorowanie | 34 |
| 18 | [Dokumenty do dostarczenia](checklist/pl/18-documentation-deliverables.md) | Zestaw dokumentów oczekiwany przez audytora, według norm | 56 |
| 19 | [Organizacja i ludzie](checklist/pl/19-organisation-and-people.md) | Nazwane role, szkolenia, umowy i licencje, zarządzanie, ciągłość | 34 |

Szablony (po angielsku): [oświadczenie o przewidzianym zastosowaniu](templates/intended-use-statement.md) · [rejestr SOUP](templates/soup-register.md) · [macierz śledzalności](templates/traceability-matrix.md) · [zarys DPIA](templates/dpia-outline.md) · [rejestr ryzyka](templates/risk-register.md) · [inwentarz usług Firebase](templates/firebase-service-inventory.md) · [rejestr SDK stron trzecich](templates/third-party-sdk-register.md) · [zapis wydania](templates/release-record.md)

## Co jest w zakresie

- Aplikacje Flutter na iOS, Android i web.
- Firebase i usługi Google Cloud wokół niego (Firestore, Storage, Functions/Cloud Run, Authentication/Identity Platform, App Check, FCM, Hosting, Analytics, Crashlytics, Remote Config, Secret Manager, Logging, BigQuery, Vertex AI).
- Oprogramowanie jako wyrób medyczny i aplikacje towarzyszące wyrobom, w tym urządzenia noszone i czujniki BLE.
- UE (MDR/IVDR, RODO, akt o AI, EHDS, programy krajowe) i USA (FDA, HIPAA, FTC, prawo stanowe), ze wskazówkami dla UK i Szwajcarii.

Poza zakresem: projektowanie sprzętu, przepływy laboratoryjne IVD, certyfikacja EHR w głębi i wszystko, na co dla Twojej konkretnej firmy musi odpowiedzieć prawnik.

## Autor

Napisał i utrzymuje [Piotr Bomba](https://piotrbomba.com/pl/), który buduje aplikacje Flutter i Firebase dla ochrony zdrowia (ostatnia jest właśnie w badaniu klinicznym) i przyszedł do tego z badań w fizyce medycznej. Powiązane materiały na stronie:

- [Jak zaudytować aplikację Flutter i Firebase z danymi pacjentów](https://piotrbomba.com/pl/poradniki/audyt-aplikacji-flutter-firebase-z-danymi-pacjentow-checklista) (krótka wersja tej listy, tylko bezpieczeństwo)
- [Zabezpieczanie aplikacji Flutter + Firebase dla danych medycznych](https://piotrbomba.com/pl/poradniki/zabezpieczanie-aplikacji-flutter-firebase-dla-danych-medycznych) (kurs)
- [Audyt bezpieczeństwa i RODO aplikacji medycznej we Flutterze i Firebase](https://piotrbomba.com/pl/uslugi/audyt-bezpieczenstwa-rodo-aplikacji-medycznej-flutter-firebase) (przegląd o stałym zakresie z pisemnym raportem)

Jeśli ta checklista oszczędziła Ci tydzień, gwiazdka i link zwrotny to cała opłata licencyjna.

## Współtworzenie i licencja

Zgłoszenia i pull requesty są mile widziane; zob. [CONTRIBUTING.md](CONTRIBUTING.md). Treść jest na licencji [CC BY 4.0](LICENSE): używaj, kopiuj do swojego QMS, tłumacz, pod warunkiem zachowania atrybucji. Warunki użycia: [DISCLAIMER.md](DISCLAIMER.md).
