# 05 · Zarządzanie jakością, cykl życia oprogramowania, procesy ryzyka i użyteczności

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

ISO 13485 / QMSR mówią, że masz mieć procesy. IEC 62304, ISO 14971 i IEC 62366-1 mówią, co te procesy mają wytworzyć. Ten plik sprawdza, czy procesy istnieją i czy zespół Flutter naprawdę ich używa, a nie trzyma w segregatorze.

## A. System zarządzania jakością (ISO 13485:2016 / QMSR)

- [ ] **QMS-01** [ALL][M] Księga jakości, zakres, wyłączenia (np. sterylizacja, instalacja) i mapa procesów istnieją; rozwój oprogramowania jest w niej procesem nadzorowanym.
- [ ] **QMS-02** [ALL][M] Nadzór nad dokumentacją: procedury, instrukcje, szablony, zapisy; wersjonowane, zatwierdzane, ze szkoleniem przy zmianie. QMS oparty na Git jest akceptowalny, jeśli zachowane są dowody zatwierdzenia i szkoleń.
- [ ] **QMS-03** [ALL][M] Odpowiedzialność kierownictwa: polityka jakości, cele, przegląd zarządzania co najmniej raz w roku ze zdefiniowanymi danymi wejściowymi (reklamacje, CAPA, audyty, PMS, cyberbezpieczeństwo).
- [ ] **QMS-04** [ALL][M] Zapisy kompetencji i szkoleń dla każdej roli mającej styk z produktem, w tym kontraktorów i osoby piszącej reguły Firestore.
- [ ] **QMS-05** [ALL][M] Zakupy i nadzór nad dostawcami: Google, Apple, dostawcy SDK, narzędzia bezpieczeństwa chmury, kontraktorzy oceniani i monitorowani; według krytyczności.
- [ ] **QMS-06** [ALL][M] Planowanie projektowania i rozwoju dla każdego cyklu wydań; przeglądy projektu z zapisami.
- [ ] **QMS-07** [ALL][M] Program audytów wewnętrznych obejmuje procesy programistyczne i operacje chmurowe; niezależność audytora.
- [ ] **QMS-08** [ALL][M] Proces CAPA z analizą przyczyn źródłowych, sprawdzeniem skuteczności i powiązaniami z raportami problemów i vigilance.
- [ ] **QMS-09** [ALL][M] Obsługa informacji zwrotnych i reklamacji zdefiniowana dla sklepów, systemu wsparcia, klinicystów i badaczy bezpieczeństwa.
- [ ] **QMS-10** [ALL][S] Techniki statystyczne / metryki dla oprogramowania zdefiniowane (gęstość defektów, defekty wyciekłe, odsetek sesji bez awarii, MTTR) i przeglądane.

## B. Proces rozwoju oprogramowania IEC 62304

