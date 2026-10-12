# 03 · Prywatność: RODO i ePrivacy (UE/EOG)

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Dane o zdrowiu są szczególną kategorią wg art. 9. Aplikacja na Firebase dotyka Google jako podmiotu przetwarzającego, transferów do USA i identyfikatorów urządzeń, więc ta sekcja jest celowo długa.

## A. Role i podstawa prawna

- [ ] **GDPR-01** [EU][M] Rola administratora / współadministratora / podmiotu przetwarzającego ustalona dla każdego przepływu danych: dostawca aplikacji vs szpital vs praktyka lekarska. Pisemne uzgodnienia współadministratorów (art. 26), gdy dotyczy.
- [ ] **GDPR-02** [EU][M] Podstawa prawna z **art. 6** i przesłanka z **art. 9 ust. 2** zapisane dla każdego celu (wyraźna zgoda 9(2)(a); udzielanie opieki zdrowotnej pod tajemnicą zawodową 9(2)(h); zdrowie publiczne 9(2)(i); badania naukowe 9(2)(j)). Zgoda nie jest domyślną podstawą dla opieki świadczonej przez podmiot leczniczy.
- [ ] **GDPR-03** [EU][M] Zgoda (gdy stosowana) jest granularna, oddzielona od regulaminu, odwoływalna w aplikacji jednym krokiem i logowana ze znacznikiem czasu, wersją komunikatu i dokładną pokazaną treścią.
- [ ] **GDPR-04** [EU][M] Dzieci: weryfikacja wieku i zasady zgody rodzicielskiej wg państw członkowskich (art. 8, 13 do 16 lat); aplikacje pediatryczne mają udokumentowane podejście.
- [ ] **GDPR-05** [EU][M] Wtórne wykorzystanie (analityka, trening modeli, badania) ma własny cel, podstawę i komunikat; brak ogólnego „możemy używać Twoich danych, by ulepszać usługi” dla danych o zdrowiu.

## B. Przejrzystość i prawa osób

- [ ] **GDPR-10** [EU][M] Polityka prywatności (art. 13/14) jest warstwowa, w każdym wspieranym języku, dostępna przed założeniem konta i w aplikacji; wymienia wszystkich odbiorców, w tym Google i każdego dostawcę SDK, regiony, retencję per typ danych i przesłankę z art. 9.
- [ ] **GDPR-11** [EU][M] **Dostęp** (art. 15) i **przenoszenie** (art. 20) wdrożone od początku do końca: eksport dokumentów Firestore i plików ze Storage dla jednego użytkownika w formacie maszynowym (JSON lub FHIR), w ciągu miesiąca.
- [ ] **GDPR-12** [EU][M] Procedura **usuwania** (art. 17) obejmuje Firestore, Storage, Auth, Cloud Logging, eksporty do BigQuery, kopie zapasowe w ramach ich retencji, zgłoszenia w systemie wsparcia i klucz pseudonimizacji; wyjątki (przepisy o retencji dokumentacji medycznej) udokumentowane i wyjaśnione użytkownikowi.
- [ ] **GDPR-13** [EU][M] Sprostowanie, ograniczenie i sprzeciw (art. 16, 18, 21) mają właściciela i śledzony proces; zdefiniowano weryfikację tożsamości przed realizacją żądania.
- [ ] **GDPR-14** [EU][M] **Art. 22** zautomatyzowane podejmowanie decyzji: jeśli aplikacja wydaje decyzje o skutkach prawnych lub podobnie istotnych (triaż, kwalifikacja), dostępna jest interwencja człowieka, wyjaśnienie i możliwość zakwestionowania.
- [ ] **GDPR-15** [EU][S] „Panel prywatności” w aplikacji pokazuje, co jest przechowywane, kto miał dostęp (dostęp personelu), i pozwala pobrać lub usunąć dane.

## C. Dokumentacja rozliczalności

