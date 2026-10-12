# 07 · Klient Flutter (iOS, Android, web)

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Urządzenie to teren wroga: wspólne telefony, urządzenia z rootem, zrzuty ekranu, powiadomienia na ekranie blokady, stare wersje OS. Każdy punkt tutaj da się sprawdzić w repozytorium albo na urządzeniu testowym.

## A. Build, toolchain i odtwarzalność

- [ ] **FL-01** [ALL][M] Wersja Flutter SDK przypięta (FVM `.fvmrc` lub równoważnie) i identyczna w CI, na maszynach programistów i w zapisie wydania; ograniczenie Dart SDK przypięte w `pubspec.yaml`.
- [ ] **FL-02** [ALL][M] `pubspec.lock`, `Podfile.lock` i lockfile Gradle w repozytorium; CI używa `flutter pub get --enforce-lockfile`.
- [ ] **FL-03** [ALL][M] Buildy release używają `--obfuscate --split-debug-info=<dir>`; pliki symboli archiwizowane per build do symbolizacji awarii i nigdy nie dostarczane.
- [ ] **FL-04** [ALL][M] Buildy release pozbawione logowania debugowego: strażniki `kReleaseMode`, diagnostyka tylko w `assert`, poziom loggera ustawiany w czasie budowania, brak `print` treści żądań/odpowiedzi.
- [ ] **FL-05** [ALL][M] Flavory / dart-define per środowisko (dev, staging, prod) wybierają projekt Firebase; konfiguracji produkcyjnej nie da się wybrać w buildzie debug.
- [ ] **FL-06** [ALL][M] Nazwa wersji i numer buildu generowane przez CI z zapisu wydania; ekran „O aplikacji” pokazuje wersję, build, UDI i informacje regulacyjne.
- [ ] **FL-07** [ALL][M] Buildy odtwarzalne z otagowanego commitu wyłącznie w CI; brak buildów release z maszyn programistów.
- [ ] **FL-08** [ALL][S] Android: R8/ProGuard włączone z przejrzanymi regułami keep; `shrinkResources`; brak flag `debuggable` lub `testOnly` w manifestach release.
- [ ] **FL-09** [ALL][S] `flutter analyze` z ostrymi regułami (`strict-casts`, `strict-inference`, `strict-raw-types`) i zero ostrzeżeń jako bramka CI; kontrola `dart format`.

## B. Sekrety i konfiguracja

- [ ] **FL-10** [ALL][M] Brak sekretów w paczce aplikacji. Konfiguracja Firebase (klucz API, ID projektu) nie jest sekretem, ale **klucze API są ograniczone** w Google Cloud Console do dokładnych bundle ID iOS, pakietu Android + SHA-256 i referrerów web, oraz do API Firebase.
- [ ] **FL-11** [ALL][M] Klucze API stron trzecich (mapy, LLM, SMS) nigdy nie są w kliencie; wywołania idą przez Cloud Functions.
- [ ] **FL-12** [ALL][M] `google-services.json` / `GoogleService-Info.plist` per flavor; pliki produkcyjne nie są w repozytorium, jeśli jest publiczne lub współdzielone z kontraktorami (albo zaakceptowane jako niesekretne przy ograniczeniach kluczy, udokumentowane).
- [ ] **FL-13** [ALL][M] Remote Config i flagi funkcji nie mogą wyłączyć kontroli bezpieczeństwa ani zmienić algorytmu klinicznego; lista tego, co flagi mogą zmieniać, jest w dokumencie architektury.

## C. Ochrona danych lokalnych

