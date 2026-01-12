USE CarRentalDB

--------------------------------------------------------------- QUERY TE THJESHTA ---------------------------------------------------------------
---------------------------------------------------------------  ME NJE RELACION  ---------------------------------------------------------------

------ Selektimi i klienteve me emrin Chris ose Jessica -----
SELECT * FROM Klienti WHERE emri IN ('Chris', 'Jessica')
------ Selektimi i klienteve me mbiemrin Miller ose Williams -----
SELECT * FROM Klienti WHERE mbiemri IN ('Miller', 'Williams')
------ Selektimi i Veturave te markeave qe fillojne me shkronjen M -----
SELECT * FROM Vetura WHERE kodiMarkes LIKE 'M%'
------ Selektimi i Degeve te regjionit te Ferizajit -----
SELECT * FROM Dega WHERE zipKodi LIKE '7%'
------ Selektimi i Degeve te Prishtines -----
SELECT * FROM Dega WHERE qyteti = 'Prishtine'
------ Selektimi i Vetura qe kane qmimin e qerase ditore me te madhe se 100 -----
SELECT * FROM Vetura WHERE qmimiDitor > 100;
------ Selektimi i Vetura qe kane qmimin e qerase ditore me te vogel se 40 -----
SELECT * FROM Vetura WHERE qmimiDitor < 40;
------ Selektimi i Pagesave te Qeras se Veturave nga klientet qe jane fshire nga sistemi -----
SELECT * FROM PagesaQerasVetures WHERE idKlienti IS NULL
------ Selektimi i Veturave te cilat jane pa menaxhim nga stafi -----
SELECT * FROM Vetura WHERE StafiDega IS NULL;

--------------------------------------------------------------- QUERY TE THJESHTA ---------------------------------------------------------------
---------------------------------------------------------  ME DY E ME SHUME RELACIONE  ----------------------------------------------------------

------ Selektimi i Tabelave te Veturave  -----
SELECT v.kodiMarkes, v.llojiVetures, rv.tabelatEVet FROM 
Vetura v, RegjistrimiVet rv
WHERE v.kodiMarkes = rv.kodiMarkes AND v.idVetura = rv.idVetura;
------ Selektimi i Tabelave te Veturave  te cilat jane te regjisturar ne regjionin e Prishtines -----
SELECT v.kodiMarkes, v.llojiVetures, rv.tabelatEVet FROM 
Vetura v, RegjistrimiVet rv
WHERE v.kodiMarkes = rv.kodiMarkes AND v.idVetura = rv.idVetura AND tabelatEVet LIKE '01%';
------ Selektimi i Veturave qe nuk kane Karton te Gjelbert  -----
SELECT v.*, rv.kaKartonGjelb FROM 
Vetura v, RegjistrimiVet rv
WHERE v.kodiMarkes = rv.kodiMarkes AND v.idVetura = rv.idVetura AND rv.kaKartonGjelb LIKE 'JO';
------ Selektimi i Veturave nga Markat VW dhe AUDI ------
SELECT v.* FROM
Vetura v, Marka m
WHERE v.kodiMarkes = m.kodiMarkes AND m.kodiMarkes IN ('AUDI', 'VW')

--Selektimi i stafit me rolin e punes Menagjues i veturave
SELECT DISTINCT s.idStafi, s.emri, p.roliPunes
FROM Stafi s INNER JOIN Pozita p ON s.idStafi = p.idStafi
WHERE p.roliPunes LIKE 'Menagjues i Veturave'

--Selektimi i veturave dhe pershkrimin e riparimit
SELECT  v.llojiVetures, rv.pershkrimiRiparimit
FROM Vetura v INNER JOIN RiparimiVetures rv ON v.idVetura = rv.idPagesa

--Selektimi i llojit te vetures se Klientit ne baz te dorezimit dhe qmimit ditor
SELECT dvk.idKlienti, v.llojiVetures
FROM DorezimiVeturesNgaKlienti dvk INNER JOIN Vetura v ON dvk.nrDorezimit = v.qmimiDitor

--Selektimi i Pageses se vetures nga Klienti
SELECT DISTINCT  k.emri, pqv.dataPageses
FROM Klienti k INNER JOIN PagesaQerasVetures pqv ON k.nrPatentSHF = pqv.idKlienti


