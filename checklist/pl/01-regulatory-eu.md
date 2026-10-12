# 01 · Wymagania regulacyjne UE

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Obejmuje MDR 2017/745 (i IVDR, gdy ma zastosowanie), horyzontalne przepisy UE, które dotykają aplikacji zdrowotnej, oraz krajowe programy zdrowia cyfrowego, które decydują, czy ktoś za nią zapłaci. RODO ma osobny plik (03).

## A. Obowiązki producenta (MDR art. 10)

- [ ] **EU-01** [EU][M] Wiesz, kto jest **producentem w rozumieniu prawa** (podmiot, którego nazwa jest na etykiecie), i to ten podmiot jest właścicielem dokumentacji technicznej oraz organizacji Firebase/Google Cloud.
- [ ] **EU-02** [EU][M] System zarządzania jakością zgodny z **ISO 13485:2016** (lub równoważny, spełniający art. 10 ust. 9) jest wdrożony, a dla klasy IIa i wyższych certyfikowany przez jednostkę notyfikowaną.
- [ ] **EU-03** [EU][M] Wskazana jest **osoba odpowiedzialna za zgodność regulacyjną** (art. 15) z udokumentowanymi kwalifikacjami; mikro i małe przedsiębiorstwa mogą korzystać z zewnętrznej PRRC pozostającej stale i w sposób ciągły do ich dyspozycji.
- [ ] **EU-04** [EU][M] Jeśli producent jest poza UE: podpisane upoważnienie dla **upoważnionego przedstawiciela** (art. 11), a jego dane są na etykiecie.
- [ ] **EU-05** [EU][M] Role importera i dystrybutora (art. 13, 14) są zmapowane dla dystrybucji przez sklepy z aplikacjami; istnieje pisemne uzasadnienie, dlaczego Apple/Google są lub nie są dystrybutorami w Twoim łańcuchu dostaw.
- [ ] **EU-06** [EU][M] Zabezpieczenie finansowe potencjalnej odpowiedzialności (art. 10 ust. 16) jest zapewnione (ubezpieczenie OC za produkt odpowiednie do klasy).
- [ ] **EU-07** [EU][M] Dokumentacja techniczna jest przechowywana przez 10 lat od wprowadzenia do obrotu ostatniego egzemplarza; dla oprogramowania wiąże się to z ostatnią udostępnioną wersją aplikacji.

## B. Dokumentacja techniczna (załączniki II i III)

- [ ] **EU-10** [EU][M] Opis i specyfikacja wyrobu, w tym Basic UDI-DI, przewidziane zastosowanie, warianty, poprzednie generacje, wyposażenie.
- [ ] **EU-11** [EU][M] Oznakowanie i instrukcja używania we wszystkich językach wymaganych przez państwa członkowskie, w których sprzedajesz (zał. I §23; krajowe zasady językowe).
- [ ] **EU-12** [EU][M] Informacje o projekcie i produkcji: architektura oprogramowania, cykl życia (wyniki IEC 62304), identyfikacja lokalizacji i podwykonawców, w tym Google jako dostawcy hostingu.
- [ ] **EU-13** [EU][M] **Lista kontrolna GSPR** (zał. I) z zastosowalnością, metodą wykazania zgodności, zastosowaną normą i miejscem dowodu dla każdego wymogu.
- [ ] **EU-14** [EU][M] Analiza korzyści i ryzyka oraz dokumentacja zarządzania ryzykiem (ISO 14971:2019 + ISO/TR 24971).
- [ ] **EU-15** [EU][M] Weryfikacja i walidacja: V&V oprogramowania, użyteczność (IEC 62366-1), testy cyberbezpieczeństwa, raport z oceny klinicznej.
- [ ] **EU-16** [EU][M] **Dokumentacja techniczna PMS** wg zał. III: plan nadzoru po wprowadzeniu do obrotu, PSUR lub raport PMS, plan i raporty PMCF.
- [ ] **EU-17** [EU][M] Dokumentacja odwołuje się do dokładnych wersji oprogramowania i identyfikatorów buildów; każdy wydany build da się powiązać z rewizją dokumentacji.

