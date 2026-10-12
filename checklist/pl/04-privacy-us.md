# 04 · Prywatność: HIPAA, FTC i prawo stanowe USA

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Zależnie od tego, kto jest klientem, obowiązują dwa bardzo różne reżimy: HIPAA, gdy pracujesz dla covered entity, oraz FTC i stanowe prawo o danych zdrowotnych konsumentów, gdy sprzedajesz bezpośrednio konsumentom. Wiele aplikacji podlega obu.

## A. Który reżim ma zastosowanie

- [ ] **USP-01** [US][M] Dla każdego segmentu klientów ustalono, czy jesteś **business associate wg HIPAA** (działasz na rzecz covered entity: świadczeniodawca, ubezpieczyciel, clearinghouse), czy aplikacją konsumencką poza HIPAA.
- [ ] **USP-02** [US][M] Jeśli poza HIPAA: oceniono stosowalność **FTC Health Breach Notification Rule** (16 CFR część 318, zmieniona reguła obowiązuje od lipca 2024); większość aplikacji zdrowotnych pobierających dane z wielu źródeł to „vendors of personal health records”.
- [ ] **USP-03** [US][M] **FTC Act §5** (nieuczciwe lub wprowadzające w błąd praktyki): polityka prywatności i komunikaty w aplikacji zgadzają się z rzeczywistymi przepływami, zachowaniem SDK i retencją; przejrzano niedawne sprawy FTC dotyczące aplikacji zdrowotnych (GoodRx, BetterHelp, Premom, Flo).
- [ ] **USP-04** [US][M] **COPPA** (dzieci poniżej 13 lat) oceniona; weryfikowalna zgoda rodzicielska, jeśli w zakresie; brak reklam behawioralnych dla dzieci.
- [ ] **USP-05** [US][M] **42 CFR część 2** oceniona, jeśli obsługiwane są rekordy dotyczące uzależnień z programów Part 2 (reguła ostateczna z 2024 zbliża zgody do HIPAA, ale zachowuje dodatkowe ograniczenia).

## B. HIPAA Privacy Rule (45 CFR część 164 podczęść E)

- [ ] **HIP-01** [US][M] **Business Associate Agreement** podpisana z każdym klientem będącym covered entity przed przepływem PHI; Twój szablon BAA przejrzany przez prawnika.
- [ ] **HIP-02** [US][M] **BAA z Google Cloud** zawarta w Cloud Console dla organizacji/projektów przechowujących PHI; z PHI używane są tylko produkty Firebase/GCP z listy Google „HIPAA Included Functionality”.
- [ ] **HIP-03** [US][M] Produkty **spoza** listy Google nigdy nie otrzymują PHI, także w wolnym tekście, kluczach niestandardowych czy właściwościach użytkownika: Google Analytics for Firebase, Crashlytics, Performance Monitoring, Remote Config, A/B Testing, In-App Messaging. Sprawdź aktualną listę; zmienia się.
- [ ] **HIP-04** [US][M] Dalsi sub-business-associates (bramka SMS, dostawca e-mail, system wsparcia, API LLM, transkrypcja) mają BAA albo nie otrzymują PHI.
- [ ] **HIP-05** [US][M] Standard **minimum necessary** zastosowany do dostępu opartego na rolach: klinicyści widzą przypisanych pacjentów; wsparcie widzi widoki pseudonimizowane.
- [ ] **HIP-06** [US][M] Użycie i ujawnianie ograniczone do tego, co pozwala BAA; brak deidentyfikacji na własne cele, chyba że BAA na to pozwala i spełnia §164.514 (Safe Harbor 18 identyfikatorów lub Expert Determination).
- [ ] **HIP-07** [US][M] Prawa pacjenta wspierane dla covered entity: dostęp (w 30 dni, kopia elektroniczna), poprawka, rozliczenie ujawnień; Twój log audytowy potrafi wygenerować rozliczenie.
- [ ] **HIP-08** [US][S] Notice of Privacy Practices należy do covered entity; Twoja polityka prywatności dla funkcji konsumenckich jest osobna i nie twierdzi, że podlega HIPAA tam, gdzie nie podlega.
- [ ] **HIP-09** [US][S] Zakazy marketingu i sprzedaży PHI rozumiane; brak PHI w pikselach reklamowych, brak śledzenia stron trzecich na stronach po zalogowaniu (biuletyn HHS o technologiach śledzących, w zakresie zmienionym orzecznictwem).

