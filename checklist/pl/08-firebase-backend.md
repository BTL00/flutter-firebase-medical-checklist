# 08 · Backend Firebase i Google Cloud

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Firebase umożliwia bezpieczny backend, ale nie daje go automatycznie. Domyślne ustawienia (otwarte reguły w trybie testowym, domyślne konta serwisowe z rolą Editor, multi-region w USA, włączona analityka) są złe dla aplikacji medycznej. Sprawdź każdą używaną usługę według tej listy i usuń te, których nie używasz.

## A. Projekt i organizacja

- [ ] **FB-01** [ALL][M] Produkcyjny projekt Firebase żyje w **organizacji Google Cloud** należącej do producenta w rozumieniu prawa, z kontami Cloud Identity / Workspace; brak właścicieli na prywatnym Gmailu.
- [ ] **FB-02** [ALL][M] Osobne projekty dla dev, staging, produkcji (i per najemca, gdy szpitale wymagają izolacji); brak danych produkcyjnych w projektach nieprodukcyjnych.
- [ ] **FB-03** [ALL][M] **Weryfikacja dwuetapowa wymuszona** dla wszystkich kont Google z dostępem do projektu; klucze sprzętowe dla właścicieli.
- [ ] **FB-04** [ALL][M] IAM wg najmniejszych uprawnień: nikt nie pracuje codziennie jako Owner; unikanie Editor; role predefiniowane lub własne; dostęp przeglądany kwartalnie z zapisami.
- [ ] **FB-05** [ALL][M] Brak **kluczy kont serwisowych** zarządzanych przez użytkownika (JSON), chyba że uzasadnione; polityka organizacji `iam.disableServiceAccountKeyCreation` włączona; workload identity dla CI.
- [ ] **FB-06** [ALL][M] **Cloud Audit Logs**: Admin Activity włączone (domyślnie) i **Data Access logs włączone** dla Firestore, Cloud Storage, Secret Manager, Identity Platform; eksportowane do zablokowanego bucketa logów z retencją zgodną z polityką.
- [ ] **FB-07** [ALL][M] Alerty rozliczeniowe i kwoty ustawione; atak typu denial-of-wallet nie może po cichu zatrzymać usługi ani opróżnić konta.
- [ ] **FB-08** [ALL][M] **Data Processing and Security Terms** Google Cloud zaakceptowane; dla PHI z USA **Cloud BAA** zawarta dla organizacji/projektu; lista używanych usług Firebase sprawdzona względem HIPAA included functionality.
- [ ] **FB-09** [ALL][M] Konfiguracja projektu Firebase (reguły, indeksy, Functions, Auth, App Check, Hosting, Remote Config) jest w repozytorium i wdrażana z CI; dryf w konsoli wywołuje alert.
- [ ] **FB-10** [ALL][S] Polityki organizacji: udostępnianie ograniczone do domeny, ograniczenie publicznych IP, wyłączenie domyślnej sieci, jednolity dostęp na poziomie bucketa, wymaganie OS Login, gdzie istnieją VM.
- [ ] **FB-11** [ALL][S] Security Command Center (co najmniej tier standard) włączone; ustalenia triażowane w systemie raportów problemów.

## B. Lokalizacja i rezydencja danych

- [ ] **FB-20** [ALL][M] **Lokalizacja Firestore** wybrana świadomie (regional vs multi-region, UE vs USA) przed utworzeniem bazy; później nie da się jej zmienić. Pacjenci z UE → lokalizacja UE (np. `europe-west3`, `eur3`); PHI z USA → lokalizacja USA, jeśli klient tego wymaga.
- [ ] **FB-21** [ALL][M] Buckety Cloud Storage, regiony Cloud Functions, instancje Realtime Database (jeśli są), zbiory BigQuery i polityka replikacji Secret Manager zgodne z polityką regionu Firestore.
- [ ] **FB-22** [ALL][M] Usługi, których lokalizacji danych nie kontrolujesz (rekordy użytkowników Firebase Authentication, Crashlytics, Analytics, FCM) wymienione z rzeczywistą lokalizacją przechowywania i ujęte w dokumentacji prywatności.
- [ ] **FB-23** [ALL][S] Wdrożenia wielonajemne (UE + USA) używają osobnych projektów per region zamiast mieszania rezydencji w jednej bazie.
- [ ] **FB-24** [ALL][S] **CMEK** (klucze szyfrowania zarządzane przez klienta) ocenione dla Firestore, Storage i BigQuery tam, gdzie klienci lub programy krajowe wymagają kontroli kluczy; rotacja kluczy i logowanie dostępu skonfigurowane.

