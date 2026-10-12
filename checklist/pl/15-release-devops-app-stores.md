# 15 · Wydania, DevOps i sklepy z aplikacjami

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Wydanie aplikacji medycznej to proces nadzorowany ze śladem dokumentowym, a sklepy dodają własne zasady dla zdrowia. Ten plik obejmuje CI/CD, zgodność ze sklepami oraz mechanikę kontrolowanego wydania i cofnięcia.

## A. Pipeline CI/CD

- [ ] **REL-01** [ALL][M] Wszystkie buildy release pochodzą z CI na chronionej gałęzi/tagu; programiści nie mogą publikować z laptopów; definicje pipeline wersjonowane i przeglądane.
- [ ] **REL-02** [ALL][M] Bramki pipeline: lint, testy jednostkowe, widżetów, reguł, integracyjne, skan zależności, generowanie SBOM, skan licencji, testy dostępności; niespełniona bramka blokuje wydanie.
- [ ] **REL-03** [ALL][M] Klucze podpisujące (klucz upload Androida, certyfikaty/profile iOS) w menedżerze sekretów lub usłudze wspartej HSM; Play App Signing włączone; dostęp logowany; procedury rotacji i utraty spisane.
- [ ] **REL-04** [ALL][M] Sekrety CI ograniczone per środowisko; wdrożenie produkcyjne wymaga ręcznego zatwierdzenia przez wskazaną rolę.
- [ ] **REL-05** [ALL][M] Artefakty buildu (AAB/IPA, pliki symboli, SBOM, raporty testów, paczka Functions, reguły) archiwizowane niezmiennie per wydanie z hashem commitu; retencja zgodna z retencją dokumentacji technicznej.
- [ ] **REL-06** [ALL][M] Wdrożenia infrastruktury (reguły i indeksy Firestore, Functions, konfiguracja Auth, App Check, szablony Remote Config, Hosting) przechodzą to samo zatwierdzenie i są wdrażane atomowo razem z aplikacją lub przed nią, z oknem kompatybilności.
- [ ] **REL-07** [ALL][S] Runnery pipeline wzmocnione i efemeryczne; akcje CI stron trzecich przypięte hashem commitu.
- [ ] **REL-08** [ALL][S] Kontrola odtwarzalności: drugi build z tego samego tagu daje zgodne artefakty (lub różnice są wyjaśnione).

## B. Zarządzanie wydaniami

- [ ] **REL-10** [ALL][M] Procedura wydania obejmuje: listę zmian ze śledzalnością, analizę wpływu, zakończenie V&V, ocenę regulacyjną (UDI-DI vs UDI-PI, istotna zmiana, powiadomienie jednostki/FDA), aktualizację dokumentacji, aktualizację oznakowania, zatwierdzenie, publikację, kontrole po wydaniu.
- [ ] **REL-11** [ALL][M] **Informacje o wydaniu** dla użytkowników w każdym języku, przejrzane przez dział regulacyjny; wewnętrzny zapis wydania wymienia wersje wszystkich elementów konfiguracji.
- [ ] **REL-12** [ALL][M] Schemat wersjonowania udokumentowany (wersja semantyczna + numer buildu; mapowanie na UDI-PI) i widoczny na ekranie „O aplikacji” oraz w Crashlytics.
- [ ] **REL-13** [ALL][M] **Stopniowe wdrażanie** używane (staged rollout w Play, phased release w App Store) z jawnymi kryteriami zatrzymania (odsetek bez awarii, odsetek błędów, reklamacje kliniczne) i właścicielem monitoringu podczas wdrażania.
- [ ] **REL-14** [ALL][M] **Minimalna wspierana wersja** wymuszana po stronie serwera z przepływem wymuszonej aktualizacji (link do sklepu, czytelny komunikat) i polityką karencji; sama wymuszona aktualizacja nie może odciąć użytkowników od krytycznych danych w trybie odczytu bez decyzji.
- [ ] **REL-15** [ALL][M] **Plan cofnięcia**: cofnięcie aplikacji w sklepach nie jest możliwe, więc istnieją zmiany backendu kompatybilne wstecz, flagi funkcji do bezpiecznego wyłączenia i przetestowany „wyłącznik” wadliwej funkcji; cofnięcie Functions i reguł przetestowane.
- [ ] **REL-16** [ALL][M] Ścieżka hotfix z przyspieszonym przeglądem (Apple) i tymi samymi bramkami poza jawnie uchylonymi, z udokumentowanym uchyleniem.
- [ ] **REL-17** [ALL][S] Kalendarz wydań unika weekendów i świąt dla aplikacji używanych klinicznie; dyżur podczas i po wydaniu.

## C. Apple App Store