## C. HIPAA Security Rule (45 CFR 164.308, .310, .312, .316)

- [ ] **HIP-20** [US][M] **Analiza ryzyka** (§164.308(a)(1)(ii)(A)) udokumentowana, obejmująca całą organizację, w tym Firebase, Cloud Functions, narzędzia administracyjne, laptopy i CI; aktualizowana co roku i przy dużych zmianach; użyto narzędzia HHS Security Risk Assessment lub NIST SP 800-66 r2.
- [ ] **HIP-21** [US][M] **Plan zarządzania ryzykiem** z właścicielami i terminami dla każdego ryzyka.
- [ ] **HIP-22** [US][M] Wskazani **Security Official** i **Privacy Official**.
- [ ] **HIP-23** [US][M] Bezpieczeństwo personelu: autoryzacja, weryfikacja, procedury zakończenia współpracy; dostęp do Google Cloud IAM i konsoli Firebase odbierany w dniu odejścia.
- [ ] **HIP-24** [US][M] Zarządzanie dostępem do informacji: polityka dostępu opartego na rolach mapuje się na reguły Firestore, custom claims i role IAM.
- [ ] **HIP-25** [US][M] Szkolenia ze świadomości bezpieczeństwa z zapisami; phishing, malware, monitorowanie logowań, zarządzanie hasłami.
- [ ] **HIP-26** [US][M] **Procedury incydentów bezpieczeństwa**: wykrywanie, reakcja, łagodzenie, dokumentowanie; zintegrowane z powiadomieniami o incydentach Google Cloud.
- [ ] **HIP-27** [US][M] **Plan ciągłości**: plan kopii zapasowych, plan odtwarzania po awarii, tryb awaryjny, testowanie i rewizja, analiza krytyczności; PITR Firestore i zaplanowane kopie z przetestowanym odtwarzaniem.
- [ ] **HIP-28** [US][M] Okresowa **ocena** techniczna i nietechniczna (§164.308(a)(8)).
- [ ] **HIP-29** [US][M] **Zabezpieczenia fizyczne** (§164.310): polityka stacji roboczych i urządzeń dla laptopów i telefonów personelu z dostępem do konsoli; kontrole centrów danych Google dziedziczone przez BAA i raporty SOC.
- [ ] **HIP-30** [US][M] **Zabezpieczenia techniczne** (§164.312): unikalne ID użytkowników, dostęp awaryjny, automatyczne wylogowanie, szyfrowanie/deszyfrowanie, kontrola audytowa, kontrola integralności, uwierzytelnianie osób/podmiotów, bezpieczeństwo transmisji. Każde zmapowane na konkretną kontrolę Flutter lub Firebase w plikach 07–10.
- [ ] **HIP-31** [US][M] Retencja dokumentacji 6 lat (§164.316); polityki wersjonowane i dostępne dla personelu.
- [ ] **HIP-32** [US][M] **Proponowana aktualizacja Security Rule** (NPRM opublikowane w styczniu 2025: obowiązkowe MFA, szyfrowanie, inwentarz zasobów, mapa sieci, odtwarzanie w 72 godziny, roczny audyt zgodności, skanowanie podatności co 6 miesięcy, coroczne testy penetracyjne) śledzona; projektuj już pod proponowany tekst.

## D. HIPAA Breach Notification Rule (podczęść D)

- [ ] **HIP-40** [US][M] Procedura oceny ryzyka naruszenia (test czterech czynników) i dokumentowanie ustaleń o „niskim prawdopodobieństwie naruszenia poufności”.
- [ ] **HIP-41** [US][M] Jako business associate: powiadomienie covered entity bez zbędnej zwłoki i w terminie z BAA (często 5 do 10 dni, prawne maksimum 60 dni).
- [ ] **HIP-42** [US][M] Szyfrowanie spełniające wytyczne HHS (zwalidowane wg NIST, klucze nienaruszone) udokumentowane, aby utrata zaszyfrowanych danych kwalifikowała się do safe harbor.