## C. Reguły bezpieczeństwa Firestore

- [ ] **FB-30** [ALL][M] Domyślnie deny: brak `allow read, write: if true`; brak reguły przyznającej dostęp do danych o zdrowiu na podstawie samego `request.auth != null`.
- [ ] **FB-31** [ALL][M] Kontrole własności porównują pola dokumentu z `request.auth.uid` lub zweryfikowanymi **custom claims**, nigdy z wartościami przesłanymi w treści żądania.
- [ ] **FB-32** [ALL][M] Dostęp oparty na rolach przez custom claims ustawiane po stronie serwera; klinicyści ograniczeni do przypisanych pacjentów przez dokumenty członkostwa lub claims, z zabudżetowanymi odczytami `get()`/`exists()`.
- [ ] **FB-33** [ALL][M] **Walidacja schematu w regułach**: pola wymagane, typy, enumy, limity rozmiaru, `hasOnly()` blokujące dodatkowe pola, niezmienność pól audytowych (`createdAt`, `createdBy`, `patientId`).
- [ ] **FB-34** [ALL][M] Zapisy zmieniające stan kliniczny przechodzą przez Cloud Functions, gdy walidacja wymaga logiki serwerowej; reguły zabraniają wtedy bezpośrednich zapisów klienta do tych pól.
- [ ] **FB-35** [ALL][M] Zapytania listujące ograniczone (`request.query.limit`), a reguły testowane z semantyką na poziomie zapytania (reguły nie są filtrami).
- [ ] **FB-36** [ALL][M] Testy jednostkowe reguł w Emulator Suite obejmują każdą kolekcję × rolę × operację, w tym przypadki negatywne; uruchamiane w CI; brak wdrożenia bez ich przejścia.
- [ ] **FB-37** [ALL][M] Reguły wersjonowane, przeglądane jak kod i wdrażane z CI; edytor w konsoli nie jest używany dla produkcji.
- [ ] **FB-38** [ALL][M] Brak PHI w **identyfikatorach dokumentów**, ścieżkach kolekcji lub nazwach pól (pojawiają się w logach i URL); identyfikatory losowe (`doc().id`, UUID), nie PESEL ani e-maile.
- [ ] **FB-39** [ALL][S] Osobne kolekcje lub bazy dla spseudonimizowanych danych klinicznych i dla danych identyfikujących; mapowanie dostępne tylko dla dedykowanej usługi.
- [ ] **FB-40** [ALL][S] Reguły mają udokumentowany budżet wydajności (odczyty na ewaluację reguły) i są testowane obciążeniowo.

## D. Cloud Storage for Firebase

- [ ] **FB-50** [ALL][M] Reguły Storage odzwierciedlają model Firestore: własność oparta na ścieżce, walidacja typu i rozmiaru, brak publicznych bucketów, brak długożyciowych podpisanych URL dla PHI.
- [ ] **FB-51** [ALL][M] Jednolity dostęp na poziomie bucketa włączony; wersjonowanie obiektów lub soft delete skonfigurowane wg polityki retencji; reguły cyklu życia usuwają zgodnie z harmonogramem.
- [ ] **FB-52** [ALL][M] Wysyłane pliki (obrazy, PDF, EKG) skanowane/walidowane po stronie serwera; EXIF i osadzone metadane usuwane, gdy niosą lokalizację lub tożsamość.
- [ ] **FB-53** [ALL][S] Tokeny pobierania (`firebaseStorageDownloadTokens`) unieważniane przy zmianie dostępu; preferowane krótkożyciowe podpisane URL generowane przez Functions dla plików wrażliwych.

## E. Cloud Functions / Cloud Run