--------------------------------------------------------------- QUERY TE AVANCUARA ---------------------------------------------------------------

------ Selektim i Veturave te cilat kane deme nga klientet ------
SELECT v.kodiMarkes,v.idVetura,v.llojiVetures,k.nrPatentSHF,k.emri,k.mbiemri,pedv.dataPageses AS 'Data e Pages Demit' FROM Vetura v
INNER JOIN PranimiVeturesNgaKlienti pvnk ON v.kodiMarkes = pvnk.kodiMarkes AND v.idVetura = pvnk.idVetura
INNER JOIN DorezimiVeturesNgaKlienti dvnk ON pvnk.idPranimit = dvnk.idPranimit
INNER JOIN Klienti k ON dvnk.idKlienti = k.nrPatentSHF
INNER JOIN PagesaEDemitVetures pedv ON k.nrPatentSHF = pedv.nrPatentSHF

----- Listimi i te gjitha veturave qe nuk jane marre asnje her me qera -----
SELECT v.kodiMarkes,v.idVetura,v.llojiVetures FROM Vetura v
LEFT JOIN PranimiVeturesNgaKlienti pvnk ON v.kodiMarkes = pvnk.kodiMarkes AND v.idVetura = pvnk.idVetura 
WHERE pvnk.idVetura IS NULL

------ Listimi i demeve totale te vetura te shkaktuara nga klienti ------
SELECT v.kodiMarkes,v.idVetura,v.llojiVetures,COUNT(*) AS 'Demet Totale te Vetures' FROM Vetura v
INNER JOIN PranimiVeturesNgaKlienti pvnk ON v.kodiMarkes = pvnk.kodiMarkes AND v.idVetura = pvnk.idVetura
INNER JOIN DorezimiVeturesNgaKlienti dvnk ON pvnk.idPranimit = dvnk.idPranimit
INNER JOIN Klienti k ON dvnk.idKlienti = k.nrPatentSHF
INNER JOIN PagesaEDemitVetures pedv ON k.nrPatentSHF = pedv.nrPatentSHF
GROUP BY v.kodiMarkes,v.idVetura,v.llojiVetures
ORDER BY 'Demet Totale te Vetures' DESC

------ Veturat te cilat nuk jane dorezuar akoma nga klientet -----
SELECT v.kodiMarkes,v.idVetura,pvnk.dataPranimit,pvnk.dataPerDorezim,dvnk.dataDorezimit FROM vetura v
INNER JOIN PranimiVeturesNgaKlienti pvnk ON v.kodiMarkes = pvnk.kodiMarkes AND v.idVetura = pvnk.idVetura
LEFT JOIN DorezimiVeturesNgaKlienti dvnk ON pvnk.idPranimit = dvnk.idPranimit
WHERE dvnk.idPranimit IS NULL

--SELEKTIMI I LLOJEVE TE VETURAVE DHE KOMPANISE SE REGJISTRIMIT
SELECT DISTINCT  m.emriMarkes, v.llojiVetures, rv.emriKompanisReg
FROM Marka m INNER JOIN Vetura v ON m.kodiMarkes = v.kodiMarkes
INNER JOIN  RegjistrimiVet rv ON rv.kodiMarkes = m.kodiMarkes

--SELEKTIMI I DATAVE TE PAGESES, PRANIMIT DHE DOREZIMIT NGA KLIENTET
SELECT DISTINCT pqv.dataPageses, pvk.dataPranimit, dvk.dataDorezimit
FROM PagesaQerasVetures pqv INNER JOIN PranimiVeturesNgaKlienti pvk ON pqv.dataPageses = pvk.dataPerDorezim
INNER JOIN DorezimiVeturesNgaKlienti dvk ON pqv.dataPageses = dvk.dataDorezimit

--SELEKTIMI I KLIENTEVE DEGES KU KAN PRANUAR VETUREN DHE NUMRAT E TELEFONIT
SELECT DISTINCT s.emri, d.emriDeges, nrKD.nrTel
FROM Stafi s INNER JOIN Dega d ON s.idDega =d.idDega
INNER JOIN nrKONtaktitDega nrKD ON s.idDega = nrKD.idDega