- [ ] **FL-20** [ALL][M] Wartości wrażliwe (tokeny, klucze urządzenia, identyfikatory z cache) przechowywane w bezpiecznym magazynie platformy (Keychain z `kSecAttrAccessibleWhenUnlockedThisDeviceOnly` lub podobnym; magazyn oparty na Android Keystore), nigdy w `SharedPreferences`, zwykłych plikach ani `Hive`/`sqflite` bez szyfrowania.
- [ ] **FL-21** [ALL][M] Lokalna baza danych (sqflite/Drift/Isar/Hive/ObjectBox) jest szyfrowana (SQLCipher lub szyfrowanie natywne biblioteki) z kluczem w Keystore/Keychain; uzasadnienie, jeśli nie ma w ogóle lokalnego cache PHI (preferowane).
- [ ] **FL-22** [ALL][M] Trwałość offline Firestore: decyzja o włączeniu zapisana; jeśli włączona, rozmiar cache ograniczony, czyszczony przy wylogowaniu, a zależność od szyfrowania na poziomie urządzenia (szyfrowanie dysku OS) opisana w instrukcji.
- [ ] **FL-23** [ALL][M] Android `android:allowBackup="false"` i `fullBackupContent`/`dataExtractionRules` wykluczają dane aplikacji; pliki iOS oznaczone `NSFileProtectionComplete` i wykluczone z kopii iCloud, gdy zawierają dane o zdrowiu.
- [ ] **FL-24** [ALL][M] Wylogowanie i usunięcie konta czyszczą lokalne cache, bezpieczny magazyn, cache obrazów (`cached_network_image`), katalogi tymczasowe i trwałość Firestore.
- [ ] **FL-25** [ALL][M] Schowek: kopiowanie wartości zdrowotnych jest celowe (jawny przycisk), schowek czyszczony po czasie, gdzie platforma pozwala; brak danych wrażliwych w schowku domyślnie.
- [ ] **FL-26** [ALL][S] Zrzuty ekranu i nagrywanie ekranów z PHI zablokowane lub rozmyte (`FLAG_SECURE` na Androidzie; widok zasłaniający w przełączniku aplikacji iOS; `secure` treść w webie, gdzie wykonalne).
- [ ] **FL-27** [ALL][S] Klawiatura: `enableSuggestions: false`, `autocorrect: false` i niespersonalizowana klawiatura dla pól wrażliwych, by klawiatury stron trzecich nie uczyły się treści.

## D. Sesja, blokada i UX uwierzytelniania

- [ ] **FL-30** [ALL][M] Blokada aplikacji po bezczynności (konfigurowalny timeout, domyślnie krótki dla aplikacji klinicystów) z ponownym uwierzytelnieniem biometrycznym lub PIN (`local_auth`), wspartym kontrolą sesji po stronie serwera, nie tylko bramką UI.
- [ ] **FL-31** [ALL][M] Zdefiniowane ścieżki awaryjne i błędów biometrii; zmiana zarejestrowanej biometrii unieważnia klucz (`setInvalidatedByBiometricEnrollment` / `biometryCurrentSet`).
- [ ] **FL-32** [ALL][M] Przejścia tło/pierwszy plan ukrywają PHI (ekran prywatności) i ponownie sprawdzają ważność sesji.
- [ ] **FL-33** [ALL][M] Wiele kont na jednym urządzeniu obsłużone jawnie (urządzenia rodzinne): dane poprzedniego użytkownika nigdy nie są widoczne dla następnego.
- [ ] **FL-34** [ALL][S] Deep linki i tapnięcia powiadomień otwierające PHI wymagają najpierw uwierzytelnienia; zamierzona trasa zachowana po zalogowaniu.

## E. Bezpieczeństwo sieci

