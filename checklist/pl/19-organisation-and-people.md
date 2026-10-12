# 19 · Organizacja, role, umowy i ludzie

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Małe zespoły częściej przepadają na audytach przez role i umowy niż przez kod. Ten plik wymienia nazwane odpowiedzialności i umowy, których potrzebuje produkt medyczny na Flutterze i Firebase w UE i USA.

## A. Nazwane role

- [ ] **ORG-01** [ALL][M] Przedstawiciel najwyższego kierownictwa dla QMS (ISO 13485 §5.5.2) wskazany.
- [ ] **ORG-02** [EU][M] Osoba odpowiedzialna za zgodność regulacyjną (MDR art. 15) wskazana z dowodami kwalifikacji; umowa z zewnętrzną PRRC, jeśli używana.
- [ ] **ORG-03** [EU][M] Upoważniony przedstawiciel (producenci spoza UE) z upoważnieniem; UK Responsible Person i CH-REP, jeśli dotyczy.
- [ ] **ORG-04** [US][M] US Agent (zakłady zagraniczne); oficjalny korespondent dla rejestracji i listingu.
- [ ] **ORG-05** [EU][M] Inspektor ochrony danych (gdy wymagany) i przedstawiciel w UE (administratorzy spoza UE).
- [ ] **ORG-06** [US][M] HIPAA Privacy Official i Security Official.
- [ ] **ORG-07** [ALL][M] Lider kliniczny / doradca medyczny odpowiedzialny za treść kliniczną i safety case (Clinical Safety Officer przy sprzedaży do NHS).
- [ ] **ORG-08** [ALL][M] Lider bezpieczeństwa odpowiedzialny za program cyberbezpieczeństwa i obsługę podatności.
- [ ] **ORG-09** [ALL][M] Właściciel produktu dla organizacji Firebase/Google Cloud (rozliczenia, IAM, plan wsparcia); co najmniej dwóch właścicieli ze sprzętowym MFA, brak pojedynczego punktu awarii.
- [ ] **ORG-10** [ALL][S] Lider użyteczności/czynników ludzkich i właściciel dostępności.
- [ ] **ORG-11** [ALL][S] Zastępca dla każdej roli krytycznej; zastępstwa urlopowe i przy odejściu udokumentowane.

## B. Kompetencje i szkolenia

- [ ] **ORG-20** [ALL][M] Wymagania kompetencyjne per rola spisane (np. programiści Flutter: bezpieczne kodowanie, podstawy 62304, świadomość RODO/HIPAA; recenzenci: bezpieczeństwo reguł; wsparcie: obsługa prywatności).
- [ ] **ORG-21** [ALL][M] Plan i zapisy szkoleń: onboarding QMS, świadomość bezpieczeństwa (co roku), prywatność (co roku), kompetencje AI (akt o AI art. 4), podstawy bezpieczeństwa klinicznego, zmiany polityk platform.
- [ ] **ORG-22** [ALL][M] Kontraktorzy i agencje przeszkoleni i zobowiązani do tych samych procedur; dostęp kończy się z umową.
- [ ] **ORG-23** [ALL][S] Wiedza regulacyjna i normatywna utrzymywana: subskrypcje, zewnętrzni konsultanci, udział w grupach roboczych.

## C. Umowy i porozumienia