--SELEKTIMI I VETURAVE TE RIAPARUARA ME KOSTON DHE PERSHKRIMET E RIPARIMEVE
SELECT rvd.raportiEgzaminimit, pdv.kostoESanksiONit, rv.pershkrimiRiparimit
FROM RaportiVeturesDorezuar rvd INNER JOIN PagesaEDemitVetures pdv ON rvd.nrRaportit = pdv.nrRaportit
INNER JOIN RiparimiVetures rv ON rvd.nrRaportit = rv.nrRaportit

--------------------------------------------------------------- SUBQUERY TE THJESHTA ---------------------------------------------------------------

----- Listimi i veturave te cilat kane qmime me te madh se mesatarja e qmimit ditor per te gjitha veturat
SELECT kodiMarkes, idVetura, llojiVetures, qmimiDitor
FROM Vetura 
WHERE qmimiDitor > (SELECT AVG(qmimiDitor) FROM Vetura)
ORDER BY qmimiDitor DESC

----- Listimi i markave te cilat kane me shum vetura ne Car Rental se sa mesatarja e te gjitha markave
WITH totVetPerMark AS
(
	SELECT count(*) AS tot FROM Vetura v
	GROUP BY v.kodiMarkes
)
SELECT m.*, COUNT(*) AS TotaliVeturaveTeMarkes
FROM marka m, Vetura v
WHERE m.kodiMarkes = v.kodiMarkes
GROUP BY m.emriMarkes, m.kodiMarkes
HAVING COUNT(*) > (SELECT AVG(tot) FROM totVetPerMark)

---- Selektimi i Veturave qe gjenden ne deget e Car Rental ne Kacanik
SELECT kodiMarkes, idVetura, llojiVetures, qmimiDitor, qyteti, idDega, emriDeges
FROM Vetura v, Dega d
WHERE v.StafiDega = d.idDega AND v.StafiDega IN ( SELECT idDega 
													FROM dega
													WHERE qyteti LIKE 'Kacanik')
ORDER BY idDega

------ Listimi i veturave te marra me qera nga klientet qe i fillon emri me E, A ose mbiemri me W.
SELECT v.kodiMarkes, v.idVetura, v.llojiVetures, k.nrPatentSHF, k.emri, k.mbiemri, pvnk.dataPranimit
FROM Vetura v, Klienti k, PagesaQerasVetures pqv, PranimiVeturesNgaKlienti pvnk
WHERE v.idVetura = pvnk.idVetura AND v.kodiMarkes = pvnk.kodiMarkes AND pqv.idPagesa = pvnk.idPagesa 
AND k.nrPatentSHF = pqv.idKlienti AND pqv.idKlienti IN (SELECT nrPatentSHF 
														FROM Klienti 
														WHERE emri LIKE 'E%' OR emri LIKE 'A%' OR mbiemri LIKE 'W%')

--SELEKTIMI I kOSTOS DHE MESATARES SE SHUMES SE RIPARIMIT TE VETURES
SELECT kostoESanksiONit, shumaERiparimit
FROM PagesaEDemitVetures 
WHERE shumaERiparimit > (SELECT AVG(shumaERiparimit) FROM PagesaEDemitVetures)
ORDER BY shumaERiparimit 


--SELEKTIMI I VETURAVE DHE TE DHENAT  E REGJISTRIMIT TE VETURAVE
SELECT v.idVetura, v.kodiMarkes, rv.emriKompanisReg, rv.dataFillReg, rv.dataMbarReg
FROM Vetura v, RegjistrimiVet rv
WHERE rv.idReg = ( SELECT idReg FROM RegjistrimiVet WHERE idReg = 1)		


--SELEKTIMI I LLOJIT TE VETURES DHE MESATARJA E KILOMETRAVE TE TYRE
SELECT llojiVetures, kmVetures
FROM Vetura
WHERE kmVetures > (SELECT AVG(kmVetures) FROM Vetura)
ORDER BY idVetura