- [ ] **GDPR-20** [EU][M] **Rejestr czynności przetwarzania** (art. 30) wymienia każdą operację z celami, kategoriami, odbiorcami, transferami, retencją, środkami bezpieczeństwa; aktualizowany z każdym wydaniem.
- [ ] **GDPR-21** [EU][M] **DPIA** (art. 35) przeprowadzona; przetwarzanie szczególnych kategorii na dużą skalę jest na liście obowiązkowej. Zawiera niezbędność/proporcjonalność, ryzyka dla osób, środki, opinię IOD, ryzyko resztkowe i decyzję o konsultacjach (art. 36). → szablon: `templates/dpia-outline.md`
- [ ] **GDPR-22** [EU][M] **Inspektor ochrony danych** (art. 37) wyznaczony, gdy przetwarzanie szczególnych kategorii na dużą skalę jest główną działalnością; dane kontaktowe opublikowane i zgłoszone organowi.
- [ ] **GDPR-23** [EU][M] Administratorzy spoza UE mają **przedstawiciela w UE** (art. 27).
- [ ] **GDPR-24** [EU][M] Dowody **ochrony danych w fazie projektowania i domyślnej** (art. 25): decyzje o minimalizacji, architektura pseudonimizacji, analityka domyślnie wyłączona, automatyzacja retencji.
- [ ] **GDPR-25** [EU][S] Zapisy szkoleń z ochrony danych dla każdego, kto ma dostęp produkcyjny.

## D. Podmioty przetwarzające, Google i podprocesorzy

- [ ] **GDPR-30** [EU][M] **Data Processing and Security Terms** Google Cloud / Firebase zaakceptowane dla właściwego podmiotu prawnego; wskazano produkty Firebase, w których Google jest podmiotem przetwarzającym, i te, w których jest niezależnym administratorem (np. Analytics w niektórych konfiguracjach).
- [ ] **GDPR-31** [EU][M] Subskrybowana jest **lista podprocesorów** Google; istnieje krok przeglądu powiadomień o zmianach.
- [ ] **GDPR-32** [EU][M] Każdy podmiot przetwarzający spoza Google (dostawca e-mail, bramka SMS, system wsparcia, raportowanie awarii, płatności, tłumaczenia, API LLM) ma umowę wg **art. 28**, figuruje w rejestrze czynności i w polityce prywatności. → szablon: `templates/third-party-sdk-register.md`
- [ ] **GDPR-33** [EU][M] Instrukcje dla podmiotów przetwarzających są udokumentowane: jakie dane, jakie regiony, jaka retencja, i że żadne dane nie są używane do własnych celów podmiotu (potwierdzone rezygnacje z treningu modeli u dostawców LLM).
- [ ] **GDPR-34** [EU][S] Audyty lub certyfikaty podmiotów przetwarzających (ISO 27001, SOC 2, ISO 27701) zbierane co roku.

## E. Transfery międzynarodowe (rozdział V)

- [ ] **GDPR-40** [EU][M] Mechanizm transferu wskazany dla Google LLC (certyfikacja EU-US Data Privacy Framework) i każdego dostawcy z USA; zapasowo **standardowe klauzule umowne (2021/914)** z **oceną skutków transferu**, gdyby DPF został unieważniony.
- [ ] **GDPR-41** [EU][M] Lokalizacje danych Firebase wybrane w UE, gdzie produkt na to pozwala (Firestore, Storage, Functions, Realtime Database); produkty przechowujące dane w USA niezależnie od regionu projektu (rekordy użytkowników Firebase Authentication, część usług Google) są wskazane, objęte mechanizmem transferu i ujawnione w polityce.
- [ ] **GDPR-42** [EU][M] Dostęp wsparcia i administratorów spoza UE (własny personel, wsparcie Google) traktowany jako transfer; Access Transparency / Access Approval rozważone dla usług GCP, które je wspierają.
- [ ] **GDPR-43** [EU][S] Jeśli program krajowy (np. DiGA) zakazuje przetwarzania w krajach trzecich, architektura to dowodzi: brak produktów hostowanych w USA, brak dostępu wsparcia z USA, wyłącznie europejskie endpointy LLM.

## F. Bezpieczeństwo przetwarzania (art. 32) i naruszenia

