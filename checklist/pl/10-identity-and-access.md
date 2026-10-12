# 10 · Tożsamość, kontrola dostępu i administracja

> To nie jest porada prawna, regulacyjna ani medyczna. Stwierdzenia z datami sprawdź w źródłach pierwotnych. Zob. [DISCLAIMER.md](../../DISCLAIMER.md).

Obejmuje ludzką stronę dostępu: użytkowników, role, administratorów, personel wsparcia, szpitale jako najemców i narzędzia, którymi nimi zarządzasz. Mechanika Firebase jest w pliku 08.

## A. Model dostępu

- [ ] **IAM-01** [ALL][M] Pisemna **polityka kontroli dostępu** definiuje role (pacjent, opiekun/pełnomocnik, klinicysta, administrator zespołu opieki, wsparcie, programista, administrator bezpieczeństwa), ich uprawnienia i dane, które mogą widzieć; zmapowana na custom claims, reguły Firestore i IAM GCP.
- [ ] **IAM-02** [ALL][M] Relacje pacjent–klinicysta (zespół opieki, przypisanie, zgoda na udostępnienie) są jawnymi rekordami z datami początku/końca; dostęp kończy się z końcem relacji.
- [ ] **IAM-03** [ALL][M] **Dostęp pełnomocnika** (rodzice, opiekunowie, przedstawiciele ustawowi) zamodelowany z własną rolą, zapisem zgody i przejściami zależnymi od wieku (np. nastolatek przejmuje kontrolę w wieku, który różni się między krajami).
- [ ] **IAM-04** [ALL][M] Dostęp awaryjny (break-glass) zaprojektowany, jeśli kontekst kliniczny go wymaga: monit o uzasadnienie, ograniczony czasowo, alertowany, przeglądany po fakcie.
- [ ] **IAM-05** [ALL][M] Rozdzielenie obowiązków: osoby zatwierdzające dostęp nie są tymi, które go nadają; programiści nie mają stałego dostępu do danych produkcyjnych.
- [ ] **IAM-06** [ALL][S] Wielonajemność dla instytucji: izolacja najemców w modelu danych (ID najemcy w każdym dokumencie, wymuszany w regułach) lub na poziomie projektu; zapytania między najemcami niemożliwe z konstrukcji.

## B. Siła uwierzytelniania

- [ ] **IAM-10** [ALL][M] Siła uwierzytelniania per rola udokumentowana: pacjenci (hasło + biometria urządzenia lub passkeys), klinicyści i administratorzy (MFA obowiązkowe), wsparcie (MFA + SSO).
- [ ] **IAM-11** [ALL][M] Passkeys / WebAuthn lub logowanie platformowe (Sign in with Apple/Google) ocenione; jeśli oferowane, odzyskiwanie konta nie obniża bezpieczeństwa.
- [ ] **IAM-12** [ALL][M] Odzyskiwanie konta (utracony telefon, utracony e-mail) zaprojektowane jako powierzchnia ataku: kroki weryfikacji tożsamości, okresy karencji, powiadomienia na istniejące kanały.
- [ ] **IAM-13** [ALL][M] Ochrona przed brute force i credential stuffing (kwoty Identity Platform, reCAPTCHA, blocking functions, kontrola haseł z wycieków).
- [ ] **IAM-14** [ALL][M] Polityka sesji: timeout bezczynności, bezwzględny czas życia, równoległe sesje, lista urządzeń ze zdalnym wylogowaniem; zaimplementowana po stronie serwera (unieważnianie tokenów + kontrola `auth_time`).
- [ ] **IAM-15** [ALL][S] Wiązanie z urządzeniem dla aplikacji klinicystów (urządzenia zarządzane, atestacja MDM), gdy szpitale tego wymagają.

## C. Wymuszanie autoryzacji

- [ ] **IAM-20** [ALL][M] Każda ścieżka dostępu do danych (SDK klienta, Functions, narzędzia administracyjne, BigQuery, eksporty, konsole wsparcia) wymusza ten sam model dostępu; brak „obejścia przez Admin SDK” bez logowania i uzasadnienia.
- [ ] **IAM-21** [ALL][M] Zmiany ról obowiązują w zdefiniowanym czasie (wymuszenie odświeżenia tokena, unieważnienie sesji); testy dowodzą, że usunięty klinicysta traci dostęp.
- [ ] **IAM-22** [ALL][M] Autoryzacja na poziomie obiektu testowana pod kątem IDOR (zmiana ID dokumentu w żądaniu) dla każdej kolekcji i Function.
- [ ] **IAM-23** [ALL][S] Reguły oparte na atrybutach (okna czasowe, lokalizacja, stan urządzenia) używane tam, gdzie uzasadnia je ryzyko kliniczne.

## D. Narzędzia administracyjne i wsparcia

- [ ] **IAM-30** [ALL][M] Konsola administracyjna / narzędzie back-office jest nadzorowanym elementem oprogramowania z własnymi wymaganiami, regułami, testami i logowaniem audytowym; nigdy nie pokazuje więcej danych identyfikujących, niż wymaga zadanie.
- [ ] **IAM-31** [ALL][M] Personel wsparcia pracuje na widokach pseudonimizowanych; reidentyfikacja wymaga numeru zgłoszenia i jest logowana.
- [ ] **IAM-32** [ALL][M] Dostęp produkcyjny inżynierów jest tymczasowy, zatwierdzany i logowany (Privileged Access Manager / nadania IAM just-in-time); dostęp awaryjny przeglądany po fakcie.
- [ ] **IAM-33** [ALL][M] Proces joiner/mover/leaver z listą kontrolną obejmującą Google Cloud, Firebase, GitHub, CI, sklepy, e-mail, system wsparcia, narzędzia QMS; dla odchodzących realizowany tego samego dnia.
- [ ] **IAM-34** [ALL][M] Kwartalny **przegląd dostępu** wszystkich tożsamości ludzkich i serwisowych z podpisem; ustalenia śledzone.
- [ ] **IAM-35** [ALL][S] Działania administracyjne wymagają podniesienia MFA i są limitowane; masowe eksporty wymagają zatwierdzenia przez dwie osoby.

## E. Higiena danych tożsamości

- [ ] **IAM-40** [ALL][M] Atrybuty tożsamości przechowywane w Auth są minimalne; atrybuty zdrowotne nigdy nie są w profilach Auth, claims ani tokenach pojawiających się w logach.
- [ ] **IAM-41** [ALL][M] Zmiany e-maila/telefonu weryfikowane na starym i nowym kanale; powiadomienia wysyłane przy zmianach istotnych dla bezpieczeństwa.
- [ ] **IAM-42** [ALL][S] Weryfikacja tożsamości klinicystów (prawo wykonywania zawodu, poświadczenie szpitala) udokumentowana tam, gdzie dostęp kliniczny jest nadawany poza najemcą SSO.

## F. Dowody potrzebne w tej sekcji

Polityka kontroli dostępu i macierz ról, projekt izolacji najemców, tabela siły uwierzytelniania, polityka sesji, dokumentacja narzędzia administracyjnego, lista kontrolna JML, zapisy przeglądów dostępu, wyniki testów IDOR.
