# 00 · Zakres, przewidziane zastosowanie i kwalifikacja

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Wszystko dalej zależy od trzech odpowiedzi: do czego służy aplikacja, czy przez to jest wyrobem medycznym na każdym z rynków i jak duże jest ryzyko. Spisz je i podpisz, zanim dotkniesz pierwszej reguły Firestore.

Legenda: `[EU]` `[US]` `[ALL]` zakres rynkowy · `[M]` wymagane · `[S]` zalecane · `[N]` dobrze mieć.

## A. Przewidziane zastosowanie (intended use / intended purpose)

- [ ] **QUAL-01** [ALL][M] Istnieje jednostronicowe **oświadczenie o przewidzianym zastosowaniu**, wersjonowane i podpisane przez kierownictwo. Podaje cel medyczny, wskazania, docelową populację pacjentów, przewidzianych użytkowników (pacjent, opiekun, klinicysta), środowisko użycia (dom, przychodnia, karetka), platformy (iOS, Android, web) i wyraźnie wymienia, czego oprogramowanie **nie** robi. (MDR art. 2 pkt 12; 21 CFR 801.4) → szablon: `templates/intended-use-statement.md`
- [ ] **QUAL-02** [ALL][M] Każde publiczne twierdzenie (strona, opis w sklepie, pitch deck, media społecznościowe, materiały dla inwestorów, teksty w aplikacji) zostało przejrzane pod kątem zgodności z oświadczeniem o przewidzianym zastosowaniu. Twierdzenia decydują o kwalifikacji i klasyfikacji na obu rynkach.
- [ ] **QUAL-03** [ALL][M] Aplikacja jest rozłożona na **funkcje / moduły oprogramowania** i każdy jest oceniany osobno (FDA reguluje na poziomie funkcji; MDCG 2019-11 §3.3 pozwala kwalifikować moduły).
- [ ] **QUAL-04** [ALL][M] Dla każdej funkcji: funkcja wyrobu czy funkcja niebędąca wyrobem (wellness, administracyjna, sama komunikacja). Pisemne uzasadnienie dla każdej funkcji.
- [ ] **QUAL-05** [ALL][M] Minimalne kwalifikacje przewidzianych użytkowników są określone (laik vs klinicysta z uprawnieniami). To zmienia wymagania użyteczności, oznakowanie i analizę CDS.
- [ ] **QUAL-06** [ALL][S] Przeciwwskazania, ostrzeżenia i ograniczenia (np. „nie do użytku w nagłych wypadkach”, „nie dla dzieci”, zakres wieku) są spisane i odzwierciedlone w UI oraz w opisie w sklepie.
- [ ] **QUAL-07** [ALL][S] Diagram przepływu klinicznego pokazuje, gdzie aplikacja się mieści: kto działa na podstawie jej wyniku, z jakim opóźnieniem i co się dzieje, gdy aplikacja jest niedostępna.

## B. Kwalifikacja i klasyfikacja w UE (MDR 2017/745 · IVDR 2017/746)

- [ ] **QUAL-10** [EU][M] Kroki decyzyjne MDCG 2019-11 przeszłe i udokumentowane: czy to oprogramowanie; czy to wyposażenie; czy robi więcej niż przechowywanie, archiwizacja, komunikacja, proste wyszukiwanie lub kompresja bezstratna; czy działanie jest na korzyść pojedynczych pacjentów; czy ma cel medyczny wg art. 2 pkt 1?
- [ ] **QUAL-11** [EU][M] Jeśli aplikacja przetwarza dane diagnostyki in vitro (wyniki laboratoryjne, testy domowe), oceniono również ścieżkę kwalifikacji wg IVDR.
- [ ] **QUAL-12** [EU][M] Klasyfikacja wg **reguły 11 załącznika VIII** zapisana z uzasadnieniem: domyślnie klasa IIa dla wspomagania decyzji/monitorowania, IIb jeśli decyzje mogą spowodować poważne pogorszenie stanu zdrowia lub interwencję chirurgiczną, III jeśli śmierć lub nieodwracalne pogorszenie; IIb dla monitorowania parametrów życiowych, których zmiany mogą stanowić bezpośrednie zagrożenie; klasa I tylko dla oprogramowania, które nie pasuje do żadnego z powyższych.
- [ ] **QUAL-13** [EU][M] Sprawdzono zasady wdrażania: oprogramowanie sterujące wyrobem lub wpływające na jego używanie ma klasę tego wyrobu (zał. VIII pkt 3.3); gdy stosuje się kilka reguł, obowiązuje najwyższa klasa (pkt 3.5).
- [ ] **QUAL-14** [EU][S] MDCG 2021-24 (wytyczne klasyfikacji) i MDCG 2023-4 (MDSW na platformach sprzętowych, np. smartwatche i czujniki telefonu) uwzględnione, gdy aplikacja czyta czujniki telefonu lub urządzeń noszonych.
- [ ] **QUAL-15** [EU][M] Jeśli klasa I: rozumiane jest, że samodeklaracja nadal wymaga pełnej dokumentacji technicznej, systemu zarządzania jakością, nadzoru po wprowadzeniu do obrotu, rejestracji w EUDAMED i osoby odpowiedzialnej za zgodność regulacyjną (PRRC).
- [ ] **QUAL-16** [EU][M] Jeśli klasa IIa lub wyższa: wskazano jednostkę notyfikowaną wyznaczoną do oprogramowania wg MDR i zabudżetowano jej czas realizacji (zwykle 12 do 18 miesięcy).
- [ ] **QUAL-17** [EU][S] Przypadki graniczne (wellness vs medyczne) udokumentowane z użyciem Manual on Borderline and Classification; gdy nadal niejasne, skonsultowano organ właściwy.

