# 14 · Weryfikacja i walidacja

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Weryfikacja: czy zbudowaliśmy to dobrze (testy względem wymagań). Walidacja: czy zbudowaliśmy właściwą rzecz (działa dla przewidzianych użytkowników w przewidzianym użyciu). Obie potrzebują planów, zapisów i śledzalności.

## A. Planowanie i śledzalność

- [ ] **VV-01** [ALL][M] **Plan weryfikacji** per wydanie: zakres, poziomy testów, środowiska, macierz urządzeń, kryteria wejścia/wyjścia, role, narzędzia, obsługa anomalii.
- [ ] **VV-02** [ALL][M] **Macierz śledzalności** łączy potrzeby użytkowników → wymagania systemowe → wymagania oprogramowania → środki kontroli ryzyka → projekt → testy → wyniki; generowana lub utrzymywana per wydanie. → szablon: `templates/traceability-matrix.md`
- [ ] **VV-03** [ALL][M] Każde wymaganie ma co najmniej jeden test; każdy środek kontroli ryzyka ma weryfikację wdrożenia i skuteczności.
- [ ] **VV-04** [ALL][M] Przypadki testowe są dokumentami nadzorowanymi (w repozytorium, przeglądane); wyniki testów są zapisami (artefakty CI, podpisane raporty) przechowywanymi z wydaniem.
- [ ] **VV-05** [ALL][S] Cele pokrycia zdefiniowane per klasa bezpieczeństwa (np. instrukcje + gałęzie dla pakietów logiki klinicznej; pokrycie reguł dla Firestore); raporty pokrycia archiwizowane.

## B. Testy automatyczne w kodzie Flutter

- [ ] **VV-10** [ALL][M] **Testy jednostkowe** całej logiki klinicznej w czystych pakietach Dart, w tym referencyjne zestawy testowe z pliku 12, wartości brzegowe, nieprawidłowe wejścia, warianty locale i jednostek.
- [ ] **VV-11** [ALL][M] **Testy widżetów** krytycznych ekranów: wyświetlanie tożsamości, renderowanie wartości + jednostki + znacznika czasu, stany błędu i offline, dialogi potwierdzeń, kontrole wytycznych dostępności.
- [ ] **VV-12** [ALL][M] **Testy golden** ekranów, gdzie poprawność układu jest klinicznie istotna (wykresy, tabele, ekrany dawkowania) w różnych skalach tekstu i motywach.
- [ ] **VV-13** [ALL][M] **Testy integracyjne** (`integration_test`, Patrol lub równoważne) przepływów end-to-end na **Firebase Emulator Suite** z zasianymi pseudonimowymi danymi: logowanie, MFA, wprowadzanie danych, synchronizacja, offline → online, widok klinicysty, usuwanie.
- [ ] **VV-14** [ALL][M] **Testy reguł Firestore i Storage** (macierz allow/deny) w CI (plik 08).
- [ ] **VV-15** [ALL][M] **Testy Cloud Functions**: jednostkowe z mockami usług, integracyjne w emulatorze, testy kontraktowe zewnętrznych API (FHIR, SMS, e-mail).
- [ ] **VV-16** [ALL][M] Testy migracji i kompatybilności wstecznej (stara wersja aplikacji vs nowe dane; nowa wersja vs stare dane).
- [ ] **VV-17** [ALL][M] Niestabilne testy śledzone jako problemy; brak polityki „powtarzaj aż zielone” w pipeline wydań.
- [ ] **VV-18** [ALL][S] Testy mutacyjne lub wstrzykiwanie błędów dla pakietu logiki klinicznej, by dowieść, że testy wykrywają usterki.
- [ ] **VV-19** [ALL][S] Testy oparte na własnościach dla konwersji jednostek, arytmetyki dat i parsowania.

## C. Macierz urządzeń i testy ręczne

- [ ] **VV-20** [ALL][M] Macierz wspieranych urządzeń udokumentowana (wersje OS, rozmiary ekranów, producenci, urządzenia niskiej klasy, tablety, przeglądarki) i powiązana z GSPR §17.3; każde wydanie testowane na zdefiniowanym podzbiorze z zapisami.
- [ ] **VV-21** [ALL][M] Farma urządzeń (Firebase Test Lab lub równoważna) uruchamia zestaw integracyjny na macierzy; wyniki archiwizowane.
- [ ] **VV-22** [ALL][M] Ręczne karty testów eksploracyjnych dla obszarów, których automatyzacja nie łapie: powiadomienia, działanie w tle, odbieranie uprawnień, aktualizacje OS, dostępność z czytnikami ekranu, urządzenia BLE.
- [ ] **VV-23** [ALL][M] Testy instalacji, aktualizacji i odinstalowania (świeża instalacja, aktualizacja z każdej wspieranej poprzedniej wersji, migracja danych, downgrade zablokowany).
- [ ] **VV-24** [ALL][S] Testy beta (TestFlight, ścieżki wewnętrzne/zamknięte Play) używają kont testowych i danych syntetycznych; informacje zwrotne z bety trafiają do raportów problemów.