## C. GSPR dotyczące oprogramowania (zał. I rozdz. II §17)

- [ ] **EU-20** [EU][M] §17.1 Oprogramowanie zaprojektowane tak, by zapewnić powtarzalność, niezawodność i działanie zgodne z przewidzianym zastosowaniem; przeprowadzono analizę stanu pojedynczego uszkodzenia.
- [ ] **EU-21** [EU][M] §17.2 Rozwój i produkcja zgodnie ze stanem wiedzy: cykl życia, zarządzanie ryzykiem, bezpieczeństwo informacji, weryfikacja i walidacja (wykazane przez IEC 62304, ISO 14971, IEC 81001-5-1).
- [ ] **EU-22** [EU][M] §17.3 Oprogramowanie do użycia z mobilnymi platformami obliczeniowymi uwzględnia **rozmiar ekranu, kontrast, łączność, pamięć, baterię** i różnorodność urządzeń; macierz wspieranych urządzeń istnieje i jest testowana.
- [ ] **EU-23** [EU][M] §17.4 **Minimalne wymagania dotyczące sprzętu, właściwości sieci IT i środków bezpieczeństwa IT** potrzebnych do działania zgodnie z przeznaczeniem są opublikowane w instrukcji używania (wersje OS, wymagania sprzętowe, sieć, stan bezpieczeństwa OS, np. „nie używać na urządzeniu z rootem/jailbreakiem”, jeśli to Twój środek ograniczający).
- [ ] **EU-24** [EU][M] §14.2(d) ochrona przed ryzykiem wynikającym z racjonalnie przewidywalnych warunków środowiskowych, w tym utraty łączności i zabicia aplikacji w tle przez system.
- [ ] **EU-25** [EU][M] §14.1 i §14.5 dla interoperacyjności i kompatybilności z innymi wyrobami (urządzenia noszone, serwery FHIR): zweryfikowane i udokumentowane.
- [ ] **EU-26** [EU][S] **MDCG 2019-16** (cyberbezpieczeństwo) użyte jako interpretacja §17.2 i §17.4; działania przed- i porynkowe z tego dokumentu zmapowane do QMS.

## D. Ocena kliniczna (art. 61, zał. XIV, MDCG 2020-1)

- [ ] **EU-30** [EU][M] Plan i raport oceny klinicznej istnieją nawet dla oprogramowania klasy I; MDCG 2020-1 zastosowane dla MDSW: ważne powiązanie kliniczne, działanie techniczne, działanie kliniczne.
- [ ] **EU-31** [EU][M] Przegląd literatury, twierdzenia o równoważności (jeśli są) i źródła danych klinicznych udokumentowane; równoważność dla oprogramowania wymaga dostępu do dokumentacji technicznej porównywanego wyrobu.
- [ ] **EU-32** [EU][M] Decyzja, czy wymagane jest **badanie kliniczne** (ISO 14155, art. 62), zapisana z uzasadnieniem; jeśli je prowadzisz: zgoda komisji bioetycznej, zgłoszenie krajowe/EUDAMED, obowiązki sponsora.
- [ ] **EU-33** [EU][M] **Plan PMCF** (zał. XIV część B) określa, jak zbierane są dane o działaniu w warunkach rzeczywistych z aplikacji, bez zamieniania analityki w niezgodne z prawem przetwarzanie.
- [ ] **EU-34** [EU][S] Ocena kliniczna aktualizowana w zaplanowanych odstępach i przy istotnych zmianach oprogramowania; lista wyzwalaczy zapisana w procedurze kontroli zmian.

## E. Oznakowanie, instrukcja używania i eIFU