--SELEKTIMI I STAFIT ME ROLIN E PUNES Menagjim i Klientave dhe Qeradhenje e Veturave
SELECT distinct s.emri, s.mbiemri, p.roliPunes
FROM Stafi s, Pozita p
WHERE p.roliPunes in (SELECT roliPunes FROM Pozita WHERE roliPunes LIKE 'Menagjim i Klientave dhe Qeradhenje e Veturave') 
ORDER BY roliPunes

--------------------------------------------------------------- SUBQUERY TE AVANCUARA ---------------------------------------------------------------

----- Qmimi total i paguar nga klientet per secilen nga veturat qe nga fillimi i Car Rental
SELECT v.kodiMarkes, v.idVetura, v.llojiVetures, v.qmimiDitor, ISNULL(SUM(diteteQeras.ditet),0) AS DitetTotaleTeMarraMeQera, v.qmimiDitor * ISNULL(SUM(diteteQeras.ditet),0) AS QmimiTotalIPaguarNeEURO
FROM Vetura v LEFT JOIN (SELECT idVetura, kodiMarkes, DATEDIFF(DAY, dataPranimit, dataPerDorezim) AS ditet  FROM PranimiVeturesNgaKlienti) AS diteteQeras
ON v.idVetura = diteteQeras.idVetura AND v.kodiMarkes = diteteQeras.kodiMarkes
GROUP BY v.kodiMarkes, v.idVetura, v.llojiVetures, v.qmimiDitor
ORDER BY QmimiTotalIPaguarNeEURO DESC

----- Shuma totale e secilit klient e paguar ne deme te veturave
SELECT k.emri, k.mbiemri, k.nrPatentSHF, (SELECT ISNULL(SUM(shumaERiparimit),0)
											FROM PagesaEDemitVetures pdv
											WHERE k.nrPatentSHF = pdv.nrPatentSHF) AS TotaliEuro
FROM Klienti k
ORDER BY TotaliEuro DESC

----- Shuma mesatare e qeras ditore per secilin nga Deget e regjionit te Ferizajit
SELECT d.idDega, d.emriDeges, d.zipKodi, (SELECT AVG(v.qmimiDitor) FROM Vetura v WHERE v.StafiDega = d.idDega) AS QmimiMes
FROM Dega d
WHERE d.zipKodi LIKE '7%'
GROUP BY d.idDega,d.emriDeges,d.emailDega,d.qyteti,d.rruga,d.zipKodi

----- Listimi i Totalit te veturave qe gjenden ne secilen nga deget
SELECT d.idDega, d.emriDeges, (SELECT COUNT(*) FROM Vetura v WHERE v.StafiDega = d.idDega) AS TotVeturaveNeDege
FROM Dega d
GROUP BY d.idDega,d.emriDeges
ORDER BY TotVeturaveNeDege DESC

--SELEKTIMI I VETURAVE DHE QMIMI DITOR 
SELECT llojiVetures, qmimiDitor
  FROM Vetura
	WHERE EXISTS (
		SELECT * 
		FROM RaportiVeturesDorezuar
		WHERE Vetura.idVetura = RaportiVeturesDorezuar.nrRaportit
	)

--SELEKTIMI I VETURES ME ME SE SHUMTI KM
SELECT * 
	FROM RaportiVeturesDorezuar WHERE kmTotaleVetures =  
(SELECT MAX(kmTotaleVetures) FROM RaportiVeturesDorezuar WHERE kmTotaleVetures 
NOT IN (SELECT MAX(kmTotaleVetures) FROM RaportiVeturesDorezuar))

--SELEKTIMI I DEGES MENAXHERIALE D001
 SELECT emriDeges FROM Dega WHERE idDega in (SELECT idDega FROM Stafi WHERE idStafi in
 (SELECT idStafi FROM Stafi WHERE degaMnxh LIKE 'D001' ))

--SELEKTIMI I VETURAVE ME QMIMIN DITOR ME TE LART
SELECT * FROM Vetura WHERE qmimiDitor =  
(SELECT MAX(qmimiDitor) FROM Vetura WHERE qmimiDitor 
NOT IN  (SELECT MAX(qmimiDitor) FROM Vetura))

--------------------------------------------------------------- QUERY/SUBQUERY ME ALGJEBER RELACIONARE ---------------------------------------------------------------