- [ ] **FL-40** [ALL][M] Tylko TLS: iOS App Transport Security bez wyjątków; Android `usesCleartextTraffic="false"` i Network Security Config; build webowy wymusza HTTPS i HSTS.
- [ ] **FL-41** [ALL][S] Pinning certyfikatu lub klucza publicznego dla własnych backendów (własna domena Cloud Functions, serwer FHIR) z planem rotacji; pinning endpointów Firebase/Google nie jest zalecany, więc udokumentuj kontrole kompensujące (App Check, TLS, magazyn zaufania platformy).
- [ ] **FL-42** [ALL][M] Wszystkie własne wywołania HTTP przechodzą przez jednego klienta z timeoutami, polityką retry, mapowaniem błędów i bez logowania treści; brak `badCertificateCallback` zwracającego `true`.
- [ ] **FL-43** [ALL][M] WebView tylko gdy potrzebne; JavaScript wyłączony, chyba że wymagany, dostęp do plików wyłączony, lista dozwolonych URL, brak PHI w URL, linki zewnętrzne otwierane w przeglądarce systemowej.
- [ ] **FL-44** [ALL][M] Weryfikacja deep linków: Android App Links z `assetlinks.json`, iOS Universal Links z `apple-app-site-association`; własne schematy URL nieużywane do niczego istotnego dla bezpieczeństwa; wszystkie parametry walidowane.

## F. Integralność urządzenia i platforma

- [ ] **FL-50** [ALL][M] Wykrywanie roota/jailbreaka, debuggera, hooków i emulatora (np. freeRASP lub równoważne) ze zdefiniowaną reakcją zgodną z analizą ryzyka (ostrzeż, ogranicz, zablokuj); reakcja przetestowana i opisana w instrukcji.
- [ ] **FL-51** [ALL][M] Minimalne wersje OS ustalone z macierzy wsparcia bezpieczeństwa; niższe urządzenia blokowane z czytelnym komunikatem; polityka przeglądana co roku.
- [ ] **FL-52** [ALL][M] Uprawnienia minimalne i żądane w momencie potrzeby z ekranami uzasadnienia; teksty użycia w `Info.plist` i lista `<uses-permission>` Androida przejrzane względem deklaracji bezpieczeństwa danych.
- [ ] **FL-53** [ALL][M] Powiadomienia: ładunki bez PHI; treść podglądu na ekranie blokady ogólna; kanały/kategorie pozwalają użytkownikom nimi sterować; krytyczne alerty (iOS) lub kanały wysokiego priorytetu uzasadnione w dokumentacji ryzyka.
- [ ] **FL-54** [ALL][M] Działanie w tle (synchronizacja, BLE, przypomnienia) obsługuje zabicie przez OS, Doze, optymalizację baterii i wyłączone odświeżanie w tle; użytkownik jest informowany, gdy działanie w tle jest ograniczone.
- [ ] **FL-55** [ALL][M] Obsługa czasu: wszystkie znaczniki czasu przechowywane w UTC z przesunięciem strefy, gdy klinicznie istotne, wyświetlane w strefie urządzenia, testowane przy zmianie czasu i podróżach; dryf zegara urządzenia wykrywany względem czasu serwera dla funkcji dawkowania/harmonogramu.
- [ ] **FL-56** [ALL][S] Problemy specyficzne dla urządzeń z macierzy wsparcia testowane: ekrany z wycięciem, składane, tablety, podzielony ekran, skalowanie czcionki do 200 %, tryb ciemny, zabijanie przy małej pamięci.

## G. Poprawność obsługi danych klinicznych w UI

