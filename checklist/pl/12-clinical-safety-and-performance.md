# 12 · Bezpieczeństwo kliniczne, algorytmy, alarmy i działanie

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Podstawowe pytanie regulatora: czy oprogramowanie robi to, co deklaruje, dla kogo, i co się dzieje, gdy nie robi. Ten plik obejmuje treść kliniczną produktu; punkty specyficzne dla AI są w pliku 17.

## A. Podstawa kliniczna

- [ ] **CLN-01** [ALL][M] Każde twierdzenie kliniczne jest powiązane z dowodem: wytyczne, literatura, badanie walidacyjne lub badanie kliniczne; **ważne powiązanie kliniczne** (MDCG 2020-1) spisane dla każdego algorytmu i wskaźnika.
- [ ] **CLN-02** [ALL][M] Algorytmy, wskaźniki i progi są określone w **specyfikacji algorytmu** niezależnej od kodu: wejścia, formuła, jednostki, zaokrąglanie, przypadki brzegowe, źródło, wersja; przejrzane przez klinicystę.
- [ ] **CLN-03** [ALL][M] Zwalidowane narzędzia (PHQ-9, GAD-7, EQ-5D, kwestionariusze PRO specyficzne dla chorób) używane z licencjonowaną, niezmienioną treścią i opublikowaną punktacją; tłumaczenia używają zwalidowanych wersji językowych.
- [ ] **CLN-04** [ALL][M] Zakresy referencyjne i progi mają źródło, są wersjonowane i przeglądane przy zmianie wytycznych; aplikacja potrafi pokazać klinicyście źródło.
- [ ] **CLN-05** [ALL][M] Ograniczenia populacyjne (wiek, ciąża, choroby współistniejące, równania specyficzne etnicznie) podane i wymuszane lub sygnalizowane ostrzeżeniem w UI.
- [ ] **CLN-06** [ALL][S] **Rada kliniczna** lub wskazany doradca medyczny przegląda wydania zmieniające treść kliniczną; protokoły zachowane.

## B. Weryfikacja działania technicznego i klinicznego

- [ ] **CLN-10** [ALL][M] Każdy algorytm ma **referencyjny zestaw testowy** z oczekiwanymi wynikami (w tym wejścia brzegowe i nieprawidłowe) obliczonymi niezależnie (arkusz, implementacja referencyjna); testy automatyczne porównują implementację w Dart/Functions z nim.
- [ ] **CLN-11** [ALL][M] Działanie analityczne (dokładność, precyzja, zgodność z metodą referencyjną) zmierzone i raportowane, gdy aplikacja oblicza lub przekształca pomiary (np. tętno z kamery, liczenie kroków, analiza obrazu).
- [ ] **CLN-12** [ALL][M] Dowody **działania klinicznego** (czułość, swoistość, PPV/NPV, kalibracja, użyteczność kliniczna) dla funkcji diagnostycznych lub predykcji ryzyka, w przewidzianej populacji i warunkach; raportowane przedziały ufności.
- [ ] **CLN-13** [ALL][M] Działanie w podgrupach (płeć, wiek, odcień skóry dla czujników optycznych, modele urządzeń, wersje OS) przeanalizowane i ograniczenia podane.
- [ ] **CLN-14** [ALL][M] Walidacja czynników ludzkich pokazuje, że użytkownicy poprawnie interpretują wyniki (nie tylko, że liczba jest poprawna).
- [ ] **CLN-15** [ALL][S] Plan obserwacji działania w warunkach rzeczywistych (PMCF / porynkowy) definiuje metryki, źródła danych i progi uruchamiające działanie.

## C. Kalkulatory, dawkowanie i funkcje lekowe

- [ ] **CLN-20** [ALL][M] Kalkulatory dawek: źródło formuły, jednostki (mg, mg/kg, mL, IU), obsługa stężeń, korekty na masę/wiek/nerki, limity maksymalnej dawki i twarde blokady; podwójne wprowadzanie lub potwierdzenie dla leków wysokiego ryzyka; **wytyczna Apple 1.4.1** wymaga, by takie kalkulatory pochodziły od producenta, szpitala, uczelni, ubezpieczyciela, apteki lub regulatora albo były przez nich zatwierdzone.
- [ ] **CLN-21** [ALL][M] Przypomnienia o lekach: logika pominiętej dawki, zmiany stref czasowych, limity odkładania, zapobieganie podwójnej dawce, interakcja z uprawnieniami do powiadomień; zachowanie przy zablokowanych powiadomieniach pokazane użytkownikowi.
- [ ] **CLN-22** [ALL][M] Bazy leków i kontrole interakcji licencjonowane, wersjonowane i aktualizowane wg harmonogramu; wersja pokazana w aplikacji.
- [ ] **CLN-23** [ALL][M] Tabele konwersji jednostek testowane wartościami referencyjnymi; mieszane jednostki na jednym ekranie zabronione.
- [ ] **CLN-24** [ALL][S] Wyświetlanie liczb używa separatorów zgodnych z locale i unika niejednoznacznych formatów (zera końcowe, początkowe ułamki) wg zaleceń ISMP.

