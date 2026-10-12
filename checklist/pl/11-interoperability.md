# 11 · Interoperacyjność, standardy i urządzenia podłączone

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Szpitale, płatnicy, platformy krajowe i EHDS oczekują FHIR. Czujniki i urządzenia noszone wnoszą własne standardy. Interoperacyjność jest też wymaganiem regulacyjnym (MDR zał. I §14, przepisy ONC, DiGA, EHDS).

## A. Standardy danych klinicznych

- [ ] **IOP-01** [ALL][M] Model danych klinicznych zmapowany na zasoby **HL7 FHIR R4** (R4B/R5, gdy wymagają partnerzy): Patient, Observation, Condition, MedicationStatement, QuestionnaireResponse, DocumentReference, Device, Provenance; dokument mapowania utrzymywany.
- [ ] **IOP-02** [ALL][M] Używane profile regionalne: **US Core** (ONC/USCDI) dla USA; krajowe profile bazowe w UE (np. HL7 Europe, profile krajowe) oraz **International Patient Summary** dla wymiany transgranicznej; europejski format wymiany EHR z EHDS śledzony.
- [ ] **IOP-03** [ALL][M] Terminologie: **SNOMED CT** (licencja per kraj przez krajowe centrum lub licencję członkowską), **LOINC** dla obserwacji i kwestionariuszy, **ICD-10/ICD-11** dla diagnoz, **UCUM** dla jednostek, **RxNorm** (USA) / **ATC** i krajowe kody leków (UE); wersje kodów zapisane.
- [ ] **IOP-04** [ALL][M] Jednostki i zakresy referencyjne przenoszone z każdą Observation; konwersje testowane względem tabel referencyjnych.
- [ ] **IOP-05** [ALL][M] Data/czas kodowane ISO 8601 z przesunięciem; daty częściowe obsłużone wg reguł FHIR.
- [ ] **IOP-06** [ALL][S] Kwestionariusze modelowane jako FHIR Questionnaire / QuestionnaireResponse z wersjonowaniem, by licencjonowane narzędzia PRO zachowały treść i punktację.
- [ ] **IOP-07** [ALL][S] Zasoby Provenance dla danych z urządzeń i wprowadzonych ręcznie.

## B. Wymiana z EHR i platformami krajowymi

- [ ] **IOP-10** [ALL][M] **SMART on FHIR** (OAuth 2.0 / OpenID Connect) używany do uruchamiania z EHR i API dostępu pacjenta; PKCE; minimalne scope; przechowywanie tokenów wg pliku 07.
- [ ] **IOP-11** [ALL][M] Wybór serwera FHIR udokumentowany (FHIR store Google Cloud Healthcare API, EHR partnera, platforma krajowa); region i BAA/DPA ujęte; rezydencja danych zgodna z plikiem 08.
- [ ] **IOP-12** [ALL][M] Tożsamość pacjenta zostaje u świadczeniodawcy lub w krajowym systemie tożsamości; aplikacja przechowuje pseudonim i referencję, nie kopię rekordu tożsamości, chyba że rola tego wymaga.
- [ ] **IOP-13** [ALL][M] Przychodzące ładunki FHIR walidowane względem profili (schemat, kardynalność, zbiory wartości) przed zapisem do Firestore; nieprawidłowe dane trafiają do kwarantanny, nie są odrzucane po cichu.
- [ ] **IOP-14** [ALL][M] Dane wychodzące mają kontrolę zgody/autoryzacji i zapis audytowy per wymianę (co, do kogo, podstawa prawna).
- [ ] **IOP-15** [ALL][S] Dane masowe (FHIR Bulk Data / `$export`) i subskrypcje obsługiwane z backpressure, retry i idempotentnością.
- [ ] **IOP-16** [ALL][S] Wymagania integracji z platformami krajowymi zebrane per rynek (Polska P1/e-zdrowie, Niemcy TI/ePA/MIO, Francja Mon espace santé/DMP, Holandia MedMij, nordyckie usługi krajowe, USA TEFCA/QHIN) z terminami.
- [ ] **IOP-17** [ALL][S] Interfejsy legacy (HL7 v2, CDA, DICOM dla obrazów) obsługiwane przez gateway, nie w aplikacji Flutter.

## C. Dane zdrowotne platform (HealthKit, Health Connect)

