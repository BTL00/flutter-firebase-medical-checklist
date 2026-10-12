# 06 · Program cyberbezpieczeństwa

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Regulatorzy traktują dziś bezpieczeństwo jako właściwość bezpieczeństwa pacjenta. Zarówno FDA (§524B, wytyczne 2023/2025), jak i MDR (zał. I §17.2/17.4, MDCG 2019-16) oczekują **Secure Product Development Framework**, modelu zagrożeń, SBOM, dowodów z testów i porynkowego procesu obsługi podatności. IEC 81001-5-1 to norma, która to spina. Konkretne kontrole Flutter i Firebase są w plikach 07–10; ten plik to program wokół nich.

## A. Bezpieczny proces rozwoju produktu (IEC 81001-5-1, FDA SPDF)

- [ ] **SEC-01** [ALL][M] Bezpieczeństwo jest w planie rozwoju oprogramowania z czynnościami na każdym etapie: wymagania bezpieczeństwa, modelowanie zagrożeń, przegląd bezpiecznego projektu, zasady bezpiecznego kodowania, testy bezpieczeństwa, przegląd bezpieczeństwa przed wydaniem, działania porynkowe.
- [ ] **SEC-02** [ALL][M] **Wymagania bezpieczeństwa** w SRS: siła uwierzytelniania, polityka sesji, model autoryzacji, szyfrowanie, logowanie, integralność, cele dostępności, bezpieczna aktualizacja, bezpieczna konfiguracja, usuwanie danych.
- [ ] **SEC-03** [ALL][M] Standard bezpiecznego kodowania dla Dart/Flutter i dla Cloud Functions w Node/Python; reguły lintera wymuszane w CI (np. `very_good_analysis` lub własny `analysis_options.yaml`, wtyczki bezpieczeństwa ESLint).
- [ ] **SEC-04** [ALL][M] Szkolenia z bezpieczeństwa dla programistów co najmniej raz w roku, z zapisami (OWASP Mobile Top 10, MASVS, model bezpieczeństwa Firebase).
- [ ] **SEC-05** [ALL][M] Przegląd bezpieczeństwa jest bramką wydania: lista kontrolna podpisana przez kogoś innego niż autor.
- [ ] **SEC-06** [ALL][S] Rola security champion lub zewnętrzny partner bezpieczeństwa przypisany do produktu.

## B. Modelowanie zagrożeń i zarządzanie ryzykiem bezpieczeństwa

- [ ] **SEC-10** [ALL][M] **Model zagrożeń** (STRIDE lub równoważny) obejmuje: aplikację Flutter na potencjalnie skompromitowanym urządzeniu, reguły Firestore/Storage, Cloud Functions, Auth, App Check, narzędzia administracyjne, CI/CD, laptopy programistów, organizację Google Cloud, API stron trzecich, połączenia FHIR, powiadomienia push, deep linki, build webowy.
- [ ] **SEC-11** [ALL][M] Diagramy przepływu danych z granicami zaufania; każdy magazyn PHI/danych o zdrowiu oznaczony; scenariusz „atakujący z pełnym dostępem do odczytu Firestore” wyraźnie opisany.
- [ ] **SEC-12** [ALL][M] **Ocena ryzyka bezpieczeństwa** oddzielna od ryzyka bezpieczeństwa pacjenta (AAMI TIR57): punktacja oparta na możliwości wykorzystania (CVSS lub równoważna), kontrole, ryzyko resztkowe; ryzyka bezpieczeństwa z wpływem na pacjenta odwzorowane w dokumentacji ISO 14971.
- [ ] **SEC-13** [ALL][M] Model zagrożeń aktualizowany przy zmianie architektury i co najmniej raz w roku; historia wersji zachowana.
- [ ] **SEC-14** [ALL][S] Przypadki nadużyć obejmują insiderów (wsparcie, programiści), utracone urządzenia, wspólne urządzenia rodzinne, współdzielone stacje robocze klinicystów dla buildu webowego.

## C. Architektura bezpieczeństwa (widoki architektury FDA)

- [ ] **SEC-20** [ALL][M] Udokumentowane widoki: globalny widok systemu, widok szkody wielu pacjentów, widok aktualizowalności/łatania i widoki przypadków użycia bezpieczeństwa (wytyczne FDA 2023/2025, załącznik 2) lub równoważny zestaw dla MDR.
- [ ] **SEC-21** [ALL][M] Inwentarz kryptografii: algorytmy, długości kluczy, biblioteki, przechowywanie i rotacja kluczy dla TLS, w spoczynku (zarządzane przez Google vs CMEK), po stronie urządzenia (Keychain/Keystore), tokenów, kopii zapasowych.
- [ ] **SEC-22** [ALL][M] Ścieżka **bezpiecznej aktualizacji**: mechanizm wymuszonej aktualizacji, minimalna wspierana wersja wymuszana po stronie serwera, proces wydań w sklepach, plan cofnięcia, cele czasu do załatania.
- [ ] **SEC-23** [ALL][M] **Bazowa bezpieczna konfiguracja** projektu Google Cloud (IAM, polityki organizacji, logi audytowe, App Check, ustawienia Auth) udokumentowana i sprawdzana pod kątem dryfu.
- [ ] **SEC-24** [ALL][S] Obrona w głąb: reguły + walidacja w Functions + App Check + kontrole klienckie; żadna pojedyncza kontrola nie jest jedyną barierą przed PHI.