- [ ] **FB-60** [ALL][M] Każda funkcja ma **własne konto serwisowe** z najmniejszymi uprawnieniami; domyślne konto App Engine / Compute nie jest używane.
- [ ] **FB-61** [ALL][M] Funkcje callable weryfikują `context.auth` i claims; funkcje HTTP wymagające prywatności nie są wywoływalne przez `allUsers`; `enforceAppCheck: true`, gdzie ma zastosowanie.
- [ ] **FB-62** [ALL][M] Sekrety przez Secret Manager (`defineSecret`), nigdy w zmiennych środowiskowych w repozytorium; plan rotacji.
- [ ] **FB-63** [ALL][M] Walidacja wejścia biblioteką schematów (zod/Joi/pydantic) w każdej funkcji; błędy nigdy nie ujawniają stack trace ani PHI.
- [ ] **FB-64** [ALL][M] Idempotentność triggerów (triggery Firestore/Auth/FCM mogą odpalić więcej niż raz); retry skonfigurowane świadomie.
- [ ] **FB-65** [ALL][M] Timeouty, pamięć, współbieżność i `maxInstances` ustawione; min instances dla funkcji krytycznych latencyjnie ocenione względem przepływu klinicznego.
- [ ] **FB-66** [ALL][M] Logowanie strukturalne z redakcją PHI; pola logów na liście dozwolonych; sinki logów wykluczają treści żądań.
- [ ] **FB-67** [ALL][M] Wersje runtime wspierane i łatane (Node LTS / wspierany Python); skanowanie zależności dla Functions.
- [ ] **FB-68** [ALL][M] Rate limiting / ochrona przed nadużyciami na publicznych endpointach (App Check, kwoty per użytkownik, Cloud Armor dla Cloud Run, jeśli wystawione).
- [ ] **FB-69** [ALL][S] Regiony Functions zgodne z rezydencją danych; egress do API stron trzecich udokumentowany z danymi, które każde otrzymuje.
- [ ] **FB-70** [ALL][S] Wdrożenie blue/green lub podział ruchu dla usług Cloud Run; cofnięcie przetestowane.

## F. Firebase Authentication / Identity Platform

- [ ] **FB-80** [ALL][M] Włączone tylko zamierzone metody logowania; anonimowe uwierzytelnianie wyłączone, chyba że zaprojektowane i objęte regułami.
- [ ] **FB-81** [ALL][M] **Ochrona przed enumeracją e-maili** włączona; polityka haseł wymuszana (długość, kontrola listy wycieków przez blocking function, jeśli potrzebna).
- [ ] **FB-82** [ALL][M] **MFA** dla klinicystów i administratorów (upgrade do Identity Platform dla MFA SMS/TOTP); wymuszane przez blocking functions lub claims, nie jako opcjonalne UI.
- [ ] **FB-83** [ALL][M] Polityka sesji: stały czas życia ID tokena (1 h) zaakceptowany; **unieważnianie refresh tokenów** przy zmianie hasła, zmianie roli, utracie urządzenia, odejściu; `revokeRefreshTokens` podpięte do narzędzi administracyjnych; reguły lub Functions sprawdzają `auth_time` dla działań wrażliwych.
- [ ] **FB-84** [ALL][M] Custom claims ustawiane tylko przez zaufany kod serwerowy z własną kontrolą autoryzacji; limity rozmiaru claims respektowane; zmiany ról propagowane (wymuszenie odświeżenia tokena).
- [ ] **FB-85** [ALL][M] Przepływ usunięcia konta usuwa użytkownika Auth i wyzwala usunięcie danych (rozszerzenie Delete User Data lub własna funkcja), z okresem karencji, gdy prawo wymaga retencji.
- [ ] **FB-86** [ALL][M] E-maile Auth (weryfikacja, reset) używają własnej domeny i przejrzanych szablonów; linki akcji mają odpowiedni czas ważności; reset nie ujawnia istnienia konta.
- [ ] **FB-87** [ALL][S] SSO dla personelu szpitalnego (SAML/OIDC przez Identity Platform) z izolacją najemców; projekt wielonajemności udokumentowany.
- [ ] **FB-88** [ALL][S] Blocking functions (`beforeCreate`, `beforeSignIn`) wymuszają listy dozwolonych domen, polityki urządzeń i stan MFA.
- [ ] **FB-89** [ALL][S] Lokalizacja danych Auth (USA) uwzględniona w dokumentacji prywatności; minimalne dane profilowe w Auth (brak danych o zdrowiu w `displayName` czy `photoURL`).

## G. App Check

- [ ] **FB-90** [ALL][M] App Check włączony z Play Integrity (Android), App Attest z fallbackiem DeviceCheck (iOS), reCAPTCHA Enterprise (web); **wymuszanie włączone** dla Firestore, Storage, Functions, Auth (jeśli wspierane) po potwierdzeniu w monitoringu, że prawdziwi klienci przechodzą.
- [ ] **FB-91** [ALL][M] Tokeny dostawcy debug istnieją tylko w buildach debug i CI; nie w repozytorium; rotowane.
- [ ] **FB-92** [ALL][S] Ochrona przed replay (tokeny jednorazowe) dla wrażliwych funkcji callable.
- [ ] **FB-93** [ALL][S] App Check traktowany jako obrona w głąb, nie jako uwierzytelnianie; dokumentacja ryzyka nie opiera się na nim samym.

## H. Analytics, Crashlytics, Performance, Remote Config, Messaging

