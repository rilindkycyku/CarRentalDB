USE CarRentalDB

--------------------------------------------------------------- FSHIRAJ E TE DHENAVE ---------------------------------------------------------------
--------------------------------------------------------------- ------------------------ ---------------------------------------------------------------

----- Pershkak te transferimit te nje stafit nga nje dege tjeter
DELETE FROM Pozita
WHERE idDega = 'D011' AND idStafi = 1 AND idPozita = 3

----- Fshirja e deges nr6
DELETE FROM Dega
WHERE idDega IN ('D006')

----- Fshirja e Markes JEEP
DELETE FROM MARKA
WHERE kodiMarkes = 'JEEP' 

----- Fshirja e veturave me km me te medha se 200000
DELETE FROM Vetura
WHERE kmVetures > 200000 

----- Fshirja e te gjitha veturave me id me te madhe se 4 te markes vw
DELETE FROM Vetura
WHERE idVetura > 4 AND kodiMarkes = 'VW'

----- Fshirja e te gjitha veturave me id 3
DELETE FROM Vetura
WHERE idVetura = 3 

----- Fshirja e te gjithe klienteve me emrin Chris
DELETE FROM Klienti
WHERE emri LIKE 'Chris' 

----- Fshirja e te gjithe klienteve me emrin Chris
DELETE FROM Klienti
WHERE mbiemri LIKE 'Wilson' 

------ Fshirja e klienteve te cilet posedojne nr Telefoni te operatorit IPKO (43)
DELETE FROM Klienti
WHERE nrKontaktit BETWEEN 43000000 AND 43999999

------ Fshirja e nr te kontaktit te deges D001 per numrin e dyte
DELETE FROM nrKontaktitDega
WHERE idDega = 'D001' AND nrTel = '44123457'

------ Fshirja e markave emri i te cilave fillon me M
DELETE FROM Marka
WHERE kodiMarkes LIKE 'M%' 