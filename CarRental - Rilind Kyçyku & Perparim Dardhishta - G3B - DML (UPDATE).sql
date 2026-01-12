USE CarRentalDB
--------------------------------------------------------------- PERDITESIMI I TE DHENAVE ---------------------------------------------------------------
--------------------------------------------------------------- ------------------------ ---------------------------------------------------------------

------ Perditeson Veturat me km totale nga kontrollimi i fundit -----
UPDATE Vetura 
SET kmVetures = rpv.kmTotaleVetures 
FROM Vetura v 
JOIN EvidentimiDorezimit ed ON ed.idVetura = v.idVetura AND ed.kodiMarkes = v.kodiMarkes 
JOIN ServisiAutorizuar s ON s.nrEvidentimit = ed.nrEvidentimit
JOIN RaportiVeturesDorezuar rpv ON rpv.nrEgzaminimit = s.nrEgzaminimit
WHERE kmVetures < rpv.kmTotaleVetures;

----- Bartja e stafit nga Zyrja nr D006 ne D011
UPDATE Stafi
SET idDega = 'D011', idStafi = 2, degaMnxh = 'D011', degaIdStafi = 1
WHERE  idDega = 'D006' AND idStafi = 3;

----- Regjistrimi i Automjeteve me afat te skaduar
UPDATE RegjistrimiVet
SET dataFillReg = '01/03/2022', dataMbarReg = DATEADD(day, 365, dataFillReg)
WHERE dataMbarReg < '2022-12-31';

----- Marrja e kartonit te gjelbert per secilen veture qe eshte regjistruar tani
UPDATE RegjistrimiVet
SET kaKartonGjelb = 'Po'
WHERE kaKartonGjelb = 'Jo' AND  dataFillReg = '01/03/2022';

----- Eshte bere bartja e te gjithave veturave ne kompanin e Sigurimit Scardian
UPDATE RegjistrimiVet
SET emriKompanisReg = 'Scardian'
WHERE emriKompanisReg != 'Scardian';

----- Perditesimi i qmimit ditor per 10% ne rast se eshte me i vogel se 60
UPDATE Vetura
SET qmimiDitor = qmimiDitor + (0.1 * qmimiDitor)
WHERE qmimiDitor < 60;

----- Nderrimi i kodit te markes nga BENZ ne Mercedes
UPDATE Marka
SET kodiMarkes = 'MERCEDES'
WHERE kodiMarkes = 'BENZ'

----- Riemeri si Automekanik nga Punetor i Thjeshte per Puntorin me id D009-3
UPDATE Pozita
SET roliPunes = 'Automekanik i Deges'
WHERE idDega = 'D009' AND idStafi = 3

------ Perditesimi i Serviseve tek stafi i emeruar nga ai menaxhues
UPDATE ServisiAutorizuar
SET idStafi = 3
WHERE idDega = 'D009' AND idStafi != 3

----- Riemeri si Menagjues i Deges nga ai i Stafit 
UPDATE Pozita
SET roliPunes = 'Menagjues i Deges'
WHERE roliPunes = 'Menagjues i Stafi'

----- Riemeri i Punetoreve te thjeshe
UPDATE Pozita
SET roliPunes = 'Menagjim i Klientave dhe Qeradhenje e Veturave'
WHERE roliPunes = 'Puntor i thjesht'

----- Perditesimi i emrave te rrugeve
UPDATE Dega
SET rruga = 'Rexhep Luci'
WHERE qyteti = 'Prishtine'

UPDATE Dega
SET rruga = 'Ahmet Kaciku'
WHERE qyteti = 'Ferizaj'

UPDATE Dega
SET rruga = 'Pajazit Ahmeti'
WHERE qyteti = 'Gjilan'