- [ ] **FB-100** [ALL][M] Decyzja per produkt: używany lub usunięty. Nieużywane SDK Firebase nie są linkowane (zbierają dane, gdy są obecne).
- [ ] **FB-101** [ALL][M] **Automatyczne zbieranie** Analytics, Crashlytics i Performance wyłączone w czasie budowania i włączane dopiero po zgodzie (UE) i tylko gdy żadne PHI nie może do nich dotrzeć (zakres BAA w USA).
- [ ] **FB-102** [ALL][M] Nazwy zdarzeń, parametry, właściwości użytkownika, klucze niestandardowe i komunikaty logów na liście dozwolonych i przejrzane pod kątem PHI; identyfikatory użytkowników wysyłane do analityki są pseudonimowe i rotowane na żądanie.
- [ ] **FB-103** [ALL][M] Crashlytics: brak PHI w logach/kluczach niestandardowych; breadcrumbs przejrzane; wysyłka symboli tylko z CI.
- [ ] **FB-104** [ALL][M] FCM: ładunki data-only lub ogólne powiadomienia; aplikacja pobiera treść po uwierzytelnieniu; tematy nie ujawniają schorzeń (brak tematu `diabetes_patients`).
- [ ] **FB-105** [ALL][M] Remote Config nie może zmieniać progów klinicznych, algorytmów ani funkcji bezpieczeństwa; zmiany szablonów wersjonowane i przeglądane; wartości domyślne bezpieczne.
- [ ] **FB-106** [ALL][S] Eksport Analytics/Crashlytics do BigQuery wyłączony lub ograniczony do danych bez PHI we właściwym regionie z retencją.
- [ ] **FB-107** [ALL][S] Dynamic Links nie są używane (usługa wyłączona w 2025); deep linki używają App Links/Universal Links.

## I. Firebase Hosting (aplikacja web, strony prywatności, eIFU)

- [ ] **FB-110** [ALL][M] Nagłówki bezpieczeństwa skonfigurowane w `firebase.json`; HSTS preload rozważony; brak mixed content.
- [ ] **FB-111** [ALL][M] eIFU i polityki prywatności hostowane z historią wersji i monitorowaniem dostępności (uptime check), jak wymaga rozp. 2021/2226.
- [ ] **FB-112** [ALL][S] Kanały preview nieindeksowane i bez prawdziwych danych; dostęp ograniczony.

## J. Rozszerzenia, Realtime Database, inne usługi

- [ ] **FB-120** [ALL][M] Każde rozszerzenie Firebase traktowane jako SOUP: wersja przypięta, uprawnienia przejrzane, przepływy danych udokumentowane.
- [ ] **FB-121** [ALL][M] Realtime Database (jeśli używana) ma testy reguł i region zgodny z rezydencją; dla nowych danych klinicznych preferowany Firestore.
- [ ] **FB-122** [ALL][S] Vertex AI in Firebase / Gemini API: warunki przetwarzania danych, region, logowanie promptów i rezygnacja z treningu potwierdzone; PHI wysyłane tylko pod BAA/DPA; zob. plik 17.
- [ ] **FB-123** [ALL][S] Firebase App Distribution dla testerów używa tylko pseudonimowych danych testowych.

## K. Kopie zapasowe, odtwarzanie i mechanika usuwania

- [ ] **FB-130** [ALL][M] **Point-in-time recovery** Firestore włączone (7 dni) i **zaplanowane kopie zapasowe** z retencją zgodną z polityką; odtwarzanie testowane kwartalnie do projektu nieprodukcyjnego.
- [ ] **FB-131** [ALL][M] Buckety Storage: wersjonowanie/soft delete i kopia międzyregionalna, gdy wymaga RTO; odtwarzanie testowane.
- [ ] **FB-132** [ALL][M] Zadania usuwania (polityki TTL, zaplanowane funkcje) realizują retencję per typ danych; kopie zapasowe wygasają w podanym maksimum; procedura usuwania uczciwie opisuje kopie w polityce prywatności.
- [ ] **FB-133** [ALL][M] Dostęp do kopii zapasowych bardziej ograniczony niż do produkcji i logowany.
- [ ] **FB-134** [ALL][S] Eksport do przenoszenia (JSON/paczka FHIR per użytkownik) zaimplementowany jako Function z logowaniem audytowym.

## L. Dowody potrzebne w tej sekcji

Eksport IAM i zapisy przeglądów, lista polityk organizacji, konfiguracja logów audytowych, rejestr lokalizacji danych, reguły + testy + logi CI, inwentarz Functions z kontami serwisowymi, eksport konfiguracji Auth, metryki App Check, tabela decyzji o SDK/produktach, zapisy ćwiczeń kopii i odtwarzania. → szablon: `templates/firebase-service-inventory.md`