- [ ] **EU-40** [EU][M] Treść etykiety wg zał. I §23.2 dostosowana do oprogramowania: nazwa i adres producenta, nazwa wyrobu, symbol „MD”, UDI, wersja, upoważniony przedstawiciel, oznakowanie CE z numerem jednostki notyfikowanej, gdy dotyczy; pokazane na ekranie „O aplikacji / Informacje regulacyjne” i w opisach w sklepach.
- [ ] **EU-41** [EU][M] Instrukcja używania wg §23.4, w tym przewidziane zastosowanie, użytkownicy, ryzyko resztkowe, ostrzeżenia, minimalne wymagania z §17.4, sposób zgłaszania incydentów, data wydania/rewizji.
- [ ] **EU-42** [EU][M] Elektroniczna instrukcja używania wg **rozporządzenia (UE) 2021/2226**: oprogramowanie jest w zakresie; wersja papierowa dostępna bezpłatnie na żądanie w regulowanym terminie; dostępne poprzednie wersje; dostępność strony monitorowana.
- [ ] **EU-43** [EU][M] Symbole wg ISO 15223-1 i ISO 20417 użyte poprawnie: „MD”, „UDI”, producent, zapoznaj się z instrukcją.
- [ ] **EU-44** [EU][M] Tłumaczenia są dokumentami nadzorowanymi (nie doraźnymi edycjami ARB): dostawca tłumaczeń, przegląd przez klinicystę, wersja zablokowana do wydania.

## F. UDI i EUDAMED

- [ ] **EU-50** [EU][M] UDI-DI przydzielone (GS1, HIBCC lub ICCBBA) i UDI-PI zdefiniowane; **MDCG 2018-5**: nowe UDI-DI przy zmianie przewidzianego zastosowania, interfejsu użytkownika lub działania, UDI-PI (wersja) przy drobnych zmianach.
- [ ] **EU-51** [EU][M] UDI pokazane na łatwo dostępnym ekranie (tekst jawny i forma czytelna dla AIDC) wg zał. VI część C §6.5.
- [ ] **EU-52** [EU][M] Rejestracja podmiotu (SRN) oraz rejestracja wyrobu/UDI w **EUDAMED** zgodnie z terminami obowiązkowych modułów; rejestracja krajowa tam, gdzie moduły EUDAMED nie są jeszcze obowiązkowe.
- [ ] **EU-53** [EU][S] Procedura decyduje o UDI-DI vs UDI-PI dla każdego wydania, a ciąg wersji aplikacji, wersja w sklepie i Basic UDI-DI są spójne.

## G. Ocena zgodności, deklaracja zgodności, oznakowanie CE

- [ ] **EU-60** [EU][M] Ścieżka oceny zgodności wybrana wg klasy (zał. IX, X, XI); dla klasy I podpisana **deklaracja zgodności UE** (zał. IV) istnieje przed udostępnieniem aplikacji.
- [ ] **EU-61** [EU][M] Oznakowanie CE umieszczone poprawnie (z numerem jednostki notyfikowanej, gdy dotyczy) w aplikacji i w dokumentacji; nigdy na buildzie różnym od ocenionego.
- [ ] **EU-62** [EU][M] Procedura istotnej zmiany (MDCG 2020-3 dla wyrobów „legacy”; umowa z jednostką notyfikowaną dla wyrobów certyfikowanych) określa, które wydania wymagają powiadomienia jednostki przed publikacją.
- [ ] **EU-63** [EU][M] Przepisy przejściowe (przedłużenia z rozp. 2023/607 do 2027/2028) rozumiane, jeśli masz wyrób „legacy” wg MDD; warunki (QMS, złożony wniosek) śledzone.
- [ ] **EU-64** [EU][S] Śledzisz propozycje Komisji dotyczące ukierunkowanej rewizji MDR/IVDR (od 2025) pod kątem zmian w klasyfikacji oprogramowania, częstości PSUR i nadzoru jednostek notyfikowanych.