- [ ] **GDPR-50** [EU][M] Udokumentowane środki bezpieczeństwa proporcjonalne do ryzyka: szyfrowanie w tranzycie i w spoczynku, pseudonimizacja, kontrola dostępu, logowanie, odporność, testy odtwarzania, regularne testy skuteczności. (Szczegóły techniczne w plikach 06–10.)
- [ ] **GDPR-51** [EU][M] **Procedura naruszeń**: źródła wykrywania, ocena powagi, zgłoszenie organowi w 72 godziny (art. 33), zawiadomienie osób (art. 34), rejestr naruszeń obejmujący także niezgłoszone.
- [ ] **GDPR-52** [EU][M] Procedura naruszeń obejmuje incydenty po stronie Google (jak odbierasz powiadomienia od Google i podprocesorów) oraz błędnie zaadresowane powiadomienia lub eksporty własnego personelu.
- [ ] **GDPR-53** [EU][S] Ćwiczenie sztabowe scenariusza naruszenia raz w roku; wnioski spisane.

## G. Dyrektywa ePrivacy i dane z urządzenia

- [ ] **GDPR-60** [EU][M] **Art. 5 ust. 3 ePrivacy**: każde zapisywanie lub odczyt informacji na urządzeniu, które nie jest ściśle niezbędne (identyfikatory analityczne, identyfikator reklamowy, fingerprinting, eksperymenty Remote Config, Performance Monitoring), wymaga wcześniejszej zgody; wytyczne EROD 2/2023 o zakresie technicznym art. 5(3) zastosowane do SDK, nie tylko do ciasteczek.
- [ ] **GDPR-61** [EU][M] Automatyczna inicjalizacja SDK Firebase dla Analytics, Crashlytics, Performance Monitoring i Messaging wyłączona do czasu zgody (flagi w manifeście/plist plus wywołania włączające w runtime).
- [ ] **GDPR-62** [EU][M] Zbieranie identyfikatora reklamowego wyłączone (`google_analytics_adid_collection_enabled=false`, brak frameworka AdSupport na iOS); brak SDK reklamowych w aplikacji medycznej.
- [ ] **GDPR-63** [EU][S] Tokeny powiadomień push traktowane jako dane osobowe; treść powiadomienia nigdy nie ujawnia stanu zdrowia na ekranie blokady.
- [ ] **GDPR-64** [EU][S] Build webowy: baner zgody obejmuje analitykę Firebase Hosting, ciasteczka Firebase Auth zakwalifikowane jako ściśle niezbędne, ujawnienie reCAPTCHA Enterprise.

## H. Pseudonimizacja i wykorzystanie badawcze

- [ ] **GDPR-70** [EU][M] Dane pseudonimizowane nadal są danymi osobowymi; magazyn kluczy jest udokumentowany jako przetwarzanie z własnymi zabezpieczeniami (wytyczne EROD 01/2025 o pseudonimizacji).
- [ ] **GDPR-71** [EU][S] Twierdzenia o anonimizacji dla statystyk zagregowanych są testowane (k-anonimowość, ryzyko reidentyfikacji) i zatwierdzone przez IOD.
- [ ] **GDPR-72** [EU][S] Eksporty badawcze stosują zabezpieczenia z art. 89 i krajowe przepisy o badaniach; odniesienia do zgód komisji bioetycznych przechowywane z konfiguracją zadania eksportu.

## I. Specyfika krajowa (przykłady)

- [ ] **GDPR-80** [EU][S] Krajowe reguły dla danych o zdrowiu sprawdzone dla każdego rynku: Niemcy (§203 StGB tajemnica zawodowa, DiGAV), Francja (certyfikacja hostingu HDS, metodologie referencyjne CNIL), Holandia (NEN 7510/7512/7513), Włochy (wytyczne Garante), Polska (wytyczne sektorowe UODO, retencja dokumentacji medycznej 20 lat).
- [ ] **GDPR-81** [EU][S] Obowiązki retencji dokumentacji medycznej świadczeniodawcy są oddzielone od własnej retencji dostawcy; aplikacja może przechowywać dane dla świadczeniodawcy bez stawania się administratorem.

## J. Dowody potrzebne w tej sekcji

Rejestr czynności, DPIA, wyznaczenie IOD, polityki (wszystkie języki), schemat logu zgód, umowy wg art. 28 oraz zapisy DPF/SCC, ocena skutków transferu, rejestr naruszeń, rejestr SDK, procedura usuwania z dowodami testów.