- [ ] **LC-01** [ALL][M] **Plan rozwoju oprogramowania** (§5.1): model cyklu życia (agile jest w porządku, AAMI TIR45), produkty, śledzalność, zarządzanie konfiguracją, rozwiązywanie problemów, normy, narzędzia, plan weryfikacji, plan integracji, dokumentacja wg klasy bezpieczeństwa.
- [ ] **LC-02** [ALL][M] **Specyfikacja wymagań oprogramowania** (§5.2): funkcjonalne, wydajnościowe, interfejsy, alarmy, bezpieczeństwo, użyteczność, definicja danych/baza (schemat Firestore), instalacja/akceptacja, utrzymanie, wymagania regulacyjne; każde wymaganie ma unikalny identyfikator, jest weryfikowalne, powiązane z wymaganiami systemowymi i środkami kontroli ryzyka.
- [ ] **LC-03** [ALL][M] Wymagania obejmują **reguły bezpieczeństwa Firestore**, Cloud Functions, zachowanie offline, rozwiązywanie konfliktów synchronizacji, obsługę czasu i działanie w tle jako jawne wymagania, nie szczegóły implementacji.
- [ ] **LC-04** [ALL][M] **Architektura** (§5.3, klasa B/C): komponenty, w tym warstwy aplikacji Flutter, usługi Firebase, usługi stron trzecich; interfejsy; wymagania funkcjonalne i wydajnościowe SOUP (§5.3.3) oraz wymagania sprzętowe/programowe (§5.3.4); segregacja dla kontroli ryzyka (§5.3.5).
- [ ] **LC-05** [ALL][M] **Projekt szczegółowy** (§5.4, klasa C) dla jednostek krytycznych dla bezpieczeństwa; dla B wystarczająco projektu, by zweryfikować jednostki.
- [ ] **LC-06** [ALL][M] **Implementacja i weryfikacja jednostek** (§5.5): kryteria akceptacji zdefiniowane przed kodowaniem (reguły lintera, progi pokrycia, lista kontrolna przeglądu); dowody przeglądu kodu w pull requestach.
- [ ] **LC-07** [ALL][M] **Integracja i testy integracyjne** (§5.6): aplikacja ↔ emulator Firebase ↔ Functions ↔ zewnętrzne API; regresja po zmianach.
- [ ] **LC-08** [ALL][M] **Testy systemowe** (§5.7): względem SRS, na macierzy wspieranych urządzeń, z zapisanymi i ocenionymi anomaliami; retest po poprawkach.
- [ ] **LC-09** [ALL][M] **Wydanie** (§5.8): weryfikacja zakończona, znane anomalie resztkowe ocenione, wydana wersja udokumentowana, build odtwarzalny, zarchiwizowany ze środowiskiem budowania, procedura dostarczenia (publikacja w sklepie) nadzorowana.
- [ ] **LC-10** [ALL][M] Każda czynność cyklu życia ma nazwany dokument wyjściowy (zob. plik 18) i powiązanie śledzalności.
- [ ] **LC-11** [ALL][S] Dokument mapowania agile wyjaśnia, jak sprinty, PR-y i CI spełniają czynności 62304 (AAMI TIR45).

## C. Utrzymanie oprogramowania (§6)

- [ ] **LC-20** [ALL][M] **Plan utrzymania**: jak informacje zwrotne, raporty problemów, aktualizacje OS, wydania Flutter/Firebase SDK i ostrzeżenia bezpieczeństwa są odbierane, oceniane i priorytetyzowane; jak wydawane są pilne poprawki.
- [ ] **LC-21** [ALL][M] Raporty problemów oceniane pod kątem wpływu na bezpieczeństwo i obowiązku zgłoszenia (vigilance / MDR), zanim zostaną potraktowane jak zwykłe błędy.
- [ ] **LC-22** [ALL][M] Zmodyfikowane oprogramowanie przechodzi tę samą weryfikację co nowe, skalowaną analizą wpływu; istnieje szablon analizy wpływu.
- [ ] **LC-23** [ALL][M] Aktualizacje kanału stable Flutter, Firebase SDK i platform OS mają cykl przeglądu (miesięczny) i politykę maksymalnego opóźnienia.

## D. Zarządzanie ryzykiem oprogramowania (§7) i ISO 14971

