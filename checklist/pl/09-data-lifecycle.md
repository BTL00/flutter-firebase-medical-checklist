# 09 · Model danych, minimalizacja, retencja, ślad audytowy

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Kształt danych decyduje o tym, jak trudny będzie każdy późniejszy obowiązek. Pseudonimizuj wcześnie, trzymaj dane identyfikujące poza magazynem klinicznym i zrób z usuwania funkcję pierwszej klasy.

## A. Inwentarz i klasyfikacja danych

- [ ] **DAT-01** [ALL][M] **Inwentarz danych** wymienia każdy zbierany lub pochodny element danych, jego kategorię (identyfikujące, zdrowotne, urządzenie/czujnik, użycie, bezpieczeństwo), źródło, cel, miejsce przechowywania, retencję i podstawę prawną; utrzymywany razem z architekturą.
- [ ] **DAT-02** [ALL][M] Schemat klasyfikacji (np. Publiczne, Wewnętrzne, Osobowe, Zdrowotne/PHI, Sekret) zastosowany do kolekcji Firestore, ścieżek Storage, logów, tabel BigQuery i kopii zapasowych.
- [ ] **DAT-03** [ALL][M] Przegląd minimalizacji per funkcja: każde pole ma udokumentowaną potrzebę; pola „przydadzą się później” nie są zbierane.
- [ ] **DAT-04** [ALL][M] Pola wolnotekstowe, które mogą zawierać dane o zdrowiu, są klasyfikowane jako dane o zdrowiu i tak traktowane (indeksowanie wyszukiwania, logowanie, analityka).
- [ ] **DAT-05** [ALL][S] Dane pochodne (wyniki, wskaźniki ryzyka, wyjścia modeli) inwentaryzowane z pochodzeniem (wersja algorytmu, wejścia, znacznik czasu).

## B. Architektura pseudonimizacji

- [ ] **DAT-10** [ALL][M] Rekordy kliniczne przechowywane pod **pseudonimem**; bezpośrednie identyfikatory (imię i nazwisko, data urodzenia, PESEL, adres, telefon, e-mail) żyją w osobnym magazynie z ostrzejszym dostępem.
- [ ] **DAT-11** [ALL][M] Mapowanie pseudonim–tożsamość (usługa kluczy) działa w osobnym projekcie lub usłudze, z własnym IAM, logowaniem audytowym i regionem; reidentyfikacja jest logowaną, autoryzowaną operacją.
- [ ] **DAT-12** [ALL][M] UID Firebase Auth nie jest używany jako pseudonim kliniczny tam, gdzie eksporty lub badania wymagają niepowiązywalności; dla zbiorów badawczych używany jest drugi pseudonim.
- [ ] **DAT-13** [ALL][M] Daty w rekordach klinicznych trzymane z potrzebną precyzją (data urodzenia → przedział wieku, gdzie możliwe); przesuwanie dat lub uogólnianie rozważone dla eksportów badawczych.
- [ ] **DAT-14** [ALL][S] Identyfikatory urządzeń (IDFV, Android ID, token FCM, MAC BLE) nie są przechowywane obok danych klinicznych bez udokumentowanej potrzeby.

## C. Szyfrowanie

- [ ] **DAT-20** [ALL][M] Szyfrowanie w spoczynku (domyślnie zarządzane przez Google) udokumentowane; decyzja o **CMEK** zapisana; szyfrowanie na poziomie pola lub po stronie klienta dla najbardziej wrażliwych pól (genetyka, notatki psychiatryczne, status HIV, zdrowie seksualne) ocenione i udokumentowane.
- [ ] **DAT-21** [ALL][M] Jeśli używane jest szyfrowanie po stronie klienta: wyprowadzanie i przechowywanie kluczy, polityka utraty/odzyskiwania klucza (dane nieodwracalnie utracone vs depozyt) jawnie wybrana i zakomunikowana użytkownikom.
- [ ] **DAT-22** [ALL][M] Szyfrowanie w tranzycie wszędzie, w tym wywołania Function → strony trzecie; TLS 1.2+ z nowoczesnymi szyframi; wewnętrzny ruch GCP udokumentowany jako szyfrowany przez Google.
- [ ] **DAT-23** [ALL][M] Inwentarz kryptografii i harmonogram rotacji (zob. SEC-21); brak własnej kryptografii.

