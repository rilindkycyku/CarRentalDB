

# DorezimiVeturesNgaKlienti
# Replace these with your actual data from the PagesaQerasVetures and Vetura tables
DorezimiVeturesNgaKlienti = [
    (1, 'TOYOTA', 2),
(2, 'KIA', 3)	 ,
(3, 'VW', 2)	 ,
(4, 'TOYOTA', 6) ,
(5, 'AUDI', 3)	 ,
(6, 'HONDA', 2)	 ,
(7, 'TOYOTA', 2) ,
(8, 'AUDI', 3)	 ,
(9, 'FORD', 1)	 ,
(10, 'MAZDA', 1) ,
(11, 'NISSAN', 3),
(12, 'MAZDA', 2) ,
(13, 'BMW', 2)	 ,
(14, 'MINI', 3)	 ,
(15, 'BMW', 3)	 ,
(16, 'HONDA', 2) ,
(17, 'FORD', 2)	 ,
(18, 'MINI', 5)	 ,
(19, 'FORD', 2)	 ,
(20, 'TOYOTA', 5),
(21, 'MINI', 3)	 ,
(22, 'BENZ', 2)	 ,
(23, 'TOYOTA', 6),
(24, 'MINI', 5)	 ,
(25, 'JAGUAR', 1),
(26, 'BMW', 2)	 ,
(27, 'MINI', 2)	 ,
(28, 'BMW', 2)	 ,
(29, 'TOYOTA', 6),
(30, 'TOYOTA', 6),
(31, 'JAGUAR', 2),
(32, 'BENZ', 2)	 ,
(33, 'FORD', 3)	 ,
(34, 'MAZDA', 2) ,
(35, 'VW', 1)	 ,
(36, 'NISSAN', 3),
(37, 'FORD', 2)	 ,
(38, 'NISSAN', 2),
(39, 'JAGUAR', 3),
(40, 'MINI', 5)	 ,
(41, 'VW', 2)	 ,
(42, 'FORD', 2)	 ,
(43, 'VW', 5)	 ,
(44, 'FORD', 3)	 ,
(45, 'VW', 4)	 ,
(46, 'LEXUS', 2) ,
(47, 'LEXUS', 2) ,
(48, 'BMW', 3)	 ,
(49, 'MINI', 4)	 ,
(50, 'FORD', 3)	 ,
(51, 'HONDA', 1) ,
(52, 'NISSAN', 1),
(53, 'HONDA', 1) ,
(54, 'VW', 4)	 ,
(55, 'LEXUS', 1),
(56, 'HYUNDAI', 1),
(57, 'FORD', 2)	  ,
(58, 'FORD', 2)	  ,
(59, 'MAZDA', 2)  ,
(60, 'TOYOTA', 3) ,
(61, 'VW', 1)	  ,
(62, 'MINI', 2)	  ,
(63, 'MAZDA', 1)  ,
(64, 'MINI', 5)	  ,
(65, 'FORD', 3)	  ,
(66, 'TOYOTA', 1) ,
(67, 'HONDA', 1)  ,
(68, 'LEXUS', 3)  ,
(69, 'MINI', 5)	  ,
(70, 'KIA', 2)
]

# Generate the INSERT INTO statements
statements = []
for i,(nrDorezimit,kodiMarkes,idVetura) in enumerate(DorezimiVeturesNgaKlienti):
    # Select a random row from the Vetura data
 


    # Generate an INSERT INTO statement

    statement = f"INSERT INTO EvidentimiDorezimit (nrEvidentimit,nrDorezimit,kodiMarkes,idVetura) VALUES ({i+1}, {nrDorezimit}, '{kodiMarkes}', {idVetura})"
    statements.append(statement)

# Print the generated statements
print('\n'.join(statements))