## H. Nadzór po wprowadzeniu do obrotu i vigilance (art. 83–92)

- [ ] **EU-70** [EU][M] **Plan PMS** (art. 84, zał. III) obejmuje dane o awariach, zgłoszenia do wsparcia, recenzje w sklepach, ostrzeżenia bezpieczeństwa, analizę trendów i informacje zwrotne od klinicystów.
- [ ] **EU-71** [EU][M] Klasa I: raport PMS (art. 85); klasa IIa i wyższe: **PSUR** (art. 86) w wymaganym odstępie i przedłożony jednostce notyfikowanej.
- [ ] **EU-72** [EU][M] Procedura **vigilance**: zgłaszanie poważnych incydentów w 15 dni (2 dni przy poważnym zagrożeniu zdrowia publicznego, 10 dni przy zgonie lub nieprzewidzianym poważnym pogorszeniu) na formularzu MIR; zewnętrzne działania korygujące dotyczące bezpieczeństwa z szablonami FSN.
- [ ] **EU-73** [EU][M] Progi **raportowania trendów** (art. 88) zdefiniowane, także dla incydentów czysto programowych (błędna wartość, utrata synchronizacji, niedostarczone powiadomienie).
- [ ] **EU-74** [EU][M] Kanał zgłaszania incydentów dla użytkowników istnieje w aplikacji i na stronie, w języku użytkownika.
- [ ] **EU-75** [EU][S] Recenzje w sklepach i raporty awarii są przeglądane względem definicji „incydentu” przez przeszkoloną osobę, z zapisami.

## I. Akt o AI (rozporządzenie (UE) 2024/1689)

- [ ] **EU-80** [EU][M] Każdy komponent ML/AI jest zinwentaryzowany; dla każdego zdecydowano i zapisano, czy czyni produkt **systemem AI wysokiego ryzyka** (zał. I: AI w wyrobie medycznym podlegającym ocenie zgodności przez stronę trzecią).
- [ ] **EU-81** [EU][M] Jeśli wysokie ryzyko: system zarządzania ryzykiem, zarządzanie danymi, dokumentacja techniczna (zał. IV), rejestrowanie zdarzeń, przejrzystość, nadzór człowieka, dokładność/odporność/cyberbezpieczeństwo (art. 9–15); ocena zgodności zintegrowana z oceną jednostki notyfikowanej wg MDR. Data stosowania dla systemów z zał. I to 2 sierpnia 2027, o ile Digital Omnibus jej nie zmieni; śledź to.
- [ ] **EU-82** [EU][M] Przejrzystość wg art. 50: użytkownicy są informowani, że mają do czynienia z systemem AI (chatboty, treści generowane) od 2 sierpnia 2026.
- [ ] **EU-83** [EU][M] Kompetencje w zakresie AI wg art. 4: personel budujący lub obsługujący AI ma udokumentowane szkolenia (obowiązuje od lutego 2025).
- [ ] **EU-84** [EU][M] Praktyki zakazane (art. 5) sprawdzone: brak rozpoznawania emocji w miejscu pracy/edukacji, brak manipulacyjnego designu wymierzonego w grupy wrażliwe.
- [ ] **EU-85** [EU][S] Jeśli korzystasz z modelu AI ogólnego przeznaczenia przez API (Gemini, OpenAI, Anthropic): rozumiane są obowiązki dostawcy vs podmiotu stosującego; uzyskano umowne zobowiązania dotyczące dokumentacji.

## J. Inne horyzontalne przepisy UE