## D. Testy niefunkcjonalne

- [ ] **VV-30** [ALL][M] **Wydajność**: czas startu, budżet renderowania ekranu, latencja zapytań Firestore, latencja Functions, z limitami zdefiniowanymi w SRS i mierzonymi per wydanie.
- [ ] **VV-31** [ALL][M] **Testy obciążenia i kwot** backendu: równolegli użytkownicy, wybuchy zapisów, skalowanie Functions, hotspoty Firestore, rozsyłanie FCM; udokumentowana pojemność.
- [ ] **VV-32** [ALL][M] **Odporność**: backend niedostępny, częściowe awarie (Auth padł, Firestore działa), wolne sieci, captive portale, tryb samolotowy w trakcie zapisu.
- [ ] **VV-33** [ALL][M] **Bateria i działanie w tle** zmierzone dla funkcji synchronizacji i BLE.
- [ ] **VV-34** [ALL][M] **Testy bezpieczeństwa** wg pliku 06 (SAST, testy reguł, MASVS, pentest) są częścią V&V, nie czymś osobnym.
- [ ] **VV-35** [ALL][M] **Testy dostępności** wg pliku 13 są częścią V&V.
- [ ] **VV-36** [ALL][S] Testy integralności danych: sumy kontrolne przy eksporcie/importie, kompletność śladu audytowego, weryfikacja usunięcia.

## E. Walidacja

- [ ] **VV-40** [ALL][M] **Walidacja oprogramowania** względem potrzeb użytkowników w przewidzianym środowisku: scenariusze skryptowe z reprezentatywnymi użytkownikami (klinicyści, pacjenci), na buildach release-candidate, z kryteriami pass/fail; raport podpisany.
- [ ] **VV-41** [ALL][M] Sumatywna **walidacja użyteczności** (plik 05 §G) zakończona na finalnym UI; zmiany po niej oceniane pod kątem wpływu.
- [ ] **VV-42** [ALL][M] **Walidacja działania klinicznego** wg pliku 12 z finalną wersją algorytmu; każde ponowne trenowanie lub zmiana progu uruchamia ją ponownie.
- [ ] **VV-43** [ALL][M] Instrukcja i materiały szkoleniowe walidowane w ramach scenariuszy (użytkownicy potrafią znaleźć i wykonać krytyczne instrukcje).
- [ ] **VV-44** [ALL][S] Walidacja na każdym rynku/języku docelowym pod kątem różnic treści i przepływu.

## F. Anomalie i decyzja o wydaniu

- [ ] **VV-50** [ALL][M] Wszystkie anomalie znalezione w V&V zapisane, sklasyfikowane pod kątem wpływu na bezpieczeństwo i albo naprawione i przetestowane ponownie, albo udokumentowane jako **znane anomalie resztkowe** z uzasadnieniem wydania (62304 §5.8.2, lista nierozwiązanych anomalii FDA).
- [ ] **VV-51** [ALL][M] Zakres testów regresji dla każdej zmiany zdefiniowany analizą wpływu; pełny zestaw przed każdym wydaniem do sklepu.
- [ ] **VV-52** [ALL][M] Spotkanie decyzyjne o wydaniu z podpisami QA, regulacyjnego, klinicznego i inżynierii zapisane; dokładny hash buildu w zapisie.
- [ ] **VV-53** [ALL][S] Weryfikacja po wydaniu (testy smoke na produkcji, monitoring syntetyczny) zaplanowana i wykonana w ciągu godzin od wydania.

## G. Środowiska i dane testowe

- [ ] **VV-60** [ALL][M] Brak prawdziwych danych pacjentów w środowiskach testowych; generatory danych syntetycznych tworzą realistyczne zbiory bogate w przypadki brzegowe; dostęp do stagingu i tak kontrolowany.
- [ ] **VV-61** [ALL][M] Konfiguracje emulatora i stagingu zgodne z produkcyjnymi regułami, indeksami, Functions i ustawieniami Auth (wdrażane z tego samego stanu repozytorium).
- [ ] **VV-62** [ALL][S] Dane testowe dla urządzeń (nagrania BLE, fixtury HealthKit) zarejestrowane i wersjonowane do odtwarzania.

## H. Dowody potrzebne w tej sekcji

Plan weryfikacji, macierz śledzalności, specyfikacje testów, raporty testów CI i pokrycie, wyniki z macierzy urządzeń, raporty testów niefunkcjonalnych, protokół i raport walidacji, lista anomalii, zapis decyzji o wydaniu.