- [ ] **IOP-20** [ALL][M] Typy danych czytane/zapisywane są minimalne i wymienione; pokazane uzasadnienie uprawnień; użytkownik może je odebrać, a aplikacja degraduje się łagodnie.
- [ ] **IOP-21** [ALL][M] Zasady platform przestrzegane: dane HealthKit nie w iCloud, nie do reklam, nie na sprzedaż; dane Health Connect tylko do zadeklarowanych celów zdrowotnych, usuwanie wspierane, odczyt historii ograniczony (domyślnie 30 dni) i uzasadniony, gdy rozszerzony.
- [ ] **IOP-22** [ALL][M] Pochodzenie zapisane (aplikacja/urządzenie źródłowe, ręczne vs automatyczne); algorytmy kliniczne nie traktują danych z konsumenckich urządzeń noszonych jako klasy medycznej, chyba że źródłem jest wyrób dopuszczony i mówi o tym dokumentacja ryzyka.
- [ ] **IOP-23** [ALL][M] Dostarczanie w tle / odczyty pasywne działają poprawnie, gdy OS ogranicza pracę w tle; luki są pokazywane, nie interpolowane.
- [ ] **IOP-24** [ALL][S] Zapis zwrotny do magazynów zdrowotnych platform tylko dla typów danych, których użytkownik oczekuje, z ustawionymi jednostkami i metadanymi.

## D. Bluetooth i podłączone wyroby medyczne

- [ ] **IOP-30** [ALL][M] Urządzenia podłączone wymienione ze statusem regulacyjnym (CE/FDA czy konsumenckie), protokołem komunikacji i testowanymi wersjami firmware; oświadczenie o przewidzianym zastosowaniu wymienia wspierane urządzenia.
- [ ] **IOP-31** [ALL][M] Standardowe profile używane, gdzie dostępne: **profile zdrowotne Bluetooth GATT** (Blood Pressure, Glucose, Pulse Oximeter, Weight Scale, Thermometer, Continuous Glucose Monitoring) oraz nomenklatura **ISO/IEEE 11073** PHD; protokoły własnościowe udokumentowane i licencjonowane.
- [ ] **IOP-32** [ALL][M] Bezpieczeństwo BLE: tryb parowania/bondingu, szyfrowanie i ochrona MITM ocenione; scenariusz podszytego urządzenia w modelu zagrożeń; tożsamość urządzenia weryfikowana przed przyjęciem odczytów.
- [ ] **IOP-33** [ALL][M] Integralność danych od urządzenia do Firestore: CRC/walidacja, wykrywanie duplikatów, uzgadnianie znaczników czasu (zegar urządzenia vs telefonu), jednostki z rekordu urządzenia.
- [ ] **IOP-34** [ALL][M] Tryby awarii testowane: rozłączenie w trakcie transferu, niska bateria, niezgodność firmware, wiele sparowanych telefonów, odebrane uprawnienie Bluetooth w OS.
- [ ] **IOP-35** [ALL][M] Jeśli aplikacja steruje urządzeniem (dawka, stymulacja, ustawienia), ścieżka sterowania jest w najwyższej klasie bezpieczeństwa, z potwierdzeniem, limitami i blokadami bezpieczeństwa niezależnymi od serwera.
- [ ] **IOP-36** [ALL][S] Współpraca z producentem urządzenia: umowy określają, kto jest producentem systemu, kto obsługuje vigilance i aktualizacje firmware.

## E. API, które wystawiasz

- [ ] **IOP-40** [ALL][M] Publiczne lub partnerskie API są udokumentowane (OpenAPI/FHIR CapabilityStatement), wersjonowane, uwierzytelniane (OAuth 2.0 client credentials / SMART backend services), limitowane i audytowane.
- [ ] **IOP-41** [ALL][M] Information blocking (USA) i prawa dostępu z EHDS (UE) uwzględnione przy decydowaniu, co musisz udostępnić pacjentom i świadczeniodawcom i w jakim formacie.
- [ ] **IOP-42** [ALL][S] Wyniki testów zgodności (Inferno dla US Core, Touchstone, krajowe zestawy testowe) przechowywane jako dowód.

## F. Dowody potrzebne w tej sekcji

Dokument mapowania FHIR, licencje i wersje terminologii, raporty walidacji profili, konfiguracja SMART, lista kompatybilnych urządzeń i raporty testów, ocena bezpieczeństwa BLE, dokumentacja API, wyniki testów zgodności.