- [ ] **EU-90** [EU][M] **Europejska przestrzeń danych dotyczących zdrowia** (rozp. (UE) 2025/327): jeśli aplikacja wymienia dane z systemami EHR lub deklaruje interoperacyjność, zgodność systemu EHR (samodeklaracja, europejski format wymiany EHR) i dobrowolna etykieta aplikacji wellness są w planie z etapowymi datami stosowania.
- [ ] **EU-91** [EU][S] **NIS2** (dyr. 2022/2555): przy sprzedaży do szpitali (podmioty kluczowe) spodziewaj się klauzul bezpieczeństwa łańcucha dostaw; miej gotową odpowiedź w postaci ISMS (ISO/IEC 27001 lub dowody z IEC 81001-5-1).
- [ ] **EU-92** [EU][S] **Cyber Resilience Act** (rozp. 2024/2847): wyroby MDR/IVDR są wyłączone, ale towarzyszące oprogramowanie niebędące wyrobem lub publikowane przez Ciebie SDK mogą być w zakresie; decyzja zapisana.
- [ ] **EU-93** [EU][S] **Europejski akt o dostępności** (dyr. 2019/882, stosowany od 28 czerwca 2025): zdecyduj, czy Twoja usługa (np. elementy e-commerce, subskrypcje) jest w zakresie; w każdym razie spełnij EN 301 549 / WCAG 2.2 AA jako „stan wiedzy” dla użyteczności wg GSPR.
- [ ] **EU-94** [EU][M] **Dyrektywa o odpowiedzialności za produkt** (dyr. 2024/2853, stosowana od grudnia 2026): oprogramowanie jest produktem; obowiązki aktualizacji i cyberbezpieczeństwa wpływają na odpowiedzialność; ubezpieczenie i polityka wydań przejrzane.
- [ ] **EU-95** [EU][S] Prawo konsumenckie dla zakupów w aplikacji i subskrypcji (dyrektywa o prawach konsumentów, dyrektywa o treściach cyfrowych 2019/770), jeśli pacjenci płacą.
- [ ] **EU-96** [EU][S] Krajowe przepisy o telemedycynie, e-recepcie i dokumentacji medycznej dla każdego kraju docelowego (np. Polska: ustawa o prawach pacjenta, rozporządzenie o dokumentacji medycznej, platforma P1), gdy aplikacja przechowuje lub wymienia dokumentację medyczną dla podmiotu leczniczego.

## K. Krajowe programy zdrowia cyfrowego (bramki refundacyjne)

- [ ] **EU-100** [EU][S] **Niemcy DiGA** (DVG, DiGAV, szybka ścieżka BfArM): CE klasa I/IIa/IIb, badanie pozytywnego efektu opieki, certyfikat ochrony danych i wymagania ISMS/ISO 27001, interoperacyjność (MIO/FHIR), zasady prywatności specyficzne dla DiGA (brak reklam, przetwarzanie wyłącznie w UE/EOG, brak transferów do krajów trzecich). Również DiPA dla opieki.
- [ ] **EU-101** [EU][S] **Francja PECAN** i ocena HAS; ramy interoperacyjności i bezpieczeństwa ANS (PGSSI-S); wymaganie hostingu z certyfikatem HDS dla danych o zdrowiu we Francji (zakres HDS Google Cloud trzeba sprawdzić).
- [ ] **EU-102** [EU][S] **Belgia mHealthBelgium** piramida walidacji: M1 (CE + RODO), M2 (interoperacyjność, platforma eHealth), M3 (refundacja).
- [ ] **EU-103** [EU][N] Inne schematy śledzone: Austria, Holandia (NEN 7510), nordyckie krajowe biblioteki aplikacji, Polska (programy pilotażowe), Włochy, Hiszpania.
- [ ] **EU-104** [EU][N] UK NHS **DTAC**, DCB0129 (clinical safety case producenta, wskazany Clinical Safety Officer) i DSPT przy wchodzeniu na rynek NHS.

## L. Dowody potrzebne w tej sekcji

Dokument strategii regulacyjnej, lista kontrolna GSPR, deklaracja zgodności, certyfikat jednostki notyfikowanej (jeśli jest), zapisy UDI, SRN w EUDAMED, plan PMS, PSUR/raport PMS, procedura vigilance, inwentarz wg aktu o AI, analizy luk dla programów krajowych.