----- Selektimi i Kliententeve te cilet I kane dorezuar veturat e marra me qera
----- por nuk kan shkaktuar asnje aksident.
(
	SELECT k.* FROM Klienti k
	INNER JOIN DorezimiVeturesNgaKlienti dvnk ON k.nrPatentSHF = dvnk.idKlienti
)

EXCEPT

(
	SELECT k.* FROM Klienti k 
	INNER JOIN PagesaEDemitVetures pdv ON k.nrPatentSHF = pdv.nrPatentSHF
)

--- Listimi i Degeve qe posedojn ne degen e tyre vetura te Markes AUDI ose BMW
(
	SELECT d.idDega, d.emriDeges, v.kodiMarkes FROM Dega d
	INNER JOIN Vetura v ON d.idDega = v.StafiDega
	WHERE v.kodiMarkes = 'AUDI'
)

UNION

(
	SELECT d.idDega, d.emriDeges, v.kodiMarkes FROM Dega d
	INNER JOIN Vetura v ON d.idDega = v.StafiDega
	WHERE v.kodiMarkes = 'BMW'
)

----- Selektimi i Stafit te cilet kane pranuar veturat e dorezuar nga klientet pa asnje defekt
(
	SELECT s.* FROM Stafi s
	INNER JOIN Pozita p ON s.idDega = p.idDega AND s.idStafi = p.idStafi
	WHERE p.roliPunes = 'Menagjues i Veturave'
)

EXCEPT

(
	SELECT s.* FROM ServisiAutorizuar sa
	INNER JOIN Stafi s ON sa.idStafi = s.idStafi AND sa.idDega = s.idDega
	INNER JOIN RiparimiVetures rv ON sa.nrEvidentimit = rv.nrRaportit
)

----- Listimi i Klienteve qe kane marr me qera vetura te Markave NISSAN dhe TOYOTA
(
	SELECT k.nrPatentSHF, k.emri, k.mbiemri, v.kodiMarkes, v.idVetura, v.llojiVetures, pvnk.dataPranimit FROM Klienti k
	INNER JOIN PagesaQerasVetures pqv ON k.nrPatentSHF = pqv.idKlienti
	INNER JOIN PranimiVeturesNgaKlienti pvnk ON pqv.idPagesa = pvnk.idPagesa
	INNER JOIN Vetura v ON pvnk.kodiMarkes = v.kodiMarkes AND pvnk.idVetura = v.idVetura
	WHERE pvnk.kodiMarkes = 'NISSAN'
)

UNION

(
	SELECT k.nrPatentSHF, k.emri, k.mbiemri, v.kodiMarkes, v.idVetura, v.llojiVetures, pvnk.dataPranimit FROM Klienti k
	INNER JOIN PagesaQerasVetures pqv ON k.nrPatentSHF = pqv.idKlienti
	INNER JOIN PranimiVeturesNgaKlienti pvnk ON pqv.idPagesa = pvnk.idPagesa
	INNER JOIN Vetura v ON pvnk.kodiMarkes = v.kodiMarkes AND pvnk.idVetura = v.idVetura
	WHERE pvnk.kodiMarkes = 'TOYOTA'
)

--SELEKTIMI I TE GJITHA LLOJEVE TE VETURAVE NGA SECILA MARK
(
	SELECT kodiMarkes, llojiVetures FROM Vetura
)

UNION

(
	SELECT emriMarkes, kodiMarkes FROM Marka
); 


--SELEKTIMI I LLOJIT TE VETURES DHE EMRIT TE DEGES
(	
	SELECT llojiVetures
	FROM Vetura
)

UNION

(
	SELECT emriDeges
	FROM dega 
)


--SELEKTIMI I STAFIT ME ROLIN E PUNES Menagjim i Klientave dhe Qeradhenje e Veturave
(
	SELECT s.emri, s.mbiemri, p.roliPunes FROM Stafi s
	INNER JOIN Pozita p ON  s.idStafi = p.idPozita
	WHERE  p.roliPunes = 'Menagjim i Klientave dhe Qeradhenje e Veturave'
)

EXCEPT 