- [ ] **FL-60** [ALL][M] Wejścia liczbowe używają typów bezpiecznych dziesiętnie (pakiet `decimal` lub całkowite jednostki podrzędne), nigdy `double` dla dawek, mas czy wyników laboratoryjnych z progami klinicznymi; parsowanie respektuje separatory dziesiętne locale.
- [ ] **FL-61** [ALL][M] Jednostki wyświetlane przy każdej wartości, wybieralne przez użytkownika, gdy to właściwe (mg/dL vs mmol/L, kg vs lb), przechowywane kanonicznie (UCUM) z konwersją przetestowaną względem wartości referencyjnych.
- [ ] **FL-62** [ALL][M] Kontrola zakresów i limity wiarygodności wejść, z potwierdzeniem dla wartości poza zakresem i twardymi limitami dla niemożliwych; limity przejrzane przez klinicystę.
- [ ] **FL-63** [ALL][M] Nieaktualne lub offline dane są widocznie oznaczone (znacznik czasu, „ostatnia synchronizacja”); nigdy nie pokazywane z tą samą wagą wizualną co świeże.
- [ ] **FL-64** [ALL][M] Tożsamość pacjenta pokazana na każdym ekranie klinicznym (nazwa/pseudonim + drugi identyfikator), by zapobiegać błędom niewłaściwego pacjenta; zmiana pacjenta wymaga celowego działania.
- [ ] **FL-65** [ALL][M] Działania destrukcyjne lub klinicznie istotne (usuń rekord, potwierdź dawkę, wyślij do klinicysty) wymagają potwierdzenia i są odwracalne lub logowane.
- [ ] **FL-66** [ALL][M] Zasady zaokrąglania, obcinania i precyzji wyświetlania udokumentowane i przetestowane względem specyfikacji algorytmu.
- [ ] **FL-67** [ALL][M] Stany błędów są jawne: brak cichych wartości domyślnych; nieudane wczytanie pokazuje błąd, nie zero.
- [ ] **FL-68** [ALL][S] Wykresy mają osie, jednostki, legendy i dostępne alternatywy (tabela lub podsumowanie) i nigdy nie interpolują przez luki bez oznaczenia.

## H. Jakość kodu i architektura

- [ ] **FL-70** [ALL][M] Architektura warstwowa (prezentacja / domena / dane) z logiką kliniczną w czystych pakietach Dart, testowalnych jednostkowo bez Fluttera i Firebase.
- [ ] **FL-71** [ALL][M] Zarządzanie stanem deterministyczne i testowalne; efekty uboczne odizolowane; brak logiki biznesowej w widżetach.
- [ ] **FL-72** [ALL][M] Strategia obsługi błędów: typowane błędy, globalny handler (`FlutterError.onError`, `PlatformDispatcher.onError`) raportujący bez PHI, komunikaty dla użytkownika przejrzane.
- [ ] **FL-73** [ALL][M] Kanały platformowe / FFI przejrzane pod kątem walidacji wejścia i bezpieczeństwa pamięci; kod natywny jest w SBOM.
- [ ] **FL-74** [ALL][S] Liczba zależności zminimalizowana; każdy pakiet w `pubspec.yaml` ma właściciela i uzasadnienie w rejestrze SOUP.
- [ ] **FL-75** [ALL][S] Lista kontrolna przeglądu kodu obejmuje bezpieczeństwo, dostępność, lokalizację i śledzalność 62304 (ID wymagania w PR).

## I. Specyfika Flutter web (jeśli dostarczany)

- [ ] **FL-80** [ALL][M] Nagłówki Content Security Policy, HSTS, `X-Content-Type-Options`, `Referrer-Policy`, `Permissions-Policy` skonfigurowane na Firebase Hosting; zasoby CanvasKit/WASM serwowane z własnego origin lub z dozwolonego CDN.
- [ ] **FL-81** [ALL][M] Trwałość Firebase Auth ustawiona odpowiednio dla współdzielonych stacji klinicznych (sesyjna, nie lokalna) i wylogowanie po bezczynności wdrożone.
- [ ] **FL-82** [ALL][M] Semantyka włączona i przetestowana z czytnikami ekranu w przeglądarce; nawigacja klawiaturą działa dla wszystkich przepływów.
- [ ] **FL-83** [ALL][S] Macierz wspieranych przeglądarek i zachowanie auto-aktualizacji udokumentowane; cache service workera wyklucza odpowiedzi z PHI.

## J. Dowody potrzebne w tej sekcji

Konfiguracja buildu i logi CI, archiwum symboli obfuskacji, notatka projektowa bezpiecznego magazynu, raport testów MASVS, wyniki testów na macierzy urządzeń, mapowanie uprawnień do bezpieczeństwa danych, przypadki testowe bezpieczeństwa klinicznego UI, zapisy przeglądów kodu.
