# 17 · Komponenty AI i uczenia maszynowego

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Dotyczy modeli na urządzeniu (TensorFlow Lite / LiteRT, Core ML), modeli w chmurze w Cloud Functions lub Vertex AI oraz API LLM stron trzecich (Gemini, OpenAI, Anthropic, modele lokalne). Regulatorzy traktują model jak oprogramowanie z dodatkowymi obowiązkami: zarządzanie danymi, działanie w podgrupach, kontrola zmian i przejrzystość.

## A. Inwentarz i kwalifikacja

- [ ] **AI-01** [ALL][M] Każdy komponent AI/ML zinwentaryzowany: cel, typ (klasyfikator, regresja, generatywny/LLM, rekomendacja), wejścia, wyjścia, gdzie działa, dostawca, wersja, pochodzenie danych treningowych, przewidziani odbiorcy wyniku.
- [ ] **AI-02** [ALL][M] Dla każdego komponentu: czy tworzy lub zmienia funkcję wyrobu (plik 00)? Czy podlega **aktowi o AI** (wysokie ryzyko przez zał. I MDR; przejrzystość wg art. 50; obowiązki GPAI dostawcy, którego używasz)? Decyzja zapisana.
- [ ] **AI-03** [ALL][M] Wpływ na ścieżkę w USA: wytyczne FDA o funkcjach oprogramowania z AI (projekt 2025), **PCCP** (2024) dla planowanych aktualizacji modelu, analiza wyłączenia CDS dla wyjść LLM pokazywanych klinicystom.
- [ ] **AI-04** [ALL][M] Decyzja algorytm zablokowany vs adaptacyjny; modele adaptacyjne nie są dostarczane bez PCCP / planu zmian uzgodnionego z jednostką notyfikowaną.
- [ ] **AI-05** [ALL][S] ISO/IEC 42001 (system zarządzania AI) lub ISO/IEC 23894 (zarządzanie ryzykiem AI) jako ramy procesowe; BS 30440 jako ramy walidacji AI w zdrowiu.

## B. Zarządzanie danymi

- [ ] **AI-10** [ALL][M] Zbiory treningowe, walidacyjne i testowe udokumentowane (datasheets): źródło, zgoda/podstawa prawna, demografia, urządzenia akwizycji, proces etykietowania i zgodność między oceniającymi, wykluczenia, znane obciążenia.
- [ ] **AI-11** [ALL][M] Zbiór testowy niezależny od danych treningowych (brak wspólnych pacjentów), reprezentatywny dla przewidzianej populacji i warunków, zapieczętowany przed oceną końcową.
- [ ] **AI-12** [ALL][M] Podstawa prawna użycia danych pacjentów do treningu lub oceny modeli (RODO art. 9 + art. 89; deidentyfikacja lub upoważnienie HIPAA; zezwolenia z BAA); udokumentowana per zbiór.
- [ ] **AI-13** [ALL][M] Dane z aplikacji nie są używane do treningu bez udokumentowanego celu, podstawy, komunikatu i opt-out, gdzie wymagane; rezygnacje z treningu u dostawców potwierdzone umownie.
- [ ] **AI-14** [ALL][S] Monitorowanie dryfu danych porównuje rozkłady wejść produkcyjnych z treningowymi i alertuje przy przesunięciu.

## C. Rozwój i weryfikacja modelu

- [ ] **AI-15** [ALL][M] Wymagania modelu (cele działania, latencja, limity zasobów, zachowanie przy awarii) w SRS; wersja modelu jest elementem konfiguracji z sumą kontrolną.
- [ ] **AI-16** [ALL][M] Raport działania z przedziałami ufności na zapieczętowanym zbiorze testowym, ogółem i w podgrupach (płeć, wiek, odcień skóry, model urządzenia, ośrodek); metryki klinicznie istotne (czułość przy ustalonej swoistości, kalibracja, analiza krzywej decyzyjnej, gdzie dotyczy), nie tylko accuracy/AUC.
- [ ] **AI-17** [ALL][M] Testy odporności: szum, jakość obrazu, zmienność czujników, wykrywanie danych poza rozkładem, wejścia adwersarialne, gdzie dotyczy; zdefiniowane zachowanie dla wyjść o niskiej pewności (wstrzymanie, skierowanie).
- [ ] **AI-18** [ALL][M] Odtwarzalność: kod treningu, odniesienia do snapshotów danych, ziarna, środowisko i hiperparametry wersjonowane; model card publikowana wewnętrznie per wersja.
- [ ] **AI-19** [ALL][M] Konwersja modelu na urządzenie (kwantyzacja TFLite/Core ML) ponownie zweryfikowana względem modelu referencyjnego; różnice numeryczne ograniczone i testowane per klasa urządzeń.
- [ ] **AI-20** [ALL][S] Funkcje wyjaśnialności (mapy istotności, ważność cech, niepewność) zwalidowane pod kątem poprawności, nie tylko obecności.