(
	SELECT s.emri, s.mbiemri, p.roliPunes FROM Stafi s
	INNER JOIN Pozita p ON  s.idStafi = p.idPozita
	WHERE  p.roliPunes = 'Menagjues i Veturave'
)


--SELEKTIMI I VETURAVE QE NUK KANE KARTON TE GJELBERT
(
	SELECT rv.kaKartONGjelb, v.llojiVetures, v.qmimiDitor FROM RegjistrimiVet rv
	INNER JOIN Vetura v ON rv.kodiMarkes = v.kodiMarkes
	WHERE rv.kaKartONGjelb = 'JO' 
)

EXCEPT

(
	SELECT rv.kaKartONGjelb, v.llojiVetures, v.qmimiDitor FROM RegjistrimiVet rv
	INNER JOIN Vetura v ON rv.kodiMarkes = v.kodiMarkes
	WHERE rv.kaKartONGjelb = 'PO'
)



--------------------------------------------------------------- STORED PROCEDURE ---------------------------------------------------------------

----- Shfaqja e stafit sipas Pozites se tyre
CREATE PROCEDURE spd_ShfaqjaEStafitSipasPozites
(
	@pozita VARCHAR(255),
	@totaliStafit VARCHAR(255) OUT 
)
AS
BEGIN
	SELECT s.emri, s.mbiemri, s.idDega, s.idStafi, p.roliPunes FROM Stafi s
	INNER JOIN Pozita p ON s.idDega = p.idDega AND s.idStafi = p.idStafi
	WHERE p.roliPunes = @pozita

	SELECT @totaliStafit = COUNT(*) FROM Stafi s
	INNER JOIN Pozita p ON s.idDega = p.idDega AND s.idStafi = p.idStafi
	WHERE p.roliPunes = @pozita

	IF(@pozita != 'Menagjues i Deges' AND @pozita != 'Menagjues i Veturave' AND @pozita != 'Menagjim i Klientave dhe Qeradhenje e Veturave')
		PRINT 'Nuk egziston asnje staf me kete pozite!'
	ELSE
		PRINT 'Totali i Stafit me Poziten si ' + @pozita + ' eshte: ' + @totaliStafit

END

DECLARE @totali INT
EXEC spd_ShfaqjaEStafitSipasPozites 'Menagjues i Deges', @totali


----- Printimi i qmimit mesatar te qeras ditore per qytetin e caktuar
CREATE PROCEDURE spd_QmimMesDitorSipasQytetit
(
	@qyteti VARCHAR(255),
	@qmimiDit FLOAT OUT
)
AS
BEGIN
	SELECT @qmimiDit = AVG(v.qmimiDitor)
	FROM Dega d
	INNER JOIN Vetura v ON d.idDega = v.StafiDega
	WHERE d.qyteti LIKE @qyteti
END

DECLARE @q VARCHAR(255) = 'Prishtine', @qmimimes FLOAT
EXEC spd_QmimMesDitorSipasQytetit @q, @qmimimes OUT
PRINT 'Qmimi Mesatar i qeras ditore per qytetin e ' + @q + ' eshte ' + CONVERT(VARCHAR, @qmimimes) + ' €' 

----- Perditesimi i Qmimit Ditor ne mbas te perqindjes sipas qytetit te perzgjedhur
CREATE PROCEDURE sdp_RritQmiminDitorPerVeturaSipasQytetit
(
	@qyteti VARCHAR(255),
	@qmimi FLOAT
)
AS
BEGIN
	UPDATE Vetura
	SET qmimiDitor = qmimiDitor + (@qmimi/100 * qmimiDitor)
	WHERE StafiDega IN (SELECT idDega FROM dega WHERE qyteti = @qyteti)

	IF((SELECT COUNT(*) FROM dega d WHERE d.qyteti = @qyteti) = 0)
		PRINT 'Nuk egziston asnje dege ne kete qytet!'
	ELSE
		SELECT *
		FROM Vetura
		WHERE StafiDega IN (SELECT idDega FROM dega WHERE qyteti = @qyteti)
END

EXEC sdp_RritQmiminDitorPerVeturaSipasQytetit 'Prishtine', 20;