## D. Software Bill of Materials i łańcuch dostaw

- [ ] **SEC-30** [ALL][M] **SBOM** generowany dla każdego wydania w SPDX lub CycloneDX z `pubspec.lock`, lockfile Gradle i CocoaPods, `package-lock.json`/`requirements.txt` Functions, obrazów kontenerów; obejmuje silnik Flutter, Dart SDK, Firebase SDK; maszynowo czytelny i dołączony do zapisu wydania.
- [ ] **SEC-31** [ALL][M] Pola SBOM wg minimalnych elementów NTIA plus status wsparcia / koniec życia (FDA pyta o poziom wsparcia i datę EOL dla każdego komponentu).
- [ ] **SEC-32** [ALL][M] Skanowanie podatności zależności w CI (OSV-Scanner, Dependabot dla pub, npm audit, Trivy dla kontenerów) z SLA triage według powagi.
- [ ] **SEC-33** [ALL][M] Polityka weryfikacji pakietów z pub.dev: preferencja zweryfikowanych wydawców, aktywność utrzymania, licencja, przegląd kodu natywnego, brak pełzania uprawnień; zatwierdzenia zapisane w rejestrze SOUP.
- [ ] **SEC-34** [ALL][M] Lockfile w repozytorium; `dart pub get --enforce-lockfile` w CI; brak płynnych wersji w Functions.
- [ ] **SEC-35** [ALL][S] Pochodzenie buildu: buildy tylko z CI, podpisane artefakty, atestacja w stylu SLSA, chronione gałęzie, obowiązkowy przegląd, podpisane commity lub zweryfikowane merge.
- [ ] **SEC-36** [ALL][S] Skan zgodności licencyjnej (obowiązki copyleft w zamkniętej aplikacji) częścią bramki wydania.

## E. Testy bezpieczeństwa

- [ ] **SEC-40** [ALL][M] **Analiza statyczna** (analizator Dart z ostrymi regułami, Semgrep, ESLint security) na każdym PR.
- [ ] **SEC-41** [ALL][M] **Testy jednostkowe reguł Firestore i Storage** w emulatorze obejmujące przypadki allow i deny dla każdej kolekcji i roli; uruchamiane w CI; pokrycie reguł udokumentowane.
- [ ] **SEC-42** [ALL][M] **Test bezpieczeństwa aplikacji mobilnej** względem OWASP MASVS (L2 + R dla medycznych) z przypadkami testowymi MASTG; MobSF lub równoważne plus testy ręczne przechowywania, IPC, sieci, interakcji z platformą, jakości kodu, odporności.
- [ ] **SEC-43** [ALL][M] **Test penetracyjny** przez niezależną stronę przed pierwszym wydaniem i po dużych zmianach (co najmniej raz w roku), w zakresie backend Firebase, Functions, narzędzia administracyjne, build webowy; raport, naprawa i dowody retestu.
- [ ] **SEC-44** [ALL][M] Testy fuzzingowe/odporności parsowania wejść (ładunki FHIR, ramki BLE, parametry deep linków, ładunki Functions).
- [ ] **SEC-45** [ALL][M] Testy regresji bezpieczeństwa dla każdej naprawionej podatności.
- [ ] **SEC-46** [ALL][S] Skanowanie konfiguracji chmury (Security Command Center, polityki w stylu Forseti, IAM recommender `gcloud`) zaplanowane.
- [ ] **SEC-47** [ALL][S] Test znanych podatności dokładnie wydanych wersji (nie tylko repozytorium) przez skanowanie finalnego IPA/APK/AAB i wdrożonych Functions.

## F. Zarządzanie podatnościami i ich ujawnianie