- [ ] **STO-01** [ALL][M] **Wytyczna 1.4.1** (szkoda fizyczna): aplikacje medyczne ujawniają źródła danych i metodologię; kalkulatory dawek spełniają zasadę pochodzenia/zatwierdzenia; aplikacje mogące dostarczać niedokładne dane są odrzucane.
- [ ] **STO-02** [ALL][M] **Wytyczna 5.1.3** (zdrowie i badania zdrowotne): zasady HealthKit i danych zdrowotnych, brak danych zdrowotnych w iCloud, świadoma zgoda dla aplikacji badawczych, dostępne dowody zgody komisji bioetycznej.
- [ ] **STO-03** [ALL][M] Status regulacyjny odzwierciedlony w opisie (twierdzenia o dopuszczeniu/CE tylko gdy prawdziwe); App Review może zażądać dokumentów FDA lub CE dla twierdzeń diagnostycznych.
- [ ] **STO-04** [ALL][M] Szczegóły App Privacy („etykiety”) zgodne ze zbieraniem przez każde SDK; Privacy Manifests i required-reason API zadeklarowane; podpisy SDK stron trzecich spełnione.
- [ ] **STO-05** [ALL][M] Usuwanie konta w aplikacji; Sign in with Apple oferowane, jeśli oferowane są inne logowania stron trzecich; zasady subskrypcji i zwrotów przestrzegane.
- [ ] **STO-06** [ALL][M] Zastrzeżenia medyczne i wskazówki awaryjne obecne; aplikacja nie twierdzi, że zastępuje lekarza, chyba że jest do tego dopuszczona.
- [ ] **STO-07** [ALL][S] Notatki dla recenzenta zawierają dane demo do testowego najemcy z danymi syntetycznymi i podsumowanie regulacyjne skracające przegląd.

## D. Google Play

- [ ] **STO-10** [ALL][M] **Polityka Health apps**: formularz deklaracji zdrowotnej, ujawnienie funkcji medycznych, odniesienia kliniczne dla twierdzeń, informacje regulacyjne w opisie, gdy dotyczy.
- [ ] **STO-11** [ALL][M] Uprawnienia **Health Connect**: zatwierdzone przypadki użycia, link do polityki prywatności, ekran uzasadnienia, usuwanie danych, brak użycia do reklam, uzasadnienie odczytu historii.
- [ ] **STO-12** [ALL][M] Formularz **Data Safety** zgodny z rzeczywistym zbieraniem przez wszystkie SDK; URL do usuwania konta i danych podany; aktualizowany przy każdej zmianie SDK.
- [ ] **STO-13** [ALL][M] Docelowy poziom API aktualny; polityki uprawnień (lokalizacja w tle, SMS, rejestr połączeń) uzasadnione lub unikane; formularze deklaracji wrażliwych uprawnień wypełnione.
- [ ] **STO-14** [ALL][M] Play App Signing, kopia klucza upload, 2FA konta deweloperskiego i konto organizacji (nie osoby) ze zweryfikowaną tożsamością.
- [ ] **STO-15** [ALL][S] Raport przedpremierowy i werdykty Play Integrity przeglądane per wydanie.

## E. Dystrybucja korporacyjna i alternatywna

- [ ] **STO-20** [ALL][S] Dystrybucja przez MDM szpitali (aplikacje własne Apple Business Manager, zarządzany Google Play) wspierana z udokumentowanymi kluczami konfiguracji (AppConfig).
- [ ] **STO-21** [ALL][S] Alternatywna dystrybucja w UE (DMA) i ryzyka sideloadingu ocenione; aplikacja weryfikuje źródło własnej instalacji tam, gdzie ma to znaczenie dla dokumentacji ryzyka.
- [ ] **STO-22** [ALL][S] Dystrybucja aplikacji webowej (Firebase Hosting) ma własną bramkę wydania, baner wersji i cache-busting; service worker informuje użytkowników o aktualizacji.

## F. Gotowość operacyjna

- [ ] **OPS-01** [ALL][M] Runbooki dla: awarii, regresji reguł, awarii Functions, awarii Auth, wygaśnięcia certyfikatu, rotacji kluczy, wyczerpania kwot, usunięcia ze sklepu, wymuszonej aktualizacji, odtwarzania danych.
- [ ] **OPS-02** [ALL][M] Dyżury i eskalacja z kryteriami wpływu klinicznego; godziny wsparcia podane w umowach i instrukcji.
- [ ] **OPS-03** [ALL][M] Strona statusu lub kanał powiadamiania klientów o incydentach; szablony przejrzane przez dział regulacyjny pod kątem sformułowań.
- [ ] **OPS-04** [ALL][M] Plan wsparcia Google Cloud odpowiedni do użycia klinicznego; ścieżka eskalacji znana.
- [ ] **OPS-05** [ALL][S] Monitorowanie kosztów z alertami anomalii (źle działające zapytanie to incydent zarówno kosztowy, jak i dostępności).
- [ ] **OPS-06** [ALL][S] Cele poziomu usług zdefiniowane (dostępność, latencja synchronizacji, dostarczanie alertów) i raportowane klientom.

## G. Dowody potrzebne w tej sekcji

Definicje pipeline i logi uruchomień, zapisy przechowywania kluczy podpisujących, procedura i zapisy wydań, informacje o wydaniu, decyzje o stopniowym wdrażaniu, deklaracje sklepów (zdrowie, bezpieczeństwo danych, etykiety prywatności), dowody testów cofnięcia/wyłącznika, runbooki, grafik dyżurów.