## D. Alarmy, alerty i eskalacja

- [ ] **CLN-30** [ALL][M] Wymagania alertów określone: warunek, priorytet, budżet latencji, kanał dostarczenia, potwierdzenie, eskalacja, zachowanie przy awarii; zgodne z koncepcjami IEC 60601-1-8, gdy istotne.
- [ ] **CLN-31** [ALL][M] Aplikacja nigdy nie sugeruje monitorowania w czasie rzeczywistym, którego nie może zagwarantować; limity latencji FCM, działania w tle i łączności podane w instrukcji („nie do użytku w nagłych wypadkach”, jeśli dotyczy).
- [ ] **CLN-32** [ALL][M] Zmęczenie alertami uwzględnione: progi, deduplikacja, godziny ciszy z nadpisaniami bezpieczeństwa, limity konfigurowalne przez klinicystę w bezpiecznych granicach.
- [ ] **CLN-33** [ALL][M] Potwierdzenie dostarczenia dla komunikatów krytycznych (klinicysta potwierdza; pacjent widzi, że wiadomość przeczytano); niedostarczone alerty krytyczne eskalują.
- [ ] **CLN-34** [ALL][M] Wskazówki awaryjne (zadzwoń po pomoc) pokazane dla wejść wysokiego ryzyka (pozycje o myślach samobójczych, niebezpieczne parametry życiowe) z numerami alarmowymi zależnymi od regionu.
- [ ] **CLN-35** [ALL][S] Alerty testowane od początku do końca w laboratorium na rzeczywistej macierzy urządzeń, w tym Nie przeszkadzać, tryby Skupienia, oszczędzanie baterii i wymuszone zatrzymanie aplikacji.

## E. Treść kliniczna, komunikacja i edukacja

- [ ] **CLN-40** [ALL][M] Treści edukacyjne i doradcze przejrzane przez wykwalifikowanego klinicystę, wersjonowane, ze źródłami i datami przeglądu; czytelność dopasowana do populacji użytkowników (np. prosty język, poziom B1).
- [ ] **CLN-41** [ALL][M] Komunikacja pacjent–klinicysta ma jasne oczekiwania (czas odpowiedzi, nie na nagłe wypadki), retencję i włączenie do dokumentacji medycznej, gdy wymagane.
- [ ] **CLN-42** [ALL][M] Funkcje telemedyczne (wideo, zdalna konsultacja) spełniają krajowe zasady telezdrowia, zgody, weryfikacji tożsamości i polityki nagrywania.
- [ ] **CLN-43** [ALL][S] Funkcje zmiany zachowań (nudge, gamifikacja) przejrzane pod kątem etyki i granic praktyk zakazanych z aktu o AI.

## F. Badania kliniczne i naukowe

- [ ] **CLN-50** [ALL][M] Jeśli dane zbierane są do badania: protokół, zgoda komisji bioetycznej, świadoma zgoda (odrębna od zgody w aplikacji), ISO 14155 / ICH GCP, plan zarządzania danymi, zgodność aplikacji jako narzędzia zbierania danych z częścią 11 i art. 89 RODO.
- [ ] **CLN-51** [ALL][M] Buildy badawcze są odrębne od komercyjnych (lub wyraźnie skonfigurowane); oznakowanie wyrobu badanego, gdy wymagane.
- [ ] **CLN-52** [ALL][S] Eksport danych badania zwalidowany (mapowanie eCRF, kompletność śladu audytowego) i walidacja systemu udokumentowana dla sponsora.

## G. Clinical safety case

- [ ] **CLN-60** [ALL][M] Istnieje **clinical safety case** (log zagrożeń → kontrole → dowody → argument ryzyka resztkowego) utrzymywany per wydanie; podpisuje go wskazany lider bezpieczeństwa klinicznego (obowiązkowe w UK przez DCB0129; dobra praktyka wszędzie).
- [ ] **CLN-61** [ALL][M] Zagrożenia obejmują: niewłaściwy pacjent, błędną wartość, brak alertu, opóźnione dane, nieaktualne dane, błędną interpretację, nadmierne zaufanie (automation bias), niedostateczne zaufanie i porzucenie.
- [ ] **CLN-62** [ALL][S] Safety case i dokumentacja ryzyka uzgadniane z danymi o incydentach i reklamacjach co najmniej raz w roku.

## H. Dowody potrzebne w tej sekcji

Specyfikacje algorytmów, referencyjne zestawy testowe i raporty, raporty badań działania, raport oceny klinicznej, specyfikacja alarmów i raporty testów, zapisy przeglądu treści, dokumentacja badań, clinical safety case.
