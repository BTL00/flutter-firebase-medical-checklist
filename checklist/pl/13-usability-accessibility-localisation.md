# 13 · Użyteczność, dostępność i lokalizacja

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Użyteczność jest procesem regulowanym (plik 05 §G). Ten plik wymienia konkretne właściwości, które musi mieć UI we Flutterze, oraz wymagania dostępności i lokalizacji dla sprzedaży w wielu krajach UE i w USA.

## A. Dostępność (WCAG 2.2 AA, EN 301 549, Section 508)

- [ ] **ACC-01** [ALL][M] Docelowy standard zadeklarowany (WCAG 2.2 AA zmapowane na mobile wg wytycznych W3C; EN 301 549 dla UE; Section 508 / ADA dla USA) i sporządzony raport zgodności dostępności (VPAT / ACR).
- [ ] **ACC-02** [ALL][M] Każdy element interaktywny ma etykietę, rolę i stan `Semantics`; obrazy dekoracyjne wykluczone; własne widżety wystawiają akcje; przetestowane z TalkBack i VoiceOver na prawdziwych urządzeniach dla każdego głównego przepływu.
- [ ] **ACC-03** [ALL][M] Tekst skaluje się do co najmniej 200 % bez obcinania ani nachodzenia (`MediaQuery.textScaler`, brak stałych wysokości wokół tekstu); układy testowane przy największej czcionce systemowej i pogrubionym tekście.
- [ ] **ACC-04** [ALL][M] Kontrast kolorów ≥ 4.5:1 dla tekstu i 3:1 dla komponentów UI i grafiki; informacja nigdy nie jest przekazywana samym kolorem (wykresy, wskaźniki stanu, poziomy alertów).
- [ ] **ACC-05** [ALL][M] Cele dotykowe ≥ 48×48 dp (Android) / 44×44 pt (iOS) z odstępami; testy wytycznych dostępności Fluttera (`androidTapTargetGuideline`, `iOSTapTargetGuideline`, `textContrastGuideline`, `labeledTapTargetGuideline`) uruchamiane w testach widżetów.
- [ ] **ACC-06** [ALL][M] Kolejność fokusa logiczna; nawigacja klawiaturą i switch control działa (web i tablet); fokus widoczny.
- [ ] **ACC-07** [ALL][M] Ruch i animacje respektują ustawienie ograniczenia ruchu; brak migotania powyżej progów; automatycznie przewijana treść może być zatrzymana.
- [ ] **ACC-08** [ALL][M] Limity czasu (timeout sesji, kwestionariusze) można przedłużyć albo są uzasadnione bezpieczeństwem; ostrzeżenia przed wygaśnięciem.
- [ ] **ACC-09** [ALL][M] Formularze: widoczne etykiety, identyfikacja i podpowiedź błędu, brak etykiet tylko w placeholderze; typy wejścia dopasowane do treści (klawiatury numeryczne).
- [ ] **ACC-10** [ALL][M] Media: napisy do wideo, transkrypcje audio, tekst alternatywny obrazów, w tym obrazów wgrywanych przez klinicystów, gdzie wykonalne.
- [ ] **ACC-11** [ALL][S] Tryb ciemny, wysoki kontrast i palety bezpieczne dla daltonistów wspierane; wykresy używają wzorów/etykiet, nie tylko koloru.
- [ ] **ACC-12** [ALL][S] Dostępność testowana z użytkownikami z niepełnosprawnościami w ramach oceny formatywnej/sumatywnej, nie tylko narzędziami.
- [ ] **ACC-13** [ALL][S] Deklaracja dostępności opublikowana (dobry wzór: deklaracja w stylu sektora publicznego UE) z kontaktem i znanymi ograniczeniami.

## B. Właściwości użytecznościowe klinicznego UI