## C. Kwalifikacja w USA (FD&C Act §201(h), §520(o), wytyczne FDA)

- [ ] **QUAL-20** [US][M] Każda funkcja oceniona względem **wyłączeń oprogramowania z §520(o)** (21st Century Cures Act): wsparcie administracyjne, ogólny wellness, elektroniczna dokumentacja pacjenta, systemy danych z wyrobów medycznych (przesyłanie/przechowywanie/wyświetlanie) oraz wspomaganie decyzji klinicznych spełniające wszystkie cztery kryteria.
- [ ] **QUAL-21** [US][M] Zastosowano wytyczne **General Wellness**: niskie ryzyko, wyłącznie twierdzenia wellness; odniesienia do chorób tylko w formie „może pomóc zmniejszyć ryzyko” lub „może pomóc żyć dobrze z” dla stanów o dobrze poznanym związku ze stylem życia. Używaj aktualnego wydania wytycznych (zmienionych w 2026).
- [ ] **QUAL-22** [US][M] Test czterech kryteriów z wytycznych **Clinical Decision Support** zastosowany dla każdej funkcji: (1) nie pozyskuje/przetwarza/analizuje obrazów medycznych, sygnałów IVD ani wzorców z systemów akwizycji sygnału; (2) wyświetla/analizuje informacje medyczne; (3) wspiera rekomendację dla pracownika ochrony zdrowia, nie dla pacjenta; (4) pracownik ochrony zdrowia może niezależnie ocenić podstawę. Używaj aktualnego wydania (zmienionego w 2026).
- [ ] **QUAL-23** [US][M] Sprawdzono **Policy for Device Software Functions and Mobile Medical Applications** pod kątem kategorii objętych enforcement discretion (samodzielne zarządzanie chorobą bez konkretnych sugestii leczenia, śledzenie/organizacja informacji zdrowotnych, proste kalkulatory ogólnego użytku, komunikacja pacjent–lekarz).
- [ ] **QUAL-24** [US][M] Zidentyfikowano product code, regulację klasyfikacyjną (21 CFR części 862–892) i ścieżkę regulacyjną (zwolnienie, 510(k), De Novo, PMA); dla 510(k) znaleziono predykaty w bazie 510(k).
- [ ] **QUAL-25** [US][M] Ustalono **Documentation Level** wg „Content of Premarket Submissions for Device Software Functions” (2023): Basic lub Enhanced (Enhanced, gdy awaria może stwarzać prawdopodobne ryzyko śmierci lub poważnego urazu, produkt złożony, klasa III lub oprogramowanie dla banków krwi).
- [ ] **QUAL-26** [US][S] Spotkanie Pre-Submission (Q-Submission) z FDA zaplanowane dla każdej nowatorskiej funkcji, komponentu AI lub niejasnej ścieżki.
- [ ] **QUAL-27** [US][S] Oceniono, czy aplikacja jest **„cyber device”** wg FD&C §524B (oprogramowanie + łączność z internetem + możliwość podatności → dla aplikacji na Firebase niemal zawsze tak).

## D. Klasa bezpieczeństwa oprogramowania (IEC 62304)

- [ ] **QUAL-30** [ALL][M] Klasa bezpieczeństwa IEC 62304 (A, B lub C) przypisana systemowi oprogramowania na podstawie analizy ryzyka, przy założeniu awarii oprogramowania i przed zewnętrznymi środkami kontroli ryzyka; uzasadnienie zapisane.
- [ ] **QUAL-31** [ALL][S] Architektura oprogramowania segreguje elementy tak, by elementom o niższym ryzyku można było przypisać niższą klasę; uzasadnienie i skuteczność segregacji udokumentowane (62304 §4.3, §5.3.5).
- [ ] **QUAL-32** [ALL][M] Klasa jest stosowana spójnie do klienta Flutter, Cloud Functions, reguł Firestore i narzędzi administracyjnych. Reguły Firestore i Cloud Functions to też elementy oprogramowania.
- [ ] **QUAL-33** [ALL][S] IEC 82304-1 (bezpieczeństwo produktów health software) zastosowana do całego produktu, łącznie z częściami, które nie są „oprogramowaniem wyrobu”, ale są w tej samej aplikacji.

## E. Inne jurysdykcje (jeśli tam sprzedajesz)

- [ ] **QUAL-40** [ALL][S] Wielka Brytania: UKCA wg UK MDR 2002, rejestracja w MHRA, UK Responsible Person; NHS DTAC i DCB0129 przy sprzedaży do NHS.
- [ ] **QUAL-41** [ALL][S] Szwajcaria: MedDO/ODim, szwajcarski upoważniony przedstawiciel (CH-REP).
- [ ] **QUAL-42** [ALL][N] Kanada (wytyczne SaMD, MDEL/MDL), Australia (reguły TGA dla oprogramowania), Japonia (PMDA) odnotowane jako przyszłe bramki.

## F. Wyniki tej sekcji

- [ ] **QUAL-50** [ALL][M] **Dokument strategii regulacyjnej** wskazuje rynki docelowe, kwalifikację każdej funkcji, klasę na każdym rynku, ścieżkę, listę norm, interakcje z jednostką notyfikowaną / FDA, harmonogram i budżet.
- [ ] **QUAL-51** [ALL][M] Decyzja „to nie jest wyrób medyczny” (jeśli podjęta) jest udokumentowana z taką samą starannością jak decyzja pozytywna, datowana i ponownie wyzwalana przy każdej zmianie twierdzeń lub funkcji.
- [ ] **QUAL-52** [ALL][M] Zmiana przewidzianego zastosowania, populacji docelowej lub twierdzeń jest formalnym wnioskiem o zmianę, który otwiera tę sekcję na nowo.