## E. FTC Health Breach Notification Rule (aplikacje konsumenckie)

- [ ] **FTC-01** [US][M] Definicja „breach of security” obejmuje **nieautoryzowane ujawnienie**, nie tylko włamanie: udostępnienie SDK analitycznemu lub reklamowemu bez upoważnienia jest naruszeniem podlegającym zgłoszeniu.
- [ ] **FTC-02** [US][M] Powiadomienie osób i FTC w 60 dni kalendarzowych (FTC równocześnie z osobami przy 500+ poszkodowanych); powiadomienie mediów przy 500+ w jednym stanie.
- [ ] **FTC-03** [US][M] Treść i sposób powiadomienia elektronicznego wg zmienionej reguły przygotowane jako szablon.

## F. Stanowe prawo o danych zdrowotnych konsumentów

- [ ] **ST-01** [US][M] **Washington My Health My Data Act**: zgoda przed zebraniem i przed udostępnieniem danych zdrowotnych konsumentów, osobna polityka prywatności, zakaz geofencingu, prawo do usunięcia, prywatne prawo do powództwa. Dotyczy większości aplikacji konsumenckich z użytkownikami ze stanu Waszyngton.
- [ ] **ST-02** [US][M] **Nevada SB 370** i przepisy **Connecticut** o danych zdrowotnych konsumentów zmapowane tak samo.
- [ ] **ST-03** [US][M] Status **New York Health Information Privacy Act** sprawdzony; jeśli obowiązuje, zastosowano zasady upoważnień i retencji.
- [ ] **ST-04** [US][M] Kompleksowe stanowe ustawy o prywatności (Kalifornia CCPA/CPRA, Wirginia, Kolorado, Teksas, Oregon i inne): zgoda lub opt-out dla danych wrażliwych, oceny ochrony danych, uniwersalne sygnały opt-out w webie, „Do Not Sell or Share”, gdy dotyczy; wyłączenie HIPAA obejmuje tylko PHI, nie dane konsumenckie.
- [ ] **ST-05** [US][M] **Kalifornijska CMIA** (Confidentiality of Medical Information Act) dotyczy aplikacji „zaprojektowanych do przechowywania informacji medycznych”; traktuje je jak świadczeniodawców w zakresie poufności.
- [ ] **ST-06** [US][S] Stanowe przepisy o zgłaszaniu naruszeń (wszystkie 50 stanów) obsłużone jedną procedurą opartą na miejscu zamieszkania; Illinois BIPA, jeśli przetwarzane są dane biometryczne (wzorce twarzy, głosu, odcisków).
- [ ] **ST-07** [US][S] Przepisy Teksasu i innych stanów o brokerach danych i aplikacjach zdrowotnych przeglądane co roku; wskazany właściciel monitoringu prawnego.

## G. Zasady platform działające jak prawo o prywatności

- [ ] **PLAT-01** [ALL][M] **Apple**: dane HealthKit nigdy nie są przechowywane w iCloud, używane do reklam ani eksploracji danych, ani sprzedawane; wymagana polityka prywatności; „etykieta” App Privacy zgadza się z zachowaniem SDK; usuwanie konta dostępne w aplikacji.
- [ ] **PLAT-02** [ALL][M] **Google Play**: deklaracja Health apps, uprawnienia Health Connect z ekranem uzasadnienia i linkiem do polityki, formularz Data Safety spójny z każdym SDK, usuwanie konta i danych w aplikacji z linkiem webowym, brak użycia danych Health Connect do reklam.
- [ ] **PLAT-03** [ALL][S] Monit App Tracking Transparency niepotrzebny, bo nie ma śledzenia; zweryfikowane przez sprawdzenie zachowania SDK, nie założone.

## H. Dowody potrzebne w tej sekcji

Notatka o ustaleniu reżimu, BAA (klienci, Google, sub-BA), analiza ryzyka HIPAA i plan zarządzania, zestaw polityk i procedur, zapisy szkoleń, logi incydentów i naruszeń, szablon FTC HBNR, macierz prawa stanowego, deklaracje platform.