- [ ] **RM-01** [ALL][M] **Plan zarządzania ryzykiem** z zakresem, odpowiedzialnościami, kryteriami akceptowalności, czynnościami weryfikacji, zbieraniem informacji z produkcji i po produkcji.
- [ ] **RM-02** [ALL][M] Identyfikacja zagrożeń obejmuje zagrożenia programowe: błędna wartość, opóźniona wartość, brak danych, nieaktualne dane z cache pokazane jako bieżące, niewłaściwy pacjent, niedostarczone powiadomienie, pomyłka jednostek, błąd strefy czasowej, nadpisanie przy synchronizacji offline, obejście uwierzytelniania, naruszenie danych.
- [ ] **RM-03** [ALL][M] Analiza ryzyka używa sekwencji zdarzeń od awarii oprogramowania do szkody, z uwzględnieniem reakcji klinicznej; dotkliwość i prawdopodobieństwo (lub „racjonalny najgorszy przypadek”, gdy prawdopodobieństwa nie da się oszacować dla oprogramowania).
- [ ] **RM-04** [ALL][M] Środki kontroli ryzyka w kolejności priorytetów: bezpieczeństwo konstrukcyjne, środki ochronne (alarmy, potwierdzenia, kontrola zakresów), informacje dla bezpieczeństwa; weryfikacja wdrożenia **i** skuteczności.
- [ ] **RM-05** [ALL][M] Środki kontroli ryzyka powiązane z wymaganiami, kodem/konfiguracją (w tym regułami Firestore) i testami.
- [ ] **RM-06** [ALL][M] **Ryzyko SOUP**: publikowane listy anomalii Flutter, Dart, Firebase SDK i pakietów ocenione pod kątem wpływu (§7.1.3); dowody przeglądu dla każdego wydania.
- [ ] **RM-07** [ALL][M] Ocena ryzyka resztkowego i wniosek korzyści-ryzyko podpisane; ujawnienie ryzyka resztkowego w instrukcji używania.
- [ ] **RM-08** [ALL][M] Informacje z produkcji i po produkcji (awarie, wsparcie, vigilance, ostrzeżenia bezpieczeństwa) zasilają aktualizacje dokumentacji ryzyka; cykl przeglądu zdefiniowany.
- [ ] **RM-09** [ALL][S] Zarządzanie ryzykiem bezpieczeństwa (AAMI TIR57 / IEC 81001-5-1) jest powiązane z zarządzaniem ryzykiem bezpieczeństwa pacjenta, ale od niego oddzielone; ryzyka bezpieczeństwa z wpływem na pacjenta są w dokumentacji 14971.
- [ ] **RM-10** [ALL][S] Istnieje **analiza zagrożeń od awarii Firebase i limitów kwot** (niedostępność Firestore, zimny start Functions, opóźnienia FCM, fałszywe odrzucenia App Check) z środkami łagodzącymi.

## E. Zarządzanie konfiguracją (§8)

- [ ] **CM-01** [ALL][M] Elementy konfiguracji zidentyfikowane: źródła, wersja Flutter SDK (FVM), `pubspec.lock`, lockfile zależności natywnych (Gradle, CocoaPods), reguły i indeksy Firestore, reguły Storage, źródła Functions i wersja runtime, szablony Remote Config, konfiguracja projektu Firebase, definicje CI, skrypty budowania, dokumentacja.
- [ ] **CM-02** [ALL][M] **Rejestr SOUP** z tytułem, producentem, wersją dla każdego pakietu i SDK (§8.1.2). → szablon: `templates/soup-register.md`
- [ ] **CM-03** [ALL][M] Kontrola zmian: każda zmiana elementu konfiguracji jest powiązana z zatwierdzonym wnioskiem o zmianę lub raportem problemu; szablon PR wymusza powiązania.
- [ ] **CM-04** [ALL][M] Ewidencja stanu konfiguracji: dla dowolnego wydanego buildu potrafisz w kilka minut wymienić dokładne wersje wszystkich elementów konfiguracji.
- [ ] **CM-05** [ALL][M] Infrastruktura jako kod lub wyeksportowana konfiguracja projektu Firebase (reguły, indeksy, Functions, ustawienia Auth, App Check, IAM) jest wersjonowana; ręczne zmiany w konsoli są wykrywane (alert z Cloud Audit Logs) i uzgadniane.
- [ ] **CM-06** [ALL][S] Osobne projekty Firebase dla dev, staging i produkcji; projekt produkcyjny jest utworzony w organizacji Google Cloud producenta w rozumieniu prawa i do niej należy.

