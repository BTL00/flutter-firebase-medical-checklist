# 18 · Dokumenty do dostarczenia

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Dokumenty, których oczekuje audytor, jednostka notyfikowana lub recenzent FDA, z normą lub przepisem, który każdy z nich spełnia. Odhacz dokument tylko wtedy, gdy istnieje, jest zatwierdzony, ma właściwą wersję i da się go powiązać z wydanym buildem.

## A. Regulacyjne i jakościowe

- [ ] **DOC-01** [ALL][M] Strategia regulacyjna i uzasadnienie kwalifikacji/klasyfikacji (MDCG 2019-11; analiza FDA §520(o))
- [ ] **DOC-02** [ALL][M] Oświadczenie o przewidzianym zastosowaniu
- [ ] **DOC-03** [ALL][M] Księga jakości, mapa procesów, indeks procedur (ISO 13485 / QMSR)
- [ ] **DOC-04** [EU][M] Lista kontrolna GSPR (MDR zał. I)
- [ ] **DOC-05** [EU][M] Dokumentacja techniczna wg zał. II i III, deklaracja zgodności UE, certyfikaty jednostki notyfikowanej
- [ ] **DOC-06** [US][M] Zgłoszenie przedrynkowe (510(k)/De Novo/PMA) lub uzasadnienie zwolnienia; zapisy rejestracji i listingu
- [ ] **DOC-07** [ALL][M] Zapisy UDI (Basic UDI-DI, polityka UDI-DI/PI, zgłoszenia do GUDID/EUDAMED)
- [ ] **DOC-08** [ALL][M] Zestaw oznakowania: treść etykiety, instrukcja używania (wszystkie języki), zapisy hostingu eIFU, opisy w sklepach jako kopie nadzorowane
- [ ] **DOC-09** [ALL][M] Lista norm z wydaniami i deklaracjami zgodności

## B. Cykl życia oprogramowania (IEC 62304)

- [ ] **DOC-10** [ALL][M] Plan rozwoju oprogramowania (w tym mapowanie agile)
- [ ] **DOC-11** [ALL][M] Specyfikacja wymagań oprogramowania
- [ ] **DOC-12** [ALL][M] Dokument architektury oprogramowania (w tym usługi Firebase, przepływy danych, segregacja, wymagania SOUP)
- [ ] **DOC-13** [ALL][M] Projekt szczegółowy elementów klasy C (i wg potrzeb dla B)
- [ ] **DOC-14** [ALL][M] Zapisy weryfikacji jednostek (raporty CI, zapisy przeglądów)
- [ ] **DOC-15** [ALL][M] Plany, specyfikacje i raporty testów integracyjnych i systemowych
- [ ] **DOC-16** [ALL][M] Zapis wydania oprogramowania (wersja, hash buildu, baza konfiguracji, znane anomalie, zatwierdzenia)
- [ ] **DOC-17** [ALL][M] Plan utrzymania oprogramowania
- [ ] **DOC-18** [ALL][M] Plan zarządzania konfiguracją i baza per wydanie
- [ ] **DOC-19** [ALL][M] Rejestr SOUP z oceną anomalii → `templates/soup-register.md`
- [ ] **DOC-20** [ALL][M] Log raportów problemów i raporty trendów
- [ ] **DOC-21** [ALL][M] Macierz śledzalności → `templates/traceability-matrix.md`
- [ ] **DOC-22** [ALL][M] Historia wersji oprogramowania i lista nierozwiązanych anomalii (FDA)

## C. Ryzyko, użyteczność, klinika

- [ ] **DOC-30** [ALL][M] Plan zarządzania ryzykiem, analiza ryzyka (log zagrożeń), weryfikacja środków kontroli, raport zarządzania ryzykiem (ISO 14971) → `templates/risk-register.md`
- [ ] **DOC-31** [ALL][M] Dokumentacja inżynierii użyteczności: specyfikacja użycia, specyfikacja UI, plany ocen, raporty formatywne i sumatywne (IEC 62366-1)
- [ ] **DOC-32** [ALL][M] Plan i raport oceny klinicznej (MDR) / dowody działania klinicznego (FDA); plan i raporty PMCF
- [ ] **DOC-33** [ALL][M] Specyfikacje algorytmów i referencyjne zestawy testowe
- [ ] **DOC-34** [ALL][S] Clinical safety case i podpisany log zagrożeń

## D. Cyberbezpieczeństwo