- [ ] **ORG-30** [ALL][M] Umowy z klientami (szpitale, przychodnie, płatnicy): role wg RODO/HIPAA, SLA, powiadamianie o incydentach, zwrot i usunięcie danych, prawa audytu, zatwierdzanie podwykonawców, limity odpowiedzialności zgodne z ubezpieczeniem, oświadczenia o statusie regulacyjnym.
- [ ] **ORG-31** [ALL][M] Warunki Google Cloud / Firebase, Data Processing Terms, BAA (USA) zaakceptowane przez właściwy podmiot prawny; kopie zachowane; odnowienia śledzone.
- [ ] **ORG-32** [ALL][M] Umowy Apple Developer Program i Google Play Developer zawarte przez podmiot prawny producenta (nie prywatne konto programisty); sukcesja własności konta zaplanowana.
- [ ] **ORG-33** [ALL][M] Umowy z podmiotami przetwarzającymi i podprocesorami dla każdego dostawcy (plik 03/04); BAA z dalszymi dostawcami (USA).
- [ ] **ORG-34** [ALL][M] Umowy z producentami urządzeń (urządzenia podłączone) określające producenta systemu, odpowiedzialność za vigilance, koordynację aktualizacji firmware.
- [ ] **ORG-35** [ALL][M] Licencje terminologii i treści: SNOMED CT (krajowe centrum / licencja członkowska IHTSDO), LOINC (bezpłatna, z atrybucją), bazy leków, zwalidowane kwestionariusze (zgoda wydawcy), fonty i ikony, obrazy medyczne.
- [ ] **ORG-36** [ALL][M] Zgodność licencji open source dla wszystkich pakietów (ekran atrybucji, przegląd copyleft).
- [ ] **ORG-37** [ALL][M] Ubezpieczenie OC za produkt i cyber odpowiednie do klasy, rynków i ekspozycji umownej; wpływ dyrektywy o odpowiedzialności za produkt z 2024 przejrzany.
- [ ] **ORG-38** [ALL][S] Umowa z jednostką notyfikowaną (zakres, obowiązki powiadamiania o zmianach, audyty nadzoru, audyty niezapowiedziane).
- [ ] **ORG-39** [ALL][S] Umowy o współpracy badawczej i udostępnianiu danych (uczelnie, szpitale) z klauzulami etycznymi i z art. 89 RODO.
- [ ] **ORG-40** [ALL][S] Regulamin / EULA dla pacjentów w każdym języku, spójny z instrukcją i polityką prywatności, przejrzany przez prawnika pod kątem prawa konsumenckiego.

## D. Zarządzanie i kultura

- [ ] **ORG-50** [ALL][M] Rada kontroli zmian (mogą to być trzy osoby) zatwierdza zmiany przewidzianego zastosowania, treści klinicznej i architektury; protokoły zachowane.
- [ ] **ORG-51** [ALL][M] Obawy dotyczące bezpieczeństwa zgłaszane przez dowolnego członka zespołu są rejestrowane i przeglądane; zgłaszanie problemów bez obwiniania.
- [ ] **ORG-52** [ALL][M] Zatwierdzanie materiałów marketingowych i sprzedażowych obejmuje przegląd regulacyjny (kontrola twierdzeń).
- [ ] **ORG-53** [ALL][S] Przegląd etyczny funkcji dotykających grup wrażliwych, zdrowia psychicznego, zdrowia reprodukcyjnego, genetyki lub dzieci.
- [ ] **ORG-54** [ALL][S] Zarząd/kierownictwo otrzymuje kwartalny dashboard zgodności i bezpieczeństwa.

## E. Ciągłość działania

- [ ] **ORG-60** [ALL][M] Plan ciągłości działania: utrata kluczowych osób, utrata dostępu do Google Cloud, utrata kont w sklepach, obowiązki zwrotu danych klientom i pacjentom przy niewypłacalności.
- [ ] **ORG-61** [ALL][M] Depozyt kodu lub udokumentowany pakiet przekazania dla klientów wymagających ciągłości systemu klinicznego.
- [ ] **ORG-62** [ALL][S] Dane dostępowe i kody odzyskiwania do kont krytycznych (super-admin organizacji Google, Apple, Google Play, rejestrator domen, DNS) w firmowym sejfie z odzyskiwaniem przez dwie osoby.

## F. Dowody potrzebne w tej sekcji

Schemat organizacyjny z rolami regulowanymi, pisma powołania i kwalifikacje, macierz i zapisy szkoleń, rejestr umów z datami odnowień, rejestr licencji, polisy ubezpieczeniowe, protokoły rady kontroli zmian, plan ciągłości.