## D. Specyfika AI generatywnej / LLM

- [ ] **AI-30** [ALL][M] Przypadek użycia ograniczony: co LLM może i czego nie może (streszczać, szkicować, triażować, odpowiadać na pytania medyczne); zakazane wyjścia i zachowanie odmowy określone i testowane.
- [ ] **AI-31** [ALL][M] Jeśli wyjście LLM wpływa na diagnozę lub leczenie, jest traktowane jako funkcja wyrobu z pełnymi dowodami z pliku 12; etykiety „tylko informacyjnie” nie zmieniają kwalifikacji, jeśli praktyczne użycie jest kliniczne.
- [ ] **AI-32** [ALL][M] Warunki dostawcy: BAA/DPA, region przetwarzania, zero retencji danych lub rezygnacja z logowania, brak treningu na wejściach, lista podprocesorów; **PHI nigdy nie jest wysyłane** do endpointów bez tych gwarancji.
- [ ] **AI-33** [ALL][M] Obrona przed **prompt injection i eksfiltracją danych**: izolacja promptu systemowego, listy dozwolonych narzędzi/funkcji, filtrowanie wyjść, brak sekretów i danych innych pacjentów w kontekście, retrieval ograniczony do uprawnionego pacjenta.
- [ ] **AI-34** [ALL][M] Kontrola halucynacji: grounding/retrieval z cytowaniami, wyjścia strukturalne walidowane schematami, przegląd przez człowieka dla treści klinicznych, zestaw ewaluacyjny z odpowiedziami ocenionymi przez klinicystów i próg dopuszczenia do wydania.
- [ ] **AI-35** [ALL][M] Przejrzystość: użytkownicy informowani, że rozmawiają z AI (akt o AI art. 50), co potrafi, czego nie, i jak dotrzeć do człowieka; treści generowane oznaczone.
- [ ] **AI-36** [ALL][M] Przypięcie modelu/wersji z ewaluacją regresyjną przed zmianą modelu dostawcy; wycofania u dostawcy śledzone jako wnioski o zmianę.
- [ ] **AI-37** [ALL][M] Eskalacja bezpieczeństwa: wykrywanie języka kryzysowego kieruje do wskazówek awaryjnych; retencja i dostęp do logów rozmów zdefiniowane.
- [ ] **AI-38** [ALL][S] Limity kosztów i częstości per użytkownik przeciw nadużyciom i denial-of-wallet.
- [ ] **AI-39** [ALL][S] Modele on-premise lub hostowane w UE rozważone tam, gdzie dane nie mogą opuścić jurysdykcji (DiGA, umowy szpitalne).

## E. Nadzór człowieka i użycie

- [ ] **AI-40** [ALL][M] Projekt nadzoru człowieka (akt o AI art. 14; zasady przejrzystości FDA): kto przegląda wyjścia, jak działa nadpisanie, jak ograniczany jest automation bias (np. pokazywanie niepewności, wymóg niezależnej oceny dla wyjść o dużym wpływie).
- [ ] **AI-41** [ALL][M] Instrukcja używania opisuje przewidzianą populację modelu, wejścia, działanie, ograniczenia, tryby awarii i politykę aktualizacji językiem zrozumiałym dla użytkownika.
- [ ] **AI-42** [ALL][M] Walidacja użyteczności obejmuje interpretację wyjść AI i prezentacji niepewności.

## F. Cykl życia, monitorowanie i kontrola zmian

- [ ] **AI-50** [ALL][M] Plan monitorowania działania w warunkach rzeczywistych: metryki, próbkowanie, metoda zbierania ground truth, częstość, progi, działania; przejrzany pod kątem prywatności.
- [ ] **AI-51** [ALL][M] Aktualizacje modelu przechodzą kontrolę zmian; granice PCCP (co może się zmienić bez nowego zgłoszenia) respektowane; jednostka notyfikowana informowana wg umowy.
- [ ] **AI-52** [ALL][M] Cofnięcie do poprzedniej wersji modelu przetestowane; model serwowany z wersjonowanego magazynu z kontrolą dostępu.
- [ ] **AI-53** [ALL][M] Rejestrowanie (akt o AI art. 12): wejścia/wyjścia lub wystarczające metadane do odtworzenia decyzji, przechowywane wg polityki, bez stawania się niezgodnym z prawem magazynem PHI.
- [ ] **AI-54** [ALL][S] Przegląd obciążeń i sprawiedliwości powtarzany na danych rzeczywistych w zaplanowanych odstępach.

## G. Dowody potrzebne w tej sekcji

Inwentarz AI i notatka kwalifikacyjna, datasheets, raporty działania i podgrup, model cards, testy odporności, zestaw ewaluacyjny LLM i wyniki, umowy z dostawcami, raport testów prompt injection, projekt nadzoru człowieka, plan monitorowania, PCCP (jeśli jest), dokumentacja techniczna wg aktu o AI (jeśli wysokie ryzyko).