## F. Rozwiązywanie problemów (§9)

- [ ] **PR-01** [ALL][M] Proces raportów problemów: rejestracja, klasyfikacja (typ, zakres, krytyczność, wpływ na bezpieczeństwo), badanie, wniosek o zmianę, weryfikacja, zamknięcie, analiza trendów.
- [ ] **PR-02** [ALL][M] Raporty awarii, zgłoszenia wsparcia, recenzje w sklepach, ustalenia z pentestów i ostrzeżenia o zależnościach trafiają do tego samego systemu raportów problemów (etykiety w trackerze są akceptowalne, jeśli pola są obowiązkowe).
- [ ] **PR-03** [ALL][M] Dla każdego problemu mogącego wpływać na bezpieczeństwo rozważane jest ostrzeżenie użytkowników (komunikat w aplikacji, e-mail, FSN).
- [ ] **PR-04** [ALL][M] Analiza trendów co najmniej kwartalnie, zasila przegląd zarządzania i PMS.

## G. Proces inżynierii użyteczności (IEC 62366-1)

- [ ] **UE-01** [ALL][M] **Specyfikacja użycia**: przewidziani użytkownicy, środowiska użycia, interfejs użytkownika, profile użytkowników, w tym wiek, niepełnosprawności, kompetencje cyfrowe.
- [ ] **UE-02** [ALL][M] Cechy interfejsu związane z bezpieczeństwem zidentyfikowane; znane problemy użycia podobnych aplikacji zbadane (recenzje w sklepach, MAUDE, literatura).
- [ ] **UE-03** [ALL][M] Scenariusze użycia związane z zagrożeniami zidentyfikowane, a krytyczne wybrane do oceny sumatywnej.
- [ ] **UE-04** [ALL][M] Specyfikacja interfejsu użytkownika i **plan oceny interfejsu** (formatywnej i sumatywnej).
- [ ] **UE-05** [ALL][M] Oceny formatywne podczas projektowania (think-aloud, przegląd heurystyczny) z zapisami i wynikającymi zmianami.
- [ ] **UE-06** [ALL][M] **Ocena sumatywna** z reprezentatywnymi użytkownikami (zwykle 15 na odrębną grupę) na buildach i urządzeniach równoważnych produkcyjnym; błędy użycia przeanalizowane pod kątem przyczyn; ryzyko resztkowe związane z użyciem zaakceptowane.
- [ ] **UE-07** [ALL][M] Dokumentacja inżynierii użyteczności powiązana z dokumentacją zarządzania ryzykiem oraz treścią szkoleń i instrukcji.
- [ ] **UE-08** [ALL][S] Ocena dostępności ujęta w dokumentacji użyteczności, nie tylko jako zadanie inżynierskie.

## H. Walidacja narzędzi

- [ ] **TV-01** [ALL][M] Narzędzia programowe, których wyniki nie są w pełni weryfikowane, są walidowane do zamierzonego użycia (ISO 13485 §4.1.6; wytyczne FDA „Computer Software Assurance”, 2025): pipeline CI/CD, Firebase Emulator Suite, frameworki testowe, narzędzia QMS/podpisu elektronicznego, narzędzie zarządzania wymaganiami.
- [ ] **TV-02** [ALL][S] Udokumentowane podejście CSA oparte na ryzyku: które narzędzia są wysokiego ryzyka (bramkują wydanie) i jak są zapewniane (dowody dostawcy, testy skryptowe, testy eksploracyjne).

## I. Dowody potrzebne w tej sekcji

Księga jakości i zestaw procedur, SDP, SRS, architektura, plany i raporty testów, zapis wydania, plan utrzymania, plan/dokumentacja/raport zarządzania ryzykiem, rejestr SOUP, baza konfiguracji per wydanie, log raportów problemów i trendy, dokumentacja inżynierii użyteczności, zapisy walidacji narzędzi.
