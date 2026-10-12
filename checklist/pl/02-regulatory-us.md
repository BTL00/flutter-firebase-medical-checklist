# 02 · Wymagania regulacyjne USA (FDA)

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Ma zastosowanie, gdy co najmniej jedna funkcja oprogramowania jest funkcją wyrobu (zob. 00). HIPAA, FTC i stanowe przepisy o prywatności są w pliku 04.

## A. System jakości

- [ ] **US-01** [US][M] **QMSR** (21 CFR część 820 po zmianach, obowiązuje od 2 lutego 2026) wdrożone: ISO 13485:2016 włączona przez odniesienie plus wymagania specyficzne FDA (zapisy, kontrola oznakowania i opakowań, odniesienia do 21 CFR 830, 803, 806, 821).
- [ ] **US-02** [US][M] Kontrola projektowania / zapisy projektowania i rozwoju istnieją dla oprogramowania (dane wejściowe, wyjściowe, przegląd, weryfikacja, walidacja, transfer, zmiany, historia projektowania).
- [ ] **US-03** [US][M] Odpowiednik Medical Device File / Device Master Record wymienia dokładną konfigurację buildu (wersja Flutter, hash lockfile zależności, ID projektów Firebase, rewizje Cloud Functions).
- [ ] **US-04** [US][M] Procedury obsługi reklamacji, CAPA, przeglądu zarządzania i audytu wewnętrznego istnieją i są wykonywane przed pierwszym wydaniem.
- [ ] **US-05** [US][M] Nadzór nad dostawcami obejmuje Google (Firebase/GCP), sklepy Apple i Google, dostawców SDK, programistów kontraktowych; istnieją zapisy z oceny dostawców.

## B. Ścieżka przedrynkowa i treść zgłoszenia

- [ ] **US-10** [US][M] Ścieżka wybrana (510(k), De Novo, PMA, zwolnienie) i udokumentowana z regulacją klasyfikacyjną i product code.
- [ ] **US-11** [US][M] Dokumentacja oprogramowania wg **„Content of Premarket Submissions for Device Software Functions” (czerwiec 2023)**: ocena poziomu dokumentacji, opis oprogramowania, dokumentacja zarządzania ryzykiem, specyfikacja wymagań, diagram architektury systemu i oprogramowania, specyfikacja projektu (Enhanced), praktyki rozwoju i utrzymania, testy (jednostkowe, integracyjne, systemowe), historia wersji, lista nierozwiązanych anomalii.
- [ ] **US-12** [US][M] Dokumentacja cyberbezpieczeństwa wg **„Cybersecurity in Medical Devices: Quality System Considerations and Content of Premarket Submissions”** (wersja ostateczna wrzesień 2023, aktualizacja czerwiec 2025): raport zarządzania ryzykiem bezpieczeństwa, model zagrożeń, ocena ryzyka cyberbezpieczeństwa, SBOM, widoki architektury bezpieczeństwa, testy bezpieczeństwa, oznakowanie, plan zarządzania podatnościami.
- [ ] **US-13** [US][M] Obowiązki z **§524B FD&C Act** (cyber devices) spełnione: plan monitorowania, identyfikacji i usuwania podatności po wprowadzeniu do obrotu, w tym skoordynowane ujawnianie podatności; procesy dające racjonalną pewność cyberbezpieczeństwa wyrobu i powiązanych systemów; aktualizacje i poprawki porynkowe; SBOM komponentów komercyjnych, open source i gotowych.
- [ ] **US-14** [US][M] Zastosowano wytyczne **Off-The-Shelf Software**: każdy pakiet pub.dev, Firebase SDK, system operacyjny i przeglądarka to oprogramowanie OTS z udokumentowaną analizą zagrożeń i planem utrzymania.
- [ ] **US-15** [US][M] Dokumentacja czynników ludzkich / inżynierii użyteczności wg FDA „Applying Human Factors and Usability Engineering to Medical Devices” (2016) i IEC 62366-1; walidacja sumatywna z przewidzianymi grupami użytkowników.
- [ ] **US-16** [US][M] Oznakowanie wg 21 CFR część 801 (w tym oświadczenie o wyrobie na receptę wg 801.109, jeśli Rx) z przewidzianym zastosowaniem, instrukcjami, ostrzeżeniami, wersją oprogramowania, informacjami o cyberbezpieczeństwie dla użytkowników.
- [ ] **US-17** [US][S] **Pre-Submission** użyte do uzgodnienia predykatu, testów i poziomu dokumentacji dla wszystkiego, co nowatorskie.
- [ ] **US-18** [US][S] Zadeklarowano uznane normy konsensusowe (IEC 62304, ISO 14971, IEC 62366-1, IEC 81001-5-1, AAMI TIR57, ANSI/AAMI SW96, UL 2900-2-1) i wypełniono deklaracje zgodności.
- [ ] **US-19** [US][M] Dla funkcji AI/ML: rozważono **Predetermined Change Control Plan** (PCCP, wytyczne ostateczne grudzień 2024); zastosowano „AI-Enabled Device Software Functions: Lifecycle Management and Marketing Submission Recommendations” (projekt styczeń 2025); zmapowano zasady Good Machine Learning Practice.