- [ ] **SEC-50** [ALL][M] **Polityka skoordynowanego ujawniania podatności** opublikowana (security.txt pod `/.well-known/security.txt`, strona bezpieczeństwa, PGP lub formularz), zgodna z ISO/IEC 29147 i 30111; podane cele potwierdzenia i naprawy.
- [ ] **SEC-51** [ALL][M] Monitorowane źródła podatności: ostrzeżenia bezpieczeństwa Flutter/Dart, release notes Firebase, GitHub advisories, NVD/OSV dla wszystkich komponentów SBOM, ostrzeżenia platform Apple/Google, CISA KEV.
- [ ] **SEC-52** [ALL][M] Procedura oceny rozróżnia **ryzyko kontrolowane i niekontrolowane** (wytyczne porynkowe FDA) z celami komunikacji i naprawy (30/60 dni dla niekontrolowanego); odpowiedniki UE powiązane z vigilance.
- [ ] **SEC-53** [ALL][M] Pipeline poprawek potrafi dostarczyć hotfix do obu sklepów i Functions w zadeklarowanym czasie, z przyspieszonym przeglądem Apple, gdy uzasadnione.
- [ ] **SEC-54** [ALL][M] Komunikaty o podatnościach dla użytkowników i klientów przygotowane jako szablony (co, wpływ, działanie) i powiązane z decyzjami o wycofaniu/FSCA.
- [ ] **SEC-55** [ALL][S] Udział w ISAO (np. Health-ISAC) albo przynajmniej subskrypcja jego ostrzeżeń.

## G. Reagowanie na incydenty i odporność

- [ ] **SEC-60** [ALL][M] **Plan reagowania na incydenty** z rolami, poziomami powagi, przyjmowaniem incydentów od Google Cloud, forensyką (eksport Cloud Audit Logs do zablokowanego bucketa), działaniami powstrzymującymi (unieważnienie tokenów, wyłączenie dostawców Auth, rotacja kluczy, zablokowanie reguł), komunikacją (klienci, organy, użytkownicy) i przeglądem po incydencie.
- [ ] **SEC-61** [ALL][M] Plan incydentów powiązany z terminami 72 godzin RODO, HIPAA/BAA i FTC HBNR oraz ze zgłaszaniem vigilance, gdy dotknięte jest bezpieczeństwo pacjenta.
- [ ] **SEC-62** [ALL][M] Logowanie i wykrywanie: Cloud Audit Logs (w tym Data Access logs dla Firestore i Storage) przechowywane i alertowane; alerty anomalii (masowe odczyty, wdrożenia reguł, zmiany IAM, nowe klucze kont serwisowych, wyłączenie App Check).
- [ ] **SEC-63** [ALL][M] Kopie zapasowe i odtwarzanie przetestowane; RPO/RTO zdefiniowane w SRS i sprawdzone w ćwiczeniu.
- [ ] **SEC-64** [ALL][M] Projekt dostępności: łagodna degradacja offline, tryb tylko do odczytu, strona statusu, wskazówki dla użytkownika przy niedostępności backendu; decyzja Firestore multi-region vs regional udokumentowana.
- [ ] **SEC-65** [ALL][S] Coroczne ćwiczenie sztabowe obejmujące wyciek klucza konta serwisowego, złośliwego insidera i regresję reguł Firestore.

## H. Oznakowanie bezpieczeństwa i dokumentacja dla klientów

- [ ] **SEC-70** [ALL][M] Instrukcja używania/oznakowanie zawierają: wspierane wersje OS, wymagania urządzeń, zalecane ustawienia bezpieczeństwa urządzenia, wymagania sieciowe, zachowanie aplikacji na urządzeniach z rootem/jailbreakiem, sposób zgłaszania podatności, sposób dostarczania aktualizacji, gdzie przechowywane są dane, politykę końca wsparcia.
- [ ] **SEC-71** [ALL][M] Dokumentacja bezpieczeństwa dla klientów (szpitali): przegląd architektury, przepływy danych, szyfrowanie, kontrola dostępu, logowanie, dostępność SBOM, podsumowanie pentestu, certyfikaty, formularz MDS2 (ANSI/NEMA HN 1-2019) dla zakupów szpitali w USA.
- [ ] **SEC-72** [ALL][S] Polityka końca życia / końca wsparcia opublikowana; jak dane są zwracane lub usuwane po zakończeniu umowy.

## I. Certyfikaty i ramy (wybieraj świadomie)

- [ ] **SEC-80** [ALL][S] ISO/IEC 27001 (z 27701 i 27799 jako rozszerzeniami dla zdrowia) lub SOC 2 Type II w zakresie produktu; wymagane w wielu przetargach szpitalnych i w DiGA.
- [ ] **SEC-81** [ALL][S] Mapowanie HITRUST lub NIST CSF 2.0, jeśli pytają klienci korporacyjni z USA; praktyki HHS 405(d) HICP jako odniesienie.
- [ ] **SEC-82** [ALL][N] Cyber Essentials Plus (UK), BSI C5 lub krajowe odpowiedniki, gdy wymagają przetargi.

## J. Dowody potrzebne w tej sekcji

Plan bezpieczeństwa, wymagania bezpieczeństwa, model zagrożeń, ocena ryzyka bezpieczeństwa, widoki architektury, SBOM per wydanie, raporty skanów i pentestów, polityka CVD, log podatności, plan reagowania na incydenty i zapisy ćwiczeń, oznakowanie bezpieczeństwa, MDS2.