## D. Integralność i ślad audytowy

- [ ] **DAT-30** [ALL][M] Rekordy kliniczne są **append-only lub wersjonowane**: korekty tworzą nową wersję z powodem, autorem i znacznikiem czasu; historia widoczna dla uprawnionych użytkowników (tego oczekują przepisy o dokumentacji medycznej i część 11).
- [ ] **DAT-31** [ALL][M] **Log audytowy dostępu** personelu do danych o zdrowiu (kto, co, kiedy, skąd, w jakim kontekście) przechowywany tam, gdzie logowani użytkownicy nie mogą go zmienić (osobny projekt lub bucket logów z blokadą retencji); generowany po stronie serwera (Functions, Data Access audit logs), nie tylko po stronie klienta.
- [ ] **DAT-32** [ALL][M] Retencja logu audytowego spełnia najdłuższe obowiązujące wymaganie (HIPAA 6 lat dla dokumentacji; krajowe przepisy o dokumentacji medycznej; własna polityka) i jest podana.
- [ ] **DAT-33** [ALL][M] Historia dostępu dla pacjenta („kto oglądał mój rekord”) dostępna, gdzie wymagana (np. przepisy krajowe, kierunek EHDS), lub przynajmniej możliwa do wygenerowania na żądanie.
- [ ] **DAT-34** [ALL][M] Znaczniki czasu serwera (`FieldValue.serverTimestamp()`) dla zdarzeń klinicznych; znaczniki klienta przechowywane osobno jako „czas zgłoszony”; obsługa przesunięcia zegara zdefiniowana.
- [ ] **DAT-35** [ALL][M] Integralność eksportowanych dokumentów (raporty PDF, paczki FHIR): sumy kontrolne lub podpisy; wersja generującego oprogramowania osadzona.
- [ ] **DAT-36** [ALL][S] Logowanie odporne na manipulację (łańcuch hashy lub Cloud Logging z zablokowaną retencją) dla rekordów używanych jako dokumentacja medyczna o skutkach prawnych.

## E. Synchronizacja offline i rozwiązywanie konfliktów

- [ ] **DAT-40** [ALL][M] Polityka konfliktów per typ danych udokumentowana (last-writer-wins rzadko jest akceptowalne dla danych klinicznych): reguły łączenia, rozstrzyganie przez użytkownika lub autorytet serwera.
- [ ] **DAT-41** [ALL][M] Oczekujące zapisy offline są widoczne dla użytkownika; aplikacja pokazuje, co jeszcze nie dotarło do serwera; dane krytyczne (np. alert do klinicysty) nie są po cichu kolejkowane.
- [ ] **DAT-42** [ALL][M] Błędy synchronizacji (odrzucenie przez reguły, kwota, zmiana schematu) ujawniają się jako błędy ze wskazówkami, nie jako utracone dane; zapisy offline Firestore odrzucone przez reguły są wykrywane i obsługiwane.
- [ ] **DAT-43** [ALL][M] Migracje schematu są wersjonowane; stare wersje aplikacji czytające nowe dane (i odwrotnie) testowane; minimalna wersja aplikacji wymuszana po stronie serwera, gdy wychodzi zmiana łamiąca.
- [ ] **DAT-44** [ALL][S] Idempotentne zapisy z identyfikatorami generowanymi po stronie klienta, by zapobiegać duplikatom po retry.

## F. Retencja i usuwanie