- [ ] **DOC-40** [ALL][M] Plan zarządzania bezpieczeństwem / opis SPDF (IEC 81001-5-1)
- [ ] **DOC-41** [ALL][M] Model zagrożeń i ocena ryzyka bezpieczeństwa (AAMI TIR57)
- [ ] **DOC-42** [ALL][M] Widoki architektury bezpieczeństwa (FDA)
- [ ] **DOC-43** [ALL][M] SBOM per wydanie ze statusem wsparcia/EOL
- [ ] **DOC-44** [ALL][M] Raporty testów bezpieczeństwa: SAST, testy reguł, MASVS, test penetracyjny, dowody naprawy
- [ ] **DOC-45** [ALL][M] Plan zarządzania podatnościami i polityka CVD; log podatności
- [ ] **DOC-46** [ALL][M] Plan reagowania na incydenty i zapisy ćwiczeń
- [ ] **DOC-47** [ALL][M] Treść oznakowania bezpieczeństwa i dokumentacja bezpieczeństwa dla klientów (MDS2 dla szpitali w USA)

## E. Prywatność

- [ ] **DOC-50** [EU][M] Rejestr czynności przetwarzania (RODO art. 30)
- [ ] **DOC-51** [EU][M] Ocena skutków dla ochrony danych → `templates/dpia-outline.md`
- [ ] **DOC-52** [ALL][M] Polityki prywatności (wszystkie języki, wersjonowane), treści zgód i schemat logu zgód
- [ ] **DOC-53** [ALL][M] Rejestr podmiotów przetwarzających/podprocesorów z umowami (art. 28, BAA) i mechanizmami transferu → `templates/third-party-sdk-register.md`
- [ ] **DOC-54** [US][M] Analiza ryzyka HIPAA, plan zarządzania ryzykiem, polityki i procedury, zapisy szkoleń
- [ ] **DOC-55** [ALL][M] Rejestr naruszeń/incydentów i szablony powiadomień (RODO, HIPAA, FTC HBNR, stanowe)
- [ ] **DOC-56** [ALL][M] Inwentarz danych, klasyfikacja, harmonogram retencji, procedura usuwania z dowodami testów
- [ ] **DOC-57** [ALL][M] Inwentarz usług Firebase z regionami, kategoriami danych i pokryciem umownym → `templates/firebase-service-inventory.md`

## F. Operacje i porynkowe

- [ ] **DOC-60** [ALL][M] Plan PMS; raport PMS lub PSUR; procedura vigilance i zgłoszenia
- [ ] **DOC-61** [ALL][M] Procedura obsługi reklamacji i zapisy; zapisy CAPA
- [ ] **DOC-62** [ALL][M] Procedura wydań i zapisy wydań; kopie deklaracji w sklepach
- [ ] **DOC-63** [ALL][M] Runbooki, grafik dyżurów, zapisy ćwiczeń kopii/odtwarzania
- [ ] **DOC-64** [ALL][M] Polityka kontroli dostępu, zapisy przeglądów dostępu, listy kontrolne JML
- [ ] **DOC-65** [ALL][M] Macierz i zapisy szkoleń (jakość, bezpieczeństwo, prywatność, kompetencje AI)
- [ ] **DOC-66** [ALL][M] Zapisy oceny dostawców (Google, Apple, dostawcy SDK, kontraktorzy)
- [ ] **DOC-67** [ALL][M] Protokoły przeglądu zarządzania; raporty audytów wewnętrznych
- [ ] **DOC-68** [ALL][S] Zapisy walidacji narzędzi / computer software assurance

## G. AI (jeśli dotyczy)

- [ ] **DOC-70** [ALL][M] Inwentarz AI i notatka kwalifikacyjna; datasheets; model cards; raporty działania i podgrup; plan monitorowania; PCCP; dokumentacja techniczna wg zał. IV aktu o AI, gdy wysokie ryzyko

## H. Higiena dokumentów

- [ ] **DOC-80** [ALL][M] Każdy dokument ma właściciela, wersję, zatwierdzenie, datę obowiązywania i okres przeglądu; wersje zastąpione zachowane.
- [ ] **DOC-81** [ALL][M] Dokumenty odwołują się do dokładnych wersji oprogramowania, które obejmują; istnieje indeks wydanie → dokumentacja.
- [ ] **DOC-82** [ALL][S] Dokumenty napisane tak, by zewnętrzny audytor mógł je śledzić bez autora; skróty rozwinięte przy pierwszym użyciu; diagramy mają legendy.