----- Listimi i Klienteve te cilet kane marre veturat me qera sipas markes se perzgjedhur
CREATE PROCEDURE sdp_ListoKlientetSipasMarkesVeturave
(
	@marka VARCHAR(255)
)
AS
BEGIN
	SELECT k.nrPatentSHF, k.emri, k.mbiemri, v.kodiMarkes, v.idVetura, v.llojiVetures, pvnk.dataPranimit FROM Klienti k
	INNER JOIN PagesaQerasVetures pqv ON k.nrPatentSHF = pqv.idKlienti
	INNER JOIN PranimiVeturesNgaKlienti pvnk ON pqv.idPagesa = pvnk.idPagesa
	INNER JOIN Vetura v ON pvnk.kodiMarkes = v.kodiMarkes AND pvnk.idVetura = v.idVetura
	WHERE pvnk.kodiMarkes = @marka
END

EXEC sdp_ListoKlientetSipasMarkesVeturave 'VW'

--PERDITSIMI I TECDHENAVE TE KLIENTIT
CREATE PROCEDURE PerditesimiIKlientit 
@Emri VARCHAR (50),
@Mbiemri VARCHAR (50)
AS
UPDATE Klienti
SET emri = @Emri, mbiemri = @Mbiemri
WHERE emri = 'Sam' AND mbiemri = 'Brown'

EXEC PerditesimiIKlientit @Emri = 'Perparim', @Mbiemri = 'Dardhishta';

--RAPORTI I VETURAVE
CREATE PROCEDURE Raporti 
AS
BEGIN
SET NOCOUNT ON
 
SELECT rvd.raportiEgzaminimit, pdv.kostoESanksiONit, rv.pershkrimiRiparimit
FROM RaportiVeturesDorezuar rvd INNER JOIN PagesaEDemitVetures pdv ON rvd.nrRaportit = pdv.nrRaportit
INNER JOIN RiparimiVetures rv ON rvd.nrRaportit = rv.nrRaportit
 
END

EXEC Raporti

--SELEKTIMI I TABELAVE TE VETURES ME ID TE GJEGJISTRIMIT 1
IF EXISTS (SELECT 1 FROM SYS.procedures WHERE NAME ='emriKompanisReg') --EXEC GetAgencies @AgencyID = '1'
BEGIN
DROP PROCEDURE emriKompanisReg
END
GO
 
CREATE PROCEDURE emriKompanisReg
(@IDREG INT)
AS
BEGIN
 
SELECT idReg, tabelatEVet FROM RegjistrimiVet WHERE idReg = @IDREG
 
END
GO

EXEC emriKompanisReg @IDREG = '1'

--SELEKTIMI I Kostos se riparimit te veturave
CREATE PROCEDURE KostoERiparimit 
AS
BEGIN
SET NOCOUNT ON
 
SELECT kostoESanksiONit, shumaERiparimit
FROM PagesaEDemitVetures 
WHERE shumaERiparimit > (SELECT AVG(shumaERiparimit) FROM PagesaEDemitVetures)
ORDER BY shumaERiparimit
 
END

EXEC KostoERiparimit

--SELEKTIMI I VETURAVE ME QMIM ME TE LART SE 50 EURO
CREATE PROCEDURE QmimiVetures
@qmimiDitor DECIMAL,
@llojiVetures VARCHAR(30),
@kodiMarkes VARCHAR(8)
AS
BEGIN
SELECT @llojiVetures= @kodiMarkes, @qmimiDitor = AVG(v.qmimiDitor)
FROM Vetura v, Marka m
WHERE v.kodiMarkes = m.kodiMarkes and v.llojiVetures LIKE @llojiVetures
GROUP BY v.llojiVetures
IF(@qmimiDitor < 50)
PRINT 'Vetura: ' + @kodiMarkes  + ' ' + @llojiVetures + ' ka qmimin me te ulet se 50 Euro!'
ELSE
PRINT 'Vetura: ' + @kodiMarkes + ' ' + @llojiVetures + ' ka qmimin me te larte se 50 Euro!'
END

EXEC QmimiVetures @qmimiDitor = 115.0, @llojiVetures = 'Mustang', @kodiMarkes = 'FORD'



