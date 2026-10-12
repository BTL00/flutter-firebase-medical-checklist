# 16 · Nadzór po wprowadzeniu do obrotu, monitorowanie i ciągła zgodność

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Po wydaniu obowiązki stają się cięższe, nie lżejsze: PMS, vigilance, monitorowanie cyberbezpieczeństwa, obsługa reklamacji, PSUR, okresowe przeglądy. Ten plik zamienia je w działającą operację.

## A. Źródła monitorowania

- [ ] **PMS-01** [ALL][M] Wszystkie kanały informacji zwrotnej zinwentaryzowane i kierowane do systemu raportów problemów: system wsparcia, opinie w aplikacji, recenzje w sklepach (oba sklepy, wszystkie kraje), informacje od klinicystów, IT szpitali, badacze bezpieczeństwa, wzmianki w mediach społecznościowych, Crashlytics, alerty Cloud Monitoring, powiadomienia bezpieczeństwa Google Cloud.
- [ ] **PMS-02** [ALL][M] Telemetria techniczna zdefiniowana i przejrzana pod kątem prywatności: użytkownicy bez awarii, ANR, odsetki błędów per Function, odrzucenia reguł, błędy synchronizacji, odsetki dostarczenia powiadomień, latencja; dashboardy z właścicielami.
- [ ] **PMS-03** [ALL][M] Wskaźniki działania klinicznego (z planu PMCF / działania w warunkach rzeczywistych) zbierane zgodnie z prawem, z progami uruchamiającymi badanie.
- [ ] **PMS-04** [ALL][M] Monitorowanie bezpieczeństwa: anomalie logów audytowych, zmiany IAM, wdrożenia reguł, skoki odrzuceń App Check, sygnały ataków na Auth, ostrzeżenia o zależnościach (plik 06).
- [ ] **PMS-05** [ALL][S] Obserwacja platform: release notes Flutter, Dart, Firebase SDK, zmiany zachowania w betach iOS/Androida, aktualizacje polityk sklepów; przeglądane co miesiąc z notatkami o wpływie.
- [ ] **PMS-06** [ALL][S] Obserwacja regulacyjna: wytyczne MDCG, wytyczne FDA, przepisy HHS/FTC, prawa stanowe, terminy aktu o AI, akty EHDS; właściciel i log.

## B. Obsługa reklamacji, incydentów i vigilance

- [ ] **PMS-10** [ALL][M] Definicje reklamacji, incydentu, poważnego incydentu (UE) i zdarzenia zgłaszanego wg MDR (USA) spisane i przeszkolone; recenzje w sklepach i zgłoszenia triażowane względem nich w zdefiniowanym czasie.
- [ ] **PMS-11** [ALL][M] Procedura badania z analizą przyczyn źródłowych dla reklamacji istotnych dla bezpieczeństwa, w tym odtworzenie na zgłoszonym urządzeniu/OS i przegląd logów audytowych.
- [ ] **PMS-12** [ALL][M] Decyzje o zgłoszeniu udokumentowane z uzasadnieniem także przy „nie podlega zgłoszeniu”; zegary zgłoszeń śledzone (UE 15/10/2 dni; USA 30/5 dni; 806 10 dni roboczych).
- [ ] **PMS-13** [ALL][M] Procedura działań w terenie (FSCA/wycofanie) dla oprogramowania: wymuszona aktualizacja, zdalne wyłączenie, FSN do użytkowników i klientów, powiadomienie organu, sprawdzenie skuteczności.
- [ ] **PMS-14** [ALL][M] Analiza trendów (MDR art. 88 i ISO 13485 §8.4) ze statystycznymi progami per typ awarii; raportowana w przeglądzie zarządzania.
- [ ] **PMS-15** [ALL][S] Obowiązki zgłaszania incydentów przez klientów (szpitale) i kontakty ujęte w umowach; wspólne procedury dla wspólnych incydentów.

## C. Okresowe raportowanie i przeglądy

- [ ] **PMS-20** [EU][M] Raport PMS (klasa I) lub **PSUR** (klasa IIa+) sporządzany zgodnie z harmonogramem z treścią wg zał. III; przedkładany jednostce notyfikowanej, gdy wymagane.
- [ ] **PMS-21** [ALL][M] Dokumentacja zarządzania ryzykiem, ocena kliniczna, dokumentacja użyteczności, model zagrożeń i SBOM przeglądane i aktualizowane w zaplanowanych odstępach i przy wyzwalaczach.
- [ ] **PMS-22** [ALL][M] Analiza ryzyka HIPAA i DPIA wg RODO przeglądane co roku i przy istotnej zmianie.
- [ ] **PMS-23** [ALL][M] Roczny przegląd zarządzania obejmuje PMS, reklamacje, CAPA, bezpieczeństwo, audyty, zmiany regulacyjne, działanie dostawców (w tym incydenty i zmiany Google).
- [ ] **PMS-24** [ALL][S] Raport przejrzystości dla klientów (uptime, podsumowanie bezpieczeństwa, zmiany), gdzie oczekują umowy lub rynki.

## D. Zarządzanie zmianą i starzeniem

- [ ] **PMS-30** [ALL][M] Wycofania OS i sklepów (minimalne SDK, poziomy API, zmiany łamiące Flutter, EOL Firebase SDK, EOL runtime Node) śledzone z datami; prace aktualizacyjne planowane przed terminami.
- [ ] **PMS-31** [ALL][M] Zmiany produktów Google (cennik, wycofania jak Dynamic Links, dostępność regionalna, warunki) przeglądane pod kątem wpływu regulacyjnego i na prywatność.
- [ ] **PMS-32** [ALL][M] Każda zmiana oceniana pod kątem istotności (powiadomienie jednostki, nowe 510(k), zmiana UDI-DI, aktualizacja DPIA, ponowna walidacja) z użyciem spisanego drzewa decyzyjnego.
- [ ] **PMS-33** [ALL][S] Plan końca życia produktu lub wersji: powiadomienie użytkowników, eksport/zwrot danych, usunięcie, retencja dokumentacji.

## E. Metryki warte raportowania

- [ ] **PMS-40** [ALL][S] Sesje i użytkownicy bez awarii per wersja i OS; czas wykrycia i czas naprawy incydentów; dotrzymanie SLA naprawy podatności; odsetek reklamacji na 1000 aktywnych użytkowników; pokrycie testami reguł; odsetek użytkowników na najnowszej wersji; liczba defektów dostępności; liczba defektów tłumaczeń.

## F. Dowody potrzebne w tej sekcji

Plan PMS, mapa kierowania informacji zwrotnych, dashboardy, logi triażu, zapisy badań i zgłoszeń, raporty trendów, raporty PSUR/PMS, zapisy przeglądów okresowych, tracker wycofań, decyzje o istotności zmian.