- [ ] **DAT-50** [ALL][M] **Harmonogram retencji** per typ danych z odniesieniem prawnym (przepisy o dokumentacji medycznej per kraj, dokumentacja HIPAA, podatki/umowy, vigilance); najkrótszy okres, który je spełnia; podany w polityce.
- [ ] **DAT-51** [ALL][M] Automatyczne usuwanie (Firestore TTL, zaplanowane Functions, reguły cyklu życia Storage) realizuje harmonogram; kroki ręczne udokumentowane i audytowane.
- [ ] **DAT-52** [ALL][M] **Procedura usuwania** obejmuje: Firestore, Storage, Auth, Realtime DB, BigQuery, Cloud Logging, API usuwania użytkownika Crashlytics/Analytics, system wsparcia, dostawcę e-mail, kopie zapasowe (z maksymalnym czasem rezydualnym), usługę kluczy, podmioty przetwarzające; testowana od początku do końca z dowodami.
- [ ] **DAT-53** [ALL][M] Wyjątki legal hold i obowiązków retencji zaimplementowane (np. świadczeniodawca musi trzymać dokumentację 10 do 20 lat, nawet gdy pacjent prosi o usunięcie) i wyjaśnione użytkownikowi.
- [ ] **DAT-54** [ALL][M] Usunięcie konta z wymagań sklepów (Apple, Google Play) to ten sam przepływ co usunięcie wg RODO, z tą samą kompletnością.
- [ ] **DAT-55** [ALL][S] Certyfikaty lub logi usunięcia można wygenerować dla klienta (szpitala) przy zakończeniu umowy; format zwrotu danych uzgodniony.

## G. Przenoszenie, eksport i interoperacyjność samych danych

- [ ] **DAT-60** [ALL][M] Eksport per użytkownik w strukturalnym, powszechnie używanym formacie (JSON; dla danych klinicznych preferowana paczka FHIR R4) obejmujący wszystkie dane użytkownika, w tym pliki; dostarczany bezpiecznie (uwierzytelnione pobranie, wygasający link).
- [ ] **DAT-61** [ALL][S] Eksport dla klienta (szpitala) na koniec umowy w FHIR lub uzgodnionym CSV/JSON ze słownikiem danych.
- [ ] **DAT-62** [ALL][S] Eksportowane PDF dla pacjentów zawierają identyfikację, datę, jednostki, zakresy referencyjne, wersję oprogramowania i zastrzeżenie zatwierdzone przez dział regulacyjny.

## H. Wtórne wykorzystanie, analityka i badania

- [ ] **DAT-70** [ALL][M] Analityka produktowa używa pseudonimowych, zminimalizowanych danych zdarzeń w osobnym projekcie; brak wartości klinicznych w zdarzeniach; dostęp ograniczony.
- [ ] **DAT-71** [ALL][M] Zbiory do badań lub treningu modeli tworzone udokumentowanym pipeline z deidentyfikacją (HIPAA Safe Harbor lub Expert Determination; test anonimizacji RODO), zapisami zatwierdzeń i rejestrem użycia danych.
- [ ] **DAT-72** [ALL][S] Ocena ryzyka reidentyfikacji dla publikowanych statystyk (małe liczebności, rzadkie choroby, geografia).
- [ ] **DAT-73** [ALL][S] Umowy o udostępnianiu danych z partnerami badawczymi obejmują ograniczenie celu, bezpieczeństwo, dalsze przekazywanie i usuwanie.

## I. Jakość danych

- [ ] **DAT-80** [ALL][M] Reguły walidacji danych klinicznych przy wprowadzaniu i ingestii (zakresy, jednostki, pola wymagane, integralność referencyjna) zaimplementowane po stronie serwera, nie tylko w UI.
- [ ] **DAT-81** [ALL][M] Dane z urządzeń (BLE, HealthKit, Health Connect) niosą pochodzenie: model urządzenia, firmware, aplikacja źródłowa, ręczne vs zmierzone; logika dalej traktuje wpisy ręczne inaczej, gdy klinicznie istotne.
- [ ] **DAT-82** [ALL][S] Monitorowanie jakości danych (brakujące pola, niewiarygodne wartości, duplikaty) z alertami i okresowym przeglądem.

## J. Dowody potrzebne w tej sekcji

Inwentarz danych, polityka klasyfikacji, projekt pseudonimizacji, decyzje o szyfrowaniu, projekt logu audytowego i próbki, specyfikacja rozwiązywania konfliktów, harmonogram retencji, procedura usuwania z dowodami testów, próbki eksportów, procedura deidentyfikacji.