- [ ] **UX-01** [ALL][M] Główne zadania (zapisz odczyt, przyjmij dawkę, wyślij do klinicysty, przeczytaj wynik) kończą się w krótkiej, zmierzonej liczbie kroków; skuteczność zadań i odsetki błędów zapisywane w ocenach.
- [ ] **UX-02** [ALL][M] Hierarchia krytycznych informacji: tożsamość pacjenta, ostatnia wartość z jednostką i znacznikiem czasu, stan, następne działanie; nic klinicznie istotnego nie jest poniżej linii zagięcia bez sygnalizacji.
- [ ] **UX-03** [ALL][M] Wzorce potwierdzenia i cofnięcia dla działań klinicznie istotnych; działania destrukcyjne nigdy na pozycji domyślnego/głównego przycisku.
- [ ] **UX-04** [ALL][M] Komunikaty błędów mówią, co się stało, co to znaczy dla użytkownika i co zrobić; kody techniczne ukryte, ale dostępne dla wsparcia.
- [ ] **UX-05** [ALL][M] Onboarding i pomoc w aplikacji obejmują najważniejsze punkty instrukcji; pełna instrukcja i informacje regulacyjne są o jedno tapnięcie.
- [ ] **UX-06** [ALL][M] Przerwania (połączenia, powiadomienia, przełączenie aplikacji) podczas wprowadzania danych nie tracą ani nie psują wejścia; szkice zachowane.
- [ ] **UX-07** [ALL][M] Liczby, daty i jednostki formatowane jednoznacznie (zob. CLN-24); format 24- vs 12-godzinny wg locale z jawnym AM/PM, gdy używany.
- [ ] **UX-08** [ALL][S] Niska kompetencja cyfrowa i osoby starsze uwzględnione: większe domyślne rozmiary, mniej gestów, jawne przyciski zamiast działań tylko przez przesunięcie, brak polegania na odkrywaniu przez długie przytrzymanie.
- [ ] **UX-09** [ALL][S] UI klinicysty zoptymalizowane pod szybkość i wspólne urządzenia: szybkie ponowne uwierzytelnienie, zmiana pacjenta z potwierdzeniem tożsamości, brak trwałego PHI na ekranie po timeout.

## C. Lokalizacja i internacjonalizacja

- [ ] **L10N-01** [ALL][M] Cały tekst dla użytkownika wyniesiony (ARB / `intl`); brak sklejanych zdań; liczba mnoga i rodzaj obsłużone składnią ICU.
- [ ] **L10N-02** [ALL][M] Tłumaczenia są **dokumentami nadzorowanymi** przeglądanymi przez klinicystę lub tłumacza medycznego dla każdego języka; tłumaczenia instrukcji i etykiety zgodne z tekstem w aplikacji; pamięć tłumaczeniowa wersjonowana z wydaniami.
- [ ] **L10N-03** [ALL][M] Wymagane języki per rynek wymienione (krajowe zasady językowe państw UE dla instrukcji i UI; w USA angielski plus hiszpański, gdy wymaga stan lub klient); zachowanie awaryjne zdefiniowane, gdy brakuje języka.
- [ ] **L10N-04** [ALL][M] Formatowanie liczb, separatorów dziesiętnych, dat, godzin, jednostek (metryczne vs amerykańskie) zgodne z locale, z nadpisaniem przez użytkownika dla jednostek klinicznych; formaty nigdy nie wnioskowane z samego języka UI.
- [ ] **L10N-05** [ALL][M] Układ od prawej do lewej zweryfikowany, jeśli wspierany jest arabski lub hebrajski; tekst dwukierunkowy w polach mieszanych obsłużony.
- [ ] **L10N-06** [ALL][M] Pseudolokalizacja i testy najdłuższych ciągów wyłapują obcinanie we wszystkich układach.
- [ ] **L10N-07** [ALL][M] Treści specyficzne regionalnie (numery alarmowe, infolinie, informacje regulacyjne, polityka prywatności, adresy kontaktowe) przełączają się według **regionu**, nie języka.
- [ ] **L10N-08** [ALL][S] Opisy w sklepach, zrzuty ekranu i treści wsparcia zlokalizowane i przejrzane względem przewidzianego zastosowania (twierdzenia w tłumaczeniu też są twierdzeniami).
- [ ] **L10N-09** [ALL][S] Fonty pokrywają wszystkie wymagane pisma i są licencjonowane do osadzenia w aplikacji.

## D. Instrukcja używania i szkolenia

- [ ] **IFU-01** [ALL][M] Instrukcja napisana na poziomie czytania grupy użytkowników; testowana użytecznościowo w ramach oceny sumatywnej (uczestnicy muszą umieć znaleźć i zastosować krytyczne informacje).
- [ ] **IFU-02** [ALL][M] Dostęp w aplikacji do aktualnej wersji instrukcji, poprzednich wersji (zasada eIFU) i ścieżki zamówienia wersji papierowej.
- [ ] **IFU-03** [ALL][M] Materiały szkoleniowe dla klinicystów i wsparcia wersjonowane z wydaniem; ukończenie szkoleń śledzone, gdy wymaga umowa.
- [ ] **IFU-04** [ALL][S] Szybki start i ostrzeżenia krytyczne dla bezpieczeństwa pokazywane kontekstowo (pierwsze użycie funkcji), z zapisem, że użytkownik je widział, gdy zależą od tego środki kontroli ryzyka.

## E. Dowody potrzebne w tej sekcji

Raport zgodności dostępności, zapisy testów z czytnikami ekranu, testy dostępności widżetów w CI, raporty oceny użyteczności, zapisy przeglądu tłumaczeń i macierz języków, wyniki testów lokalizacji, dowody testu użyteczności instrukcji.