## C. Rejestracja, listing, UDI

- [ ] **US-20** [US][M] Rejestracja zakładu i listing wyrobu (21 CFR część 807) przed wprowadzeniem na rynek; roczna opłata rejestracyjna uiszczona; producenci zagraniczni mają **US Agent**.
- [ ] **US-21** [US][M] UDI wg 21 CFR część 830: UDI oprogramowania wyświetlane przy uruchomieniu lub w dostępnym menu (21 CFR 801.50), zgłoszenie do GUDID, nowy identyfikator wyrobu, gdy nowa wersja zmienia działanie, bezpieczeństwo lub przewidziane zastosowanie.
- [ ] **US-22** [US][S] Konta labelera i GS1/HIBCC/ICCBBA założone; polityka zmian UDI spójna z tą dla UE.

## D. Obowiązki porynkowe

- [ ] **US-30** [US][M] **Medical Device Reporting** (21 CFR część 803): raporty 30-dniowe dla zgonów, poważnych urazów i awarii; raporty 5-dniowe, gdy potrzebne jest działanie naprawcze zapobiegające nieuzasadnionemu ryzyku; konto eMDR założone.
- [ ] **US-31** [US][M] **Corrections and removals** (21 CFR część 806): poprawki oprogramowania zmniejszające ryzyko zdrowotne są zgłaszane w 10 dni roboczych, chyba że zwolnione; zapisy prowadzone dla niezgłaszanych.
- [ ] **US-32** [US][M] Procedura wycofania (21 CFR część 7) dostosowana do oprogramowania: wymuszona aktualizacja, zdalne wyłączenie, usunięcie ze sklepu, powiadomienie użytkowników.
- [ ] **US-33** [US][M] Cyberbezpieczeństwo porynkowe wg wytycznych z 2016 i §524B: przyjmowanie podatności, ocena ryzyka (kontrolowane vs niekontrolowane), cele 30/60 dni na komunikację i naprawę dla ryzyka niekontrolowanego, rozważony udział w ISAO.
- [ ] **US-34** [US][M] Dokumentacja reklamacji (ISO 13485 §8.2.2) obejmuje recenzje w sklepach i zgłoszenia do wsparcia, które sugerują awarię.
- [ ] **US-35** [US][S] Plan monitorowania działania w warunkach rzeczywistych dla funkcji AI (część PCCP lub planu cyklu życia).

## E. Zapisy i podpisy elektroniczne

- [ ] **US-40** [US][M] Ocena zakresu **21 CFR część 11**: które zapisy (historia projektowania, szkolenia, reklamacje, podpisy elektroniczne w narzędziach QMS) są zapisami wg części 11; ślady audytowe, walidacja, kontrola dostępu i manifestacje podpisu w tych narzędziach.
- [ ] **US-41** [US][S] Jeśli aplikacja zbiera dane z badań klinicznych (eCOA/ePRO): zgodność ścieżki danych z częścią 11 i ICH E6(R3), w tym logowanie audytowe Firestore i stemple czasu.

## F. Inne federalne punkty styku w USA

- [ ] **US-50** [US][S] Przepisy **ONC**: jeśli aplikacja przechowuje lub wymienia Electronic Health Information dla świadczeniodawców, oceniono zasady information blocking (45 CFR część 171) i kryteria certyfikacji (HTI-1/HTI-2); użyto profili FHIR USCDI/US Core.
- [ ] **US-51** [US][S] **Section 508 / ADA**: WCAG 2.1 AA (lepiej 2.2) przy sprzedaży do programów federalnych lub finansowanych federalnie; reguła DOJ Title II dla aplikacji webowych i mobilnych administracji stanowej i lokalnej (terminy 2026/2027).
- [ ] **US-52** [US][N] Kody **CPT/HCPCS** dla zdalnego monitorowania pacjenta (99453–99458, 99091) i zdalnego monitorowania terapeutycznego (98975–98981) rozumiane, jeśli model biznesowy opiera się na refundacji; wymagania dotyczące danych (np. 16 dni odczytów) wbudowane w aplikację.
- [ ] **US-53** [US][N] Przepisy **DEA / stanowych izb farmaceutycznych**, jeśli aplikacja wspiera przepisywanie leków lub substancje kontrolowane.
- [ ] **US-54** [US][N] Stanowe przepisy o telezdrowiu i wykonywaniu zawodu lekarza, jeśli klinicyści używają aplikacji do opieki ponad granicami stanów.

## G. Dowody potrzebne w tej sekcji

Notatka o ścieżce, informacje zwrotne z Pre-Sub, pakiet eSTAR lub uzasadnienie zwolnienia, plan cyberbezpieczeństwa wg §524B, SBOM, potwierdzenie rejestracji i listingu, rekord GUDID, procedury MDR/806, ocena wg części 11.
