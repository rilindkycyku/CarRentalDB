CREATE DATABASE CarRentalDB

USE CarRentalDB

--Tabela Dega
CREATE TABLE Dega 
(
	idDega VARCHAR(6) PRIMARY KEY,
	emriDeges VARCHAR(30) NOT NULL,
	emailDega VARCHAR(80) NULL UNIQUE,
	---Rruga, qyteti dhe zipKodi perbejne Adresen
	rruga VARCHAR(30),
	qyteti VARCHAR(30),
	zipKodi INT
)
--Tabela nrKontaktit
CREATE TABLE nrKontaktitDega
(
	idDega VARCHAR(6),
	nrTel INT,
	CONSTRAINT PK_nrTelDega PRIMARY KEY (idDega,nrTel),
	FOREIGN KEY (idDega) REFERENCES Dega(idDega) ON UPDATE CASCADE ON DELETE CASCADE,
)
--Tabela Stafi
CREATE TABLE Stafi
(
	idDega VARCHAR(6),
	idStafi INT,
	emri VARCHAR(30),
	mbiemri VARCHAR(30),
	nrKontaktit INT,
	CONSTRAINT PK_Stafi PRIMARY KEY (idDega,idStafi),
	FOREIGN KEY (idDega) REFERENCES Dega (idDega) ON UPDATE CASCADE ON DELETE CASCADE,
	degaMnxh VARCHAR(6),
	degaIdStafi INT,
	FOREIGN KEY (degaMnxh, degaIdStafi) REFERENCES Stafi (idDega,idStafi),
	CHECK (degaMnxh = idDega)
)
--Tabela Pozita
CREATE TABLE Pozita 
(
	idDega VARCHAR(6),
	idStafi INT,
	idPozita INT,
	roliPunes VARCHAR(70),
	CONSTRAINT PozitaEPunes PRIMARY KEY (idDega,idStafi,idPozita),
	FOREIGN KEY (idDega,idStafi) REFERENCES Stafi (idDega,idStafi) ON UPDATE CASCADE ON DELETE CASCADE
)
--Tabela Marka
CREATE TABLE Marka
(
	kodiMarkes VARCHAR(8) PRIMARY KEY,
	emriMarkes VARCHAR(50)
)
--Tabela Vetura
CREATE TABLE Vetura
(
	kodiMarkes VARCHAR(8),
	idVetura INT,
	llojiVetures VARCHAR(30),
	kmVetures INT,
	qmimiDitor DECIMAL DEFAULT 20.0,
	CONSTRAINT PK_Vetura PRIMARY KEY (kodiMarkes,idVetura),
	StafiDega VARCHAR(6) NULL,
	StafiID INT NULL,
	FOREIGN KEY (StafiDega, StafiID) REFERENCES Stafi (idDega,idStafi) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (kodiMarkes) REFERENCES Marka(kodiMarkes) ON DELETE CASCADE ON UPDATE CASCADE
)
--Tabela RegjistrimiVeturave
CREATE TABLE RegjistrimiVet
(
	kodiMarkes VARCHAR(8),
	idVetura INT,
	idReg INT,
	emriKompanisReg VARCHAR(30),
	kaKartonGjelb char(2),
	tabelatEVet VARCHAR(11),
	dataFillReg DATE,
	dataMbarReg DATE,
	CHECK (kaKartonGjelb IN ('Po', 'Jo')),
	CONSTRAINT PK_RegjistrimiVet PRIMARY KEY (kodiMarkes,idVetura,idReg),
	FOREIGN KEY (kodiMarkes,idVetura) REFERENCES Vetura (kodiMarkes,idVetura) ON UPDATE CASCADE ON DELETE CASCADE
)
--Tabela Klienti
CREATE TABLE Klienti
(
	nrPatentSHF VARCHAR(12) PRIMARY KEY,
	emri VARCHAR(30),
	mbiemri VARCHAR(30),
	nrKontaktit INT
)
--Tabela PagesaQerasVetures
CREATE TABLE PagesaQerasVetures
(
	idPagesa INT PRIMARY KEY,
	dataPageses DATE,
	idKlienti VARCHAR(12) NULL,
	FOREIGN KEY (idKlienti) REFERENCES Klienti(nrPatentSHF) ON UPDATE CASCADE ON DELETE SET NULL
)
--Tabela PranimiVeturesNgaKlienti
CREATE TABLE PranimiVeturesNgaKlienti
(
	idPagesa INT,
	idPranimit INT UNIQUE,
	dataPranimit DATE,
	dataPerDorezim DATE,
	kodiMarkes VARCHAR(8) NULL,
	idVetura INT NULL,
	CONSTRAINT PK_PVNK PRIMARY KEY (idPranimit),
	CONSTRAINT FK_PagesaQerasVetures FOREIGN KEY (idPagesa) REFERENCES PagesaQerasVetures (idPagesa) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_Vetura FOREIGN KEY (kodiMarkes,idVetura) REFERENCES Vetura (kodiMarkes,idVetura) ON UPDATE CASCADE ON DELETE SET NULL
)
--Tabela EvidentimiPranimit
CREATE TABLE EvidentimiPranimit
(
	idEvidentimit INT IDENTITY(1,1) PRIMARY KEY,
	nrPatentSHF VARCHAR(12) NULL,
	idPranimit INT NULL,
	FOREIGN KEY (nrPatentSHF) REFERENCES Klienti (nrPatentSHF) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (idPranimit) REFERENCES PranimiVeturesNgaKlienti (idPranimit) ON DELETE CASCADE
)
--Tabela DorezimiVeturesNgaKlienti
CREATE TABLE DorezimiVeturesNgaKlienti
(
	nrDorezimit INT PRIMARY KEY,
	dataDorezimit DATE,
	idKlienti VARCHAR(12),
	FOREIGN KEY (idKlienti) REFERENCES Klienti (nrPatentSHF)ON DELETE CASCADE,
	idPranimit INT,
	FOREIGN KEY (idPranimit) REFERENCES PranimiVeturesNgaKlienti (idPranimit) ON DELETE CASCADE
)
--Tabela EvidentimiDorezimit
CREATE TABLE EvidentimiDorezimit
(
	nrEvidentimit INT PRIMARY KEY,
	kodiMarkes VARCHAR(8) NULL,
	idVetura INT,
	nrDorezimit INT,
	FOREIGN KEY (kodiMarkes,idVetura) REFERENCES Vetura (kodiMarkes,idVetura) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY (nrDorezimit) REFERENCES DorezimiVeturesNgaKlienti (nrDorezimit) ON UPDATE CASCADE ON DELETE SET NULL
)
--Tabela ServisiAutorizuar
CREATE TABLE ServisiAutorizuar
(
	nrEgzaminimit INT PRIMARY KEY,
	nrEvidentimit INT,
	idDega VARCHAR(6) NULL,
	idStafi INT NULL,
	CONSTRAINT FK_EvidentimiDorezimit FOREIGN KEY (nrEvidentimit) REFERENCES EvidentimiDorezimit(nrEvidentimit) ON DELETE CASCADE,
	CONSTRAINT FK_StafiID FOREIGN KEY (idDega,idStafi) REFERENCES Stafi (idDega,idStafi) ON DELETE SET NULL
)
--Tabela RaportiVeturesDorezuar
CREATE TABLE RaportiVeturesDorezuar
(
	nrRaportit INT PRIMARY KEY,
	kmTotaleVetures INT,
	raportiEgzaminimit VARCHAR(255),
	nrEgzaminimit INT NULL,
	CONSTRAINT FK_ServisiAutorizuar FOREIGN KEY (nrEgzaminimit) REFERENCES ServisiAutorizuar (nrEgzaminimit) ON UPDATE CASCADE ON DELETE SET NULL
)
--Tabela PagesaEDemitVetures
CREATE TABLE PagesaEDemitVetures
(
	idPagesa INT PRIMARY KEY,
	dataPageses DATE DEFAULT GETDATE(),
	kostoESanksionit DECIMAL,
	shumaERiparimit DECIMAL,
	nrPatentSHF VARCHAR(12),
	FOREIGN KEY (nrPatentSHF) REFERENCES Klienti (nrPatentSHF) ON UPDATE CASCADE ON DELETE SET NULL,
	nrRaportit INT,
	CONSTRAINT FK_RaportiVeturesDorezuar FOREIGN KEY (nrRaportit) REFERENCES RaportiVeturesDorezuar (nrRaportit) ON UPDATE CASCADE ON DELETE SET NULL
)
--Tabela RiparimiVetures
CREATE TABLE RiparimiVetures
(
	idPagesa INT UNIQUE,
	nrRiparimit INT UNIQUE,
	dataRiparimit DATE,
	pershkrimiRiparimit VARCHAR(255),
	nrRaportit INT NULL,
	CONSTRAINT PK_RiparimiVetures PRIMARY KEY (idPagesa,nrRiparimit),
	FOREIGN KEY (idPagesa) REFERENCES PagesaEDemitVetures (idPagesa) ON DELETE CASCADE,
	FOREIGN KEY (nrRaportit) REFERENCES RaportiVeturesDorezuar (nrRaportit) ON UPDATE CASCADE ON DELETE SET NULL
)